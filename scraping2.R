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

get_genres(find_by_title(""))