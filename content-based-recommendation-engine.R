library(data.table)
library(readr)
library(proxy)

#movies <- read_csv("D:/ACAP/FYP/R/Recommender Apps/Recommender Engine/ml-latest-small/ml-latest-small/movies.csv")
#View(movies)
#ratings <- read_csv("D:/ACAP/FYP/R/Recommender Apps/Recommender Engine/ml-latest-small/ml-latest-small/ratings.csv")
#View(ratings)
#install.packages('rsconnect')

movie_recommendation <- function(){
  
  #assign movies and ratings
  movies <- movie_iflix
  ratings <- user_rating
  
  #sort genre
  genres2 <- as.data.frame(movies$genre1, stringsAsFactors=FALSE)
  genres2$genre2 <- movies$genre2
  genres2$genre3 <- movies$genre3
  colnames(genres2) <- c(1:3)
  
  #get unique genres from all movies
  #unique_genre1 <- NULL
  #all_genre <- c(genres2$`1`,genres2$`2`,genres2$`3`)
  #unique_genre1 <- as.data.frame(all_genre, stringsAsFactors=FALSE)
  #unique_genre <- unique(unique_genre1)
  #rownames(unique_genre) <- NULL
  
  #produce genre matrix
  genre_list <- c("Action","Drama","Animation","Game-Show","Crime","Documentary","Fantasy","Horror","Biography","Adventure","Short","Comedy","Family","Music","Romance","Thriller","Mystery","Musical","Talk-Show","Sci-Fi","Reality-TV","History","Western","Sport","War","Film-Noir")
  genre_matrix <- matrix(0,nrow(movie_iflix)+1,nrow(unique_genre))
  genre_matrix[1,] <- genre_list
  colnames(genre_matrix) <- genre_list
  
  #iterate through matrix
  for (i in 1:nrow(genres2)) {
    for (c in 1:ncol(genres2)) {
      genmat_col = which(genre_matrix[1,] == genres2[i,c])
      genre_matrix[i+1,genmat_col] <- 1
    }
  }
  
  #convert into dataframe
  genre_matrix2 <- as.data.frame(genre_matrix[-1,], stringsAsFactors=FALSE) #remove first row, which was the genre list
  for (c in 1:ncol(genre_matrix2)) {
    genre_matrix2[,c] <- as.integer(genre_matrix2[,c])
  } #convert from characters to integers
  
  #======done for genre matrix ==============
  
  #assign movieId on each movie
  rating_movieId <- NULL
  rating_movieId <- movie_iflix[movie_iflix$movie_title %in% ratings$selected_movie, ]
  rating_movieId <- rating_movieId[!duplicated(rating_movieId[,2]),] #remove duplicate movies
  ratings$movieId <- rating_movieId$movieId
  ratings <- ratings[,-1]
  ratings$userId <- c(1)
  ratings <- ratings[,c("userId", "movieId", "selected_rating")]
  
  ratings[, 3] <- as.numeric(as.character( ratings[, 3] ))
  for (i in 1:nrow(ratings)){
    if (ratings[i,3] > 3){
      ratings[i,3] <- 1
    }
    else{
      ratings[i,3] <- -1
    }
  }
  
  allmovie_rating <- NULL
  allmovie_rating <- as.data.frame(movie_iflix$movieId, stringsAsFactors=FALSE)
  allmovie_rating$userId <- c(1)
  allmovie_rating$selected_rating <- NA
  colnames(allmovie_rating) <- c("movieId", "userId", "selected_rating")
  allmovie_rating <- allmovie_rating[,c("userId", "movieId", "selected_rating")]
  
  for (i in 1:nrow(ratings)) {
    got_rating <<- which(ratings[i,2] == allmovie_rating[,2])
    allmovie_rating$selected_rating[got_rating] <- ratings$selected_rating[i]
  }
  

  #convert ratings into binary
  #binaryratings <- ratings
  binaryratings <- allmovie_rating
  #binaryratings[, 3] <- as.numeric(as.character( binaryratings[, 3] ))
  #for (i in 1:nrow(binaryratings)){
  #  if (binaryratings[i,3] > 3){
  #    binaryratings[i,3] <- 1
  #  }
  #  else{
  #    binaryratings[i,3] <- -1
  #  }
  #}
  
  binaryratings2 <- dcast(binaryratings, movieId~userId, value.var = "selected_rating", na.rm=FALSE)
  for (i in 1:ncol(binaryratings2)){
    binaryratings2[which(is.na(binaryratings2[,i]) == TRUE),i] <- 0
  }
  binaryratings2 = binaryratings2[,-1] #remove movieIds col. Rows are movieIds, cols are userIds
  
  #===== done for binary rating ======
  
  #Remove rows that are not rated from movies dataset
  movieIds <- length(unique(movie_iflix$movieId)) #9125
  ratingmovieIds <- length(unique(ratings$movieId)) #9066
  movies2 <- movie_iflix[-which((movieIds %in% ratingmovieIds) == FALSE),]
  rownames(movies2) <- NULL
  #Remove rows that are not rated from genre_matrix2
  genre_matrix3 <- genre_matrix2[-which((movieIds %in% ratingmovieIds) == FALSE),]
  rownames(genre_matrix3) <- NULL
  
  binaryratings2 <- as.data.frame(binaryratings2, stringsAsFactors=FALSE)
  
  #Calculate dot product for User Profiles
  result = matrix(0,nrow(unique_genre),2)
  for (c in 1:ncol(binaryratings2)){
    for (i in 1:ncol(genre_matrix3)){
      result[i,c] <- suppressWarnings(sum((genre_matrix3[,i]) * (binaryratings2[,c])))
      #result[i,c] <- sum((genre_matrix3[,i]) * (binaryratings2[,c]))
    }
  }
  
  #Convert to Binary scale
  for (i in 1:nrow(result)){
    if (result[i] > 0){
      result[i] <- 1
    }
    else {
      result[i] <- 0
    }
  }
  
  result2 <- result[,1] #First user's profile
  sim_mat <- rbind.data.frame(result2, genre_matrix3)
  sim_mat <- data.frame(lapply(sim_mat,function(x){as.integer(x)})) #convert data to type integer
  
  #Calculate Jaccard distance between user profile and all movies
  
  sim_results <- dist(sim_mat, method = "Jaccard")
  sim_results <- as.data.frame(as.matrix(sim_results[1:nrow(movie_iflix)]))
  rows <- which(sim_results == min(sim_results))
  
  movies[rows,]
  result3 <- as.data.frame(result2, stringsAsFactors=FALSE)
  result3$genres <- c("Action","Drama","Animation","Game-Show","Crime","Documentary","Fantasy","Horror","Biography","Adventure","Short","Comedy","Family","Music","Romance","Thriller","Mystery","Musical","Talk-Show","Sci-Fi","Reality-TV","History","Western","Sport","War","Film-Noir")
  #result3
  
  #Recommended movies
  recommended_movies <- as.data.frame(movies[rows,],stringsAsFactors=FALSE) 
  recommended_movies_view <- as.data.frame(recommended_movies$movie_title,stringsAsFactors=FALSE)
  colnames(recommended_movies_view) <- c("Title")
  recommended_movies_view$Info <- displayViewBtn(recommended_movies$imdbID)
  recommended_movies_view$Poster <- displayPoster(recommended_movies$poster)
  recommended_movies_view$Genre1 <- recommended_movies$genre1
  recommended_movies_view$Genre2 <- recommended_movies$genre2
  recommended_movies_view$Genre3 <- recommended_movies$genre3
  recommended_movies_view <- recommended_movies_view[,c("Poster","Title","Genre1", "Genre2", "Genre3","Info")]
  return(recommended_movies_view)
}




