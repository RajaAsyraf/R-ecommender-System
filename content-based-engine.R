library(readr)
library(data.table)

movies <- read_csv("D:/ACAP/FYP/R/Recommender Apps/Recommender Engine/ml-latest-small/ml-latest-small/movies.csv")
View(movies)
ratings <- read_csv("D:/ACAP/FYP/R/Recommender Apps/Recommender Engine/ml-latest-small/ml-latest-small/ratings.csv")
View(ratings)

#===============================================================================================

genres <- as.data.frame(movies$genres, stringsAsFactors=FALSE)

genres2 <- as.data.frame(tstrsplit(genres[,1], '[|]', type.convert=TRUE), stringsAsFactors=FALSE)
colnames(genres2) <- c(1:10)

#===============================================================================================

#genre_list <- c("Action", "Adventure", "Animation", "Children", "Comedy", "Crime","Documentary", "Drama", "Fantasy","Film-Noir", "Horror", "Musical", "Mystery","Romance","Sci-Fi", "Thriller", "War", "Western")

genre_list <- c("Adventure", "Comedy", "Action", "Drama", "Crime", "Children", "Mystery", "Documentary", "Animation", "Thriller", "Horror", "Fantasy", "Film-Noir", "Wester", "Romance", "Sci-fi", "Musical", "War", "Animation", "IMAX")


genre_matrix <- matrix(0,9126,20) #empty matrix
genre_matrix[1,] <- genre_list #set first row to genre list
colnames(genre_matrix) <- genre_list #set column names to genre list

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

#================================================================================================


binaryratings <- ratings
for (i in 1:nrow(binaryratings)){
  if (binaryratings[i,3] > 3){
    binaryratings[i,3] <- 1
  }
  else{
    binaryratings[i,3] <- -1
  }
}

#================================================================================================

binaryratings2 <- dcast(binaryratings, movieId~userId, value.var = "rating", na.rm=FALSE)
for (i in 1:ncol(binaryratings2)){
  binaryratings2[which(is.na(binaryratings2[,i]) == TRUE),i] <- 0
}
binaryratings2 = binaryratings2[,-1] #remove movieIds col. Rows are movieIds, cols are userIds

#================================================================================================

#Remove rows that are not rated from movies dataset
movieIds <- length(unique(movies$movieId)) #9125
ratingmovieIds <- length(unique(ratings$movieId)) #9066
movies2 <- movies[-which((movieIds %in% ratingmovieIds) == FALSE),]
rownames(movies2) <- NULL
#Remove rows that are not rated from genre_matrix2
genre_matrix3 <- genre_matrix2[-which((movieIds %in% ratingmovieIds) == FALSE),]
rownames(genre_matrix3) <- NULL

#===============================================================================================

#Calculate dot product for User Profiles
result = matrix(0,20,671)
for (c in 1:ncol(binaryratings2)){
  for (i in 1:ncol(genre_matrix3)){
    result[i,c] <- sum((genre_matrix3[,i]) * (binaryratings2[,c]))
  }
}

#Convert to Binary scale
for (i in 1:nrow(result)){
  if (result[i] < 0){
    result[i] <- 0
  }
  else {
    result[i] <- 1
  }
}


#=============================================================================================

result2 <- result[20,] #First user's profile

sim_mat <- rbind.data.frame(result2, genre_matrix3)
sim_mat <- data.frame(lapply(sim_mat,function(x){as.integer(x)})) #convert data to type integer

#Calculate Jaccard distance between user profile and all movies
library(proxy)
sim_results <- dist(sim_mat, method = "Jaccard")
sim_results <- as.data.frame(as.matrix(sim_results[1:9066]))
rows <- which(sim_results == min(sim_results))
#Recommended movies
movies[rows,2]

#============================================================================================

movies[rows,]
