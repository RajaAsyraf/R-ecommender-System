#============= START HERE [movie_top200] =============================================================================

#move data to dataframe ==================================

movie_top200 <- as.data.frame(Movie_Top200_Title$Text, stringsAsFactors=FALSE)

colnames(movie_top200) <- c("movie_title")

#/move data to dataframe =================================


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
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbtop200_2 <- matrix(0,165,2)
for (i in 1:nrow(movie_top200)) {
  imdbtop200 <- find_by_title(movie_top200$movie_title[i])
  imdbtop200_1 <- imdbtop200['imdbID']
  imdbtop200_1_poster <- imdbtop200['Poster']
  imdbtop200_2[i,1] <- matrix(unlist(imdbtop200_1), ncol = 1)
  imdbtop200_2[i,2] <- matrix(unlist(imdbtop200_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbtop200_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbtop200_3 <- as.data.frame(imdbtop200_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_top200$imdbID <- imdbtop200_3$imdbID
movie_top200$poster <- imdbtop200_3$poster


#display
movie_top200view <-  as.data.frame(movie_top200$movie_title, stringsAsFactors=FALSE)
colnames(movie_top200view) <- "Title"
movie_top200view$Movie_Id <- movie_top200$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]


#============= START HERE [movie_thriller] =============================================================================

#move data to dataframe ==================================

movie_thriller <- as.data.frame(Movie_Thriller_Title$Text, stringsAsFactors=FALSE)

colnames(movie_thriller) <- c("movie_title")

#/move data to dataframe =================================


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

#remove NA movie
movie_thriller <- movie_thriller[!(movie_thriller$genre1=="NA"),]
movie_thriller <- movie_thriller[!(movie_thriller$genre1=="N/A"),]

#reset rownumber
rownames(movie_thriller) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbthriller_2 <- matrix(0,87,2)
for (i in 1:nrow(movie_thriller)) {
  imdbthriller <- find_by_title(movie_thriller$movie_title[i])
  imdbthriller_1 <- imdbthriller['imdbID']
  imdbthriller_1_poster <- imdbthriller['Poster']
  imdbthriller_2[i,1] <- matrix(unlist(imdbthriller_1), ncol = 1)
  imdbthriller_2[i,2] <- matrix(unlist(imdbthriller_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbthriller_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbthriller_3 <- as.data.frame(imdbthriller_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_thriller$imdbID <- imdbthriller_3$imdbID
movie_thriller$poster <- imdbthriller_3$poster


#display
movie_thrillerview <-  as.data.frame(movie_thriller$movie_title, stringsAsFactors=FALSE)
colnames(movie_thrillerview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#============= START HERE [movie_drama] =============================================================================

#move data to dataframe ==================================

movie_drama <- as.data.frame(Movie_Drama_Title$Text, stringsAsFactors=FALSE)

colnames(movie_drama) <- c("movie_title")

#/move data to dataframe =================================


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

#remove NA movie
movie_drama <- movie_drama[!(movie_drama$genre1=="NA"),]
movie_drama <- movie_drama[!(movie_drama$genre1=="N/A"),]

#reset rownumber
rownames(movie_drama) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbdrama_2 <- matrix(0,303,2)
for (i in 1:nrow(movie_drama)) {
  imdbdrama <- find_by_title(movie_drama$movie_title[i])
  imdbdrama_1 <- imdbdrama['imdbID']
  imdbdrama_1_poster <- imdbdrama['Poster']
  imdbdrama_2[i,1] <- matrix(unlist(imdbdrama_1), ncol = 1)
  imdbdrama_2[i,2] <- matrix(unlist(imdbdrama_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbdrama_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbdrama_3 <- as.data.frame(imdbdrama_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_drama$imdbID <- imdbdrama_3$imdbID
movie_drama$poster <- imdbdrama_3$poster


#display
movie_dramaview <-  as.data.frame(movie_drama$movie_title, stringsAsFactors=FALSE)
colnames(movie_dramaview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#============= START HERE [movie_comedy] =============================================================================

#move data to dataframe ==================================

movie_comedy <- as.data.frame(Movie_Comedy_Title$Text, stringsAsFactors=FALSE)

colnames(movie_comedy) <- c("movie_title")

#/move data to dataframe =================================


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

#remove NA movie
movie_comedy <- movie_comedy[!(movie_comedy$genre1=="NA"),]
movie_comedy <- movie_comedy[!(movie_comedy$genre1=="N/A"),]

#reset rownumber
rownames(movie_comedy) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbcomedy_2 <- matrix(0,257,2)
for (i in 1:nrow(movie_comedy)) {
  imdbcomedy <- find_by_title(movie_comedy$movie_title[i])
  imdbcomedy_1 <- imdbcomedy['imdbID']
  imdbcomedy_1_poster <- imdbcomedy['Poster']
  imdbcomedy_2[i,1] <- matrix(unlist(imdbcomedy_1), ncol = 1)
  imdbcomedy_2[i,2] <- matrix(unlist(imdbcomedy_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbcomedy_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbcomedy_3 <- as.data.frame(imdbcomedy_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_comedy$imdbID <- imdbcomedy_3$imdbID
movie_comedy$poster <- imdbcomedy_3$poster


#display
movie_comedyview <-  as.data.frame(movie_comedy$movie_title, stringsAsFactors=FALSE)
colnames(movie_comedyview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#============= START HERE [movie_action] =============================================================================

#move data to dataframe ==================================

movie_action <- as.data.frame(Movie_Action_Title$Text, stringsAsFactors=FALSE)

colnames(movie_action) <- c("movie_title")

#/move data to dataframe =================================


#=============== get genre of each movies AUTO all movies ======

genre3action <- matrix(0,172,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_action)) {
  genre1action <- get_genres(find_by_title(movie_action$movie_title[i]))
  if(!is.null(genre1action[i])){
    genre3action[i,] <- matrix(unlist(genre1action), ncol = 3, byrow = TRUE)
  }else{
    genre3action[i,] <- "NA"
  }
}

#set columns name
colnames(genre3action) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4action <- as.data.frame(genre3action, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_action$genre1 <- genre4action$movie_genre1
movie_action$genre2 <- genre4action$movie_genre2
movie_action$genre3 <- genre4action$movie_genre3

#remove NA movie
movie_action <- movie_action[!(movie_action$genre1=="NA"),]
movie_action <- movie_action[!(movie_action$genre1=="N/A"),]

#reset rownumber
rownames(movie_action) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid & poster ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbaction_2 <- matrix(0,159,2)
for (i in 1:nrow(movie_action)) {
  imdbaction <- find_by_title(movie_action$movie_title[i])
  imdbaction_1 <- imdbaction['imdbID']
  imdbaction_1_poster <- imdbaction['Poster']
  imdbaction_2[i,1] <- matrix(unlist(imdbaction_1), ncol = 1)
  imdbaction_2[i,2] <- matrix(unlist(imdbaction_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbaction_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbaction_3 <- as.data.frame(imdbaction_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_action$imdbID <- imdbaction_3$imdbID
movie_action$poster <- imdbaction_3$poster


#display
movie_actionview <-  as.data.frame(movie_action$movie_title, stringsAsFactors=FALSE)
colnames(movie_actionview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#============= START HERE [movie_horror] =============================================================================

#move data to dataframe ==================================

movie_horror <- as.data.frame(Movie_Horror_Title$Text, stringsAsFactors=FALSE)

colnames(movie_horror) <- c("movie_title")

#/move data to dataframe =================================


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

#remove NA movie
movie_horror <- movie_horror[!(movie_horror$genre1=="NA"),]
movie_horror <- movie_horror[!(movie_horror$genre1=="N/A"),]

#reset rownumber
rownames(movie_horror) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid & poster ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbhorror_2 <- matrix(0,94,2)
for (i in 1:nrow(movie_horror)) {
  imdbhorror <- find_by_title(movie_horror$movie_title[i])
  imdbhorror_1 <- imdbhorror['imdbID']
  imdbhorror_1_poster <- imdbhorror['Poster']
  imdbhorror_2[i,1] <- matrix(unlist(imdbhorror_1), ncol = 1)
  imdbhorror_2[i,2] <- matrix(unlist(imdbhorror_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbhorror_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbhorror_3 <- as.data.frame(imdbhorror_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_horror$imdbID <- imdbhorror_3$imdbID
movie_horror$poster <- imdbhorror_3$poster


#display
movie_horrorview <-  as.data.frame(movie_horror$movie_title, stringsAsFactors=FALSE)
colnames(movie_horrorview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#============= START HERE [movie_romance] =============================================================================

#move data to dataframe ==================================

movie_romance <- as.data.frame(Movie_Romance_Title$Text, stringsAsFactors=FALSE)

colnames(movie_romance) <- c("movie_title")

#/move data to dataframe =================================


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

#remove NA movie
movie_romance <- movie_romance[!(movie_romance$genre1=="NA"),]
movie_romance <- movie_romance[!(movie_romance$genre1=="N/A"),]
movie_romance <- movie_romance[!(movie_romance$genre1==0),]

#reset rownumber
rownames(movie_romance) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid & poster ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbromance_2 <- matrix(0,92,2)
for (i in 1:nrow(movie_romance)) {
  imdbromance <- find_by_title(movie_romance$movie_title[i])
  imdbromance_1 <- imdbromance['imdbID']
  imdbromance_1_poster <- imdbromance['Poster']
  imdbromance_2[i,1] <- matrix(unlist(imdbromance_1), ncol = 1)
  imdbromance_2[i,2] <- matrix(unlist(imdbromance_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbromance_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbromance_3 <- as.data.frame(imdbromance_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_romance$imdbID <- imdbromance_3$imdbID
movie_romance$poster <- imdbromance_3$poster


#display
movie_romanceview <-  as.data.frame(movie_romance$movie_title, stringsAsFactors=FALSE)
colnames(movie_romanceview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#============= START HERE [movie_family] =============================================================================

#move data to dataframe ==================================

movie_family <- as.data.frame(Movie_Family_Title$Text, stringsAsFactors=FALSE)

colnames(movie_family) <- c("movie_title")

#/move data to dataframe =================================


#=============== get genre of each movies AUTO all movies ======

genre3family <- matrix(0,76,3)
#get movie genre, put inside matrix
for (i in 1:nrow(movie_family)) {
  genre1family <- get_genres(find_by_title(movie_family$movie_title[i]))
  if(!is.null(genre1family[i])){
    genre3family[i,] <- matrix(unlist(genre1family), ncol = 3, byrow = TRUE)
  }else{
    genre3family[i,] <- "NA"
  }
}

#set columns name
colnames(genre3family) <- c("movie_genre1","movie_genre2","movie_genre3")

#convert genre3 matrix into data frame genre4
genre4family <- as.data.frame(genre3family, stringsAsFactors=FALSE)

#add column genre1-3 to movie_action data frame
movie_family$genre1 <- genre4family$movie_genre1
movie_family$genre2 <- genre4family$movie_genre2
movie_family$genre3 <- genre4family$movie_genre3

#remove NA movie
movie_family <- movie_family[!(movie_family$genre1=="NA"),]
movie_family <- movie_family[!(movie_family$genre1=="N/A"),]

#reset rownumber
rownames(movie_family) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid & poster ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbfamily_2 <- matrix(0,65,2)
for (i in 1:nrow(movie_family)) {
  imdbfamily <- find_by_title(movie_family$movie_title[i])
  imdbfamily_1 <- imdbfamily['imdbID']
  imdbfamily_1_poster <- imdbfamily['Poster']
  imdbfamily_2[i,1] <- matrix(unlist(imdbfamily_1), ncol = 1)
  imdbfamily_2[i,2] <- matrix(unlist(imdbfamily_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbfamily_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbfamily_3 <- as.data.frame(imdbfamily_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_family$imdbID <- imdbfamily_3$imdbID
movie_family$poster <- imdbfamily_3$poster


#display
movie_familyview <-  as.data.frame(movie_family$movie_title, stringsAsFactors=FALSE)
colnames(movie_familyview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]


#============= START HERE [movie_scifi] =============================================================================

#move data to dataframe ==================================

movie_scifi <- as.data.frame(Movie_Sci_fi_Title$Text, stringsAsFactors=FALSE)

colnames(movie_scifi) <- c("movie_title")

#/move data to dataframe =================================


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

#remove NA movie
movie_scifi <- movie_scifi[!(movie_scifi$genre1=="NA"),]
movie_scifi <- movie_scifi[!(movie_scifi$genre1=="N/A"),]

#reset rownumber
rownames(movie_scifi) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid & poster ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbscifi_2 <- matrix(0,49,2)
for (i in 1:nrow(movie_scifi)) {
  imdbscifi <- find_by_title(movie_scifi$movie_title[i])
  imdbscifi_1 <- imdbscifi['imdbID']
  imdbscifi_1_poster <- imdbscifi['Poster']
  imdbscifi_2[i,1] <- matrix(unlist(imdbscifi_1), ncol = 1)
  imdbscifi_2[i,2] <- matrix(unlist(imdbscifi_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbscifi_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbscifi_3 <- as.data.frame(imdbscifi_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_scifi$imdbID <- imdbscifi_3$imdbID
movie_scifi$poster <- imdbscifi_3$poster


#display
movie_scifiview <-  as.data.frame(movie_scifi$movie_title, stringsAsFactors=FALSE)
colnames(movie_scifiview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]

#============= START HERE [movie_crime] =============================================================================

#move data to dataframe ==================================

movie_crime <- as.data.frame(Movie_Crime_Title$Text, stringsAsFactors=FALSE)

colnames(movie_crime) <- c("movie_title")

#/move data to dataframe =================================


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

#remove NA movie
movie_crime <- movie_crime[!(movie_crime$genre1=="NA"),]
movie_crime <- movie_crime[!(movie_crime$genre1=="N/A"),]

#reset rownumber
rownames(movie_crime) <- NULL

#to rearrange data frame column
movie_top200 <- movie_top200[,c("movie_title", "genre1", "genre2", "genre3")]

#/============= get genre of each movies AUTO all movies ========




#get imdbid & poster ==============================================

title <- find_by_title(movie_top200$movie_title[21]) #manual one by one
title_imdbid <- title$imdbID #manual one by one


imdbcrime_2 <- matrix(0,69,2)
for (i in 1:nrow(movie_crime)) {
  imdbcrime <- find_by_title(movie_crime$movie_title[i])
  imdbcrime_1 <- imdbcrime['imdbID']
  imdbcrime_1_poster <- imdbcrime['Poster']
  imdbcrime_2[i,1] <- matrix(unlist(imdbcrime_1), ncol = 1)
  imdbcrime_2[i,2] <- matrix(unlist(imdbcrime_1_poster), ncol = 1)
  #if(!is.null(imdbtop200[i])){
  #  imdbtop200_2[i,] <- matrix(unlist(imdbtop200_1), ncol = 1)
  #}else{
  #  imdbtop200_2[i,] <- "NA"
  #}
}
colnames(imdbcrime_2) <- c("imdbID","poster")

#/get imdbid ==============================================

#convert to dataframe
imdbcrime_3 <- as.data.frame(imdbcrime_2, stringsAsFactors=FALSE)

#combine imdbid with all data
movie_crime$imdbID <- imdbcrime_3$imdbID
movie_crime$poster <- imdbcrime_3$poster


#display
movie_crimeview <-  as.data.frame(movie_crime$movie_title, stringsAsFactors=FALSE)
colnames(movie_crimeview) <- "Title"
movie_thrillerview$Movie_Id <- movie_thriller$movie_id
movie_top200view <- movie_top200view[,c("Movie_Id", "Title")]


#==============combine all movie categories=======================
movie_iflix <- NULL
movie_iflix <- rbind(movie_action,movie_comedy)
movie_iflix <- rbind(movie_iflix,movie_crime)
movie_iflix <- rbind(movie_iflix,movie_drama)
movie_iflix <- rbind(movie_iflix,movie_family)
movie_iflix <- rbind(movie_iflix,movie_horror)
movie_iflix <- rbind(movie_iflix,movie_romance)
movie_iflix <- rbind(movie_iflix,movie_scifi)
movie_iflix <- rbind(movie_iflix,movie_thriller)
movie_iflix <- rbind(movie_iflix,movie_top200)

movie_iflix$movieId <- c(1:nrow(movie_iflix))
movie_iflix <- movie_iflix[,c("movieId", "movie_title", "genre1", "genre2", "genre3", "imdbID", "poster")]

movie_iflixview <-  as.data.frame(movie_iflix$movie_title, stringsAsFactors=FALSE)
colnames(movie_iflixview) <- "Title"
