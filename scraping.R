install.packages('devtools')
packageVersion("omdbapi")
install.packages('pbapply')
devtools::install_github("hrbrmstr/omdbapi")

library(omdbapi)
library(dplyr)
library(pbapply)

search_by_title("Captain America")
search_by_title("Captain America", page = 2)
search_by_title("Starship Troopers")
games <- search_by_title("Captain America", type="game")

glimpse(games)
glimpse(games$Title[1])
glimpse(games$imdbID[1])

find_by_title(games$Title[1])
GOT <- find_by_title("Game of Thrones", type="series", season=1, episode=1)
glimpse(GOT)
glimpse(GOT$Year)

get_genres(find_by_title("London Love Story"))

genre_list <- c("Action", "Adventure", "Animation", "Children", "Comedy", "Crime","Documentary", "Drama", "Fantasy","Film-Noir", "Horror", "Musical", "Mystery","Romance","Sci-Fi", "Thriller", "War", "Western")

get_genres(find_by_title(Movie_Action_Title$Text[1]))

#============= START HERE [movie_action] =============================================================================

#add movie id =====================================================================

movie_action <- as.data.frame(Movie_Action_Title$Text, stringsAsFactors=FALSE)
colnames(movie_action) <- c("movie_title", "movie_id", "movie_category")
for (i in 1:nrow(Movie_Action_Title)) {
  movie_action$movie_id <- c(1:172)
}
#/add movie id ===================================================================


#============== get genre of each movies ======================
# one by one

genre_matrix <- matrix(0,172,5)

genre1 <- get_genres(find_by_title(movie_action$movie_title[29]))
genre2 <- as.data.frame(tstrsplit(genre1, '["]', type.convert=TRUE), stringsAsFactors=FALSE)
genre3 <- matrix(unlist(genre1), ncol = 3, byrow = TRUE)

genre1 <- get_genres(find_by_title(movie_action$movie_title[1]))
genre3[2,] <- matrix(unlist(genre1), ncol = 3, byrow = TRUE)

#/============== get genre of each movies ======================


#=============== get genre of each movies AUTO all movies ======

#get movie genre, put inside matrix
for (i in 1:nrow(movie_action)) {
  genre1 <- get_genres(find_by_title(movie_action$movie_title[i]))
  if(!is.null(genre1[i])){
    genre3[i,] <- matrix(unlist(genre1), ncol = 3, byrow = TRUE)
  }else{
    genre3[i,] <- "NA"
  }
}

#set columns name
colnames(genre3) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4 <- as.data.frame(genre3, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_action$genre1 <- genre4$movie_genre1
movie_action$genre2 <- genre4$movie_genre2
movie_action$genre3 <- genre4$movie_genre3

#to rearrange data frame column
movie_action <- movie_action[,c("movie_id", "movie_title", "movie_category", "genre1", "genre2", "genre3")]

#to delete movie_category column
movie_action[["movie_category"]] <- NULL

#/============= get genre of each movies AUTO all movies ========


#============= START HERE [movie_comedy] =============================================================================

#add movie id =====================================================================

movie_comedy <- as.data.frame(Movie_Comedy_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Comedy_Title)) {
  movie_comedy$movie_id <- c(173:583)
}
colnames(movie_comedy) <- c("movie_title", "movie_id")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3comedy <- matrix(0,411,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_comedy)) {
  genre1comedy <- get_genres(find_by_title(movie_comedy$movie_title[i]))
  if(!is.null(genre1comedy[i])){
    genre3comedy[i,] <- matrix(unlist(genre1comedy), ncol = 3, byrow = TRUE)
  }else{
    genre3comedy[i,] <- "NA"
  }
}

#set columns name
colnames(genre3comedy) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4comedy <- as.data.frame(genre3comedy, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_comedy$genre1 <- genre4comedy$movie_genre1
movie_comedy$genre2 <- genre4comedy$movie_genre2
movie_comedy$genre3 <- genre4comedy$movie_genre3

#to rearrange data frame column
movie_comedy <- movie_comedy[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#============= START HERE [movie_crime] =============================================================================

#add movie id =====================================================================

movie_crime <- as.data.frame(Movie_Crime_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Crime_Title)) {
  movie_crime$movie_id <- c(584:655)
}
colnames(movie_crime) <- c("movie_title", "movie_id")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3crime <- matrix(0,72,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_crime)) {
  genre1crime <- get_genres(find_by_title(movie_crime$movie_title[i]))
  if(!is.null(genre1crime[i])){
    genre3crime[i,] <- matrix(unlist(genre1crime), ncol = 3, byrow = TRUE)
  }else{
    genre3crime[i,] <- "NA"
  }
}

#set columns name
colnames(genre3crime) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4crime <- as.data.frame(genre3crime, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_crime$genre1 <- genre4crime$movie_genre1
movie_crime$genre2 <- genre4crime$movie_genre2
movie_crime$genre3 <- genre4crime$movie_genre3

#to rearrange data frame column
movie_crime <- movie_crime[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#============= START HERE [movie_drama] =============================================================================

#add movie id =====================================================================

movie_drama <- as.data.frame(Movie_Drama_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Drama_Title)) {
  movie_drama$movie_id <- c(656:1348)
}
colnames(movie_drama) <- c("movie_title", "movie_id")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3drama <- matrix(0,693,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_drama)) {
  genre1drama <- get_genres(find_by_title(movie_drama$movie_title[i]))
  if(!is.null(genre1drama[i])){
    genre3drama[i,] <- matrix(unlist(genre1drama), ncol = 3, byrow = TRUE)
  }else{
    genre3drama[i,] <- "NA"
  }
}

#set columns name
colnames(genre3drama) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4drama <- as.data.frame(genre3drama, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_drama$genre1 <- genre4drama$movie_genre1
movie_drama$genre2 <- genre4drama$movie_genre2
movie_drama$genre3 <- genre4drama$movie_genre3

#to rearrange data frame column
movie_drama <- movie_drama[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#============= START HERE [movie_horror] =============================================================================

#add movie id =====================================================================

movie_horror <- as.data.frame(Movie_Horror_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Horror_Title)) {
  movie_horror$movie_id <- c(1425:1526)
}
colnames(movie_horror) <- c("movie_title", "movie_id")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3horror <- matrix(0,102,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_horror)) {
  genre1horror <- get_genres(find_by_title(movie_horror$movie_title[i]))
  if(!is.null(genre1horror[i])){
    genre3horror[i,] <- matrix(unlist(genre1horror), ncol = 3, byrow = TRUE)
  }else{
    genre3horror[i,] <- "NA"
  }
}

#set columns name
colnames(genre3horror) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4horror <- as.data.frame(genre3horror, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_horror$genre1 <- genre4horror$movie_genre1
movie_horror$genre2 <- genre4horror$movie_genre2
movie_horror$genre3 <- genre4horror$movie_genre3

#to rearrange data frame column
movie_horror <- movie_horror[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#============= START HERE [movie_romance] =============================================================================

#add movie id =====================================================================

movie_romance <- as.data.frame(Movie_Romance_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Romance_Title)) {
  movie_romance$movie_id <- c(1527:1847)
}
colnames(movie_romance) <- c("movie_title", "movie_id")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3romance <- matrix(0,321,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_romance)) {
  genre1romance <- get_genres(find_by_title(movie_romance$movie_title[i]))
  if(!is.null(genre1romance[i])){
    genre3romance[i,] <- matrix(unlist(genre1romance), ncol = 3, byrow = TRUE)
  }else{
    genre3romance[i,] <- "NA"
  }
}

#set columns name
colnames(genre3romance) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4romance <- as.data.frame(genre3romance, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_romance$genre1 <- genre4romance$movie_genre1
movie_romance$genre2 <- genre4romance$movie_genre2
movie_romance$genre3 <- genre4romance$movie_genre3

#to rearrange data frame column
movie_romance <- movie_romance[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#============= START HERE [movie_scifi] =============================================================================

#add movie id =====================================================================

movie_scifi <- as.data.frame(Movie_Sci_fi_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Sci_fi_Title)) {
  movie_scifi$movie_id <- c(1848:1897)
}
colnames(movie_scifi) <- c("movie_title", "movie_id")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3scifi <- matrix(0,50,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_scifi)) {
  genre1scifi <- get_genres(find_by_title(movie_scifi$movie_title[i]))
  if(!is.null(genre1scifi[i])){
    genre3scifi[i,] <- matrix(unlist(genre1scifi), ncol = 3, byrow = TRUE)
  }else{
    genre3scifi[i,] <- "NA"
  }
}

#set columns name
colnames(genre3scifi) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4scifi <- as.data.frame(genre3scifi, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_scifi$genre1 <- genre4scifi$movie_genre1
movie_scifi$genre2 <- genre4scifi$movie_genre2
movie_scifi$genre3 <- genre4scifi$movie_genre3

#to rearrange data frame column
movie_scifi <- movie_scifi[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#============= START HERE [movie_thriller] =============================================================================

#add movie id =====================================================================

movie_thriller <- as.data.frame(Movie_Thriller_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Thriller_Title)) {
  movie_thriller$movie_id <- c(1898:1987)
}
colnames(movie_thriller) <- c("movie_title", "movie_id")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3thriller <- matrix(0,90,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_thriller)) {
  genre1thriller <- get_genres(find_by_title(movie_thriller$movie_title[i]))
  if(!is.null(genre1thriller[i])){
    genre3thriller[i,] <- matrix(unlist(genre1thriller), ncol = 3, byrow = TRUE)
  }else{
    genre3thriller[i,] <- "NA"
  }
}

#set columns name
colnames(genre3thriller) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4thriller <- as.data.frame(genre3thriller, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_thriller$genre1 <- genre4thriller$movie_genre1
movie_thriller$genre2 <- genre4thriller$movie_genre2
movie_thriller$genre3 <- genre4thriller$movie_genre3

#to rearrange data frame column
movie_thriller <- movie_thriller[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#============= START HERE [movie_top200] =============================================================================

#add movie id =====================================================================

movie_top200 <- as.data.frame(Movie_Top200_Title$Text, stringsAsFactors=FALSE)
for (i in 1:nrow(Movie_Top200_Title)) {
  movie_top200$movie_id <- c(1988:2187)
}
colnames(movie_top200) <- c("movie_title")
#/add movie id ===================================================================


#=============== get genre of each movies AUTO all movies ======

genre3top200 <- matrix(0,200,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_top200)) {
  genre1top200 <- get_genres(find_by_title(movie_top200$movie_title[i]))
  if(!is.null(genre1top200[i])){
    genre3top200[i,] <- matrix(unlist(genre1top200), ncol = 3, byrow = TRUE)
  }else{
    genre3top200[i,] <- "NA"
  }
}

#set columns name
colnames(genre3top200) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4top200 <- as.data.frame(genre3top200, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_top200$genre1 <- genre4top200$movie_genre1
movie_top200$genre2 <- genre4top200$movie_genre2
movie_top200$genre3 <- genre4top200$movie_genre3

#remove NA movie
movie_top200 <- movie_top200[!(movie_top200$genre1=="NA"),]
movie_top200 <- movie_top200[!(movie_top200$genre1=="N/A"),]

#reset rownumber
rownames(movie_top200) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_id", "movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========

#bind dataframe

movie_iflix <- rbind(movie_action,movie_comedy)
movie_iflix <- rbind(movie_iflix,movie_crime)
movie_iflix <- rbind(movie_iflix,movie_drama)
movie_iflix <- rbind(movie_iflix,movie_family)
movie_iflix <- rbind(movie_iflix,movie_horror)
movie_iflix <- rbind(movie_iflix,movie_romance)
movie_iflix <- rbind(movie_iflix,movie_scifi)
movie_iflix <- rbind(movie_iflix,movie_thriller)
movie_iflix <- rbind(movie_iflix,movie_top200)

movie_top200view <-  as.data.frame(movie_top200$movie_title, stringsAsFactors=FALSE)
movie_top200view$Movie_Id <- movie_top200$movie_id
colnames(movie_top200view) <- "Title"
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#test imdbid ==============================================
title <- find_by_title(movie_top200$movie_title[21])
title_imdbid <- title$imdbID


imdbtop200_2 <- matrix(0,165,1)
for (i in 1:nrow(movie_top200)) {
  imdbtop200 <- find_by_title(movie_top200$movie_title[i])
  imdbtop200_1 <- imdbtop200['imdbID']
  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}

#put name to column
colnames(imdbtop200_2) <- c("imdbID")

#test imdbid ==============================================

# remove NA genre ===================================================
movie_top200 <- movie_top200[-8,]
movie_top200_final <-NULL

#replace NA / N/A as 0
title_wotNA <- matrix(0,172,1)
for (i in 1:nrow(movie_top200)) {
  genretest <- movie_top200$genre1[i]
  if(genretest != "NA" && genretest != "N/A"){
    title_wotNA[i,] <- matrix(unlist(genretest), ncol = 1, byrow = TRUE)
  }
}
colnames(title_wotNA) <- c("genre")
title_wotNA2 <- as.data.frame(title_wotNA, stringsAsFactors=FALSE)

#remove 0 in genre
title_wotNA2 <- title_wotNA2[!(title_wotNA2$genre==0),]
title_wotNA3 <- as.data.frame(title_wotNA2, stringsAsFactors = FALSE)

# /remove NA genre ==================================================


