library(shiny)
library(shinydashboard)

displayViewBtn <- function(val) {
  paste0('<a href="http://www.imdb.com/title/',val,'" target="_blank" class="btn btn-primary">IMDB Info</a>')
}

displayPoster <- function(val) {
  paste0('<img src="',val,'" alt="Image from IMDb is not available." height="150" width="100">')
}

displayPoster2 <- function(val) {
  paste0('<img src="',val,'" alt="Image from IMDb is not available." height="250" width="180">')
}

displayStar <- function(val) {
  sprintf(paste('<span class="rating">
                  <input type="radio" class="rating-input"
                  id="rating-input-1-5-',val,'" name="rating-input-',val,'">
                  <label for="rating-input-1-5-',val,'" class="rating-star"></label>
      
                  <input type="radio" class="rating-input"
                  id="rating-input-1-4-',val,'" name="rating-input-',val,'">
                  <label for="rating-input-1-4-',val,'" class="rating-star"></label>
      
                  <input type="radio" class="rating-input"
                  id="rating-input-1-3-',val,'" name="rating-input-',val,'">
                  <label for="rating-input-1-3-',val,'" class="rating-star"></label>
      
                  <input type="radio" class="rating-input"
                  id="rating-input-1-2-',val,'" name="rating-input-',val,'">
                  <label for="rating-input-1-2-',val,'" class="rating-star"></label>
      
                  <input type="radio" class="rating-input"
                  id="rating-input-1-1-',val,'" name="rating-input-',val,'">
                  <label for="rating-input-1-1-',val,'" class="rating-star"></label>
      
                </span>'))
}

displayStar2 <- function(){
  radioButtons("star", "Star", c("1star" = "1", "2star"="2"))
}

displayWatchedBtn <- function(val) {
  sprintf('<a href="" target="_blank" class="btn btn-primary">Watched</a>',val)
}


shinyServer(function(input, output,session) {
  
  #=========================== home =====================================
  output$welcome <- renderUI({
    p(h4("Welcome to R-ecommender!"),
      "The content-based recommendation system is running on R programming language with integration of web application using Shiny.")
  })
  
  #========================= rating =====================================
 
  output$title_selected <- renderText({
    input$select_movie
  })
  
  output$poster_selected <- reactive({
    poster <- displayPoster2(movie_iflix[(movie_iflix$movie_title == input$select_movie),6])
    return(poster)
  })
  
  #observeEvent(input$submit, {
  #  saveData(formData())
  #})
  
  #formData <- reactive({
  #  user_data <- sapply(fields, function(x) input[[x]])
  #  user_data
  #})
  
  output$user_data <- renderText({
    input$submit
    #loadData()
  })
  
  #========================= preference =================================
  output$preference <- renderUI({
    p(h4("Add your preferences."), 
      "You can also add your preferences of movies based on particular genre, actors, directors, year of production or imdb rating.",
      br(),
      br(),
      actionButton("btn_preference", label = "Preferences")
      )
  })
  
  #======================== browse =====================================
  output$action = renderDataTable({
    movie_actionview$Info <- displayViewBtn(movie_action$imdbID)
    movie_actionview$Poster <- displayPoster(movie_action$poster)
    movie_actionview <- movie_actionview[,c("Poster","Title","Info")]
    return(movie_actionview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$drama = renderDataTable({
    movie_dramaview$Info <- displayViewBtn(movie_drama$imdbID)
    movie_dramaview$Poster <- displayPoster(movie_drama$poster)
    movie_dramaview <- movie_dramaview[,c("Poster","Title","Info")]
    return(movie_dramaview)
  },escape = FALSE, options = list(pageLength = 10))
  output$comedy = renderDataTable({
    movie_comedyview$Info <- displayViewBtn(movie_comedy$imdbID)
    movie_comedyview$Poster <- displayPoster(movie_comedy$poster)
    movie_comedyview <- movie_comedyview[,c("Poster","Title","Info")]
    return(movie_comedyview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$horror = renderDataTable({
    movie_horrorview$Info <- displayViewBtn(movie_horror$imdbID)
    movie_horrorview$Poster <- displayPoster(movie_horror$poster)
    movie_horrorview <- movie_horrorview[,c("Poster","Title","Info")]
    return(movie_horrorview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$romance = renderDataTable({
    movie_romanceview$Info <- displayViewBtn(movie_romance$imdbID)
    movie_romanceview$Poster <- displayPoster(movie_romance$poster)
    movie_romanceview <- movie_romanceview[,c("Poster","Title","Info")]
    return(movie_romanceview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$family = renderDataTable({
    movie_familyview$Info <- displayViewBtn(movie_family$imdbID)
    movie_familyview$Poster <- displayPoster(movie_family$poster)
    movie_familyview <- movie_familyview[,c("Poster","Title","Info")]
    return(movie_familyview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$thriller = renderDataTable({
    movie_thrillerview$Info <- displayViewBtn(movie_thriller$imdbID)
    movie_thrillerview$Poster <- displayPoster(movie_thriller$poster)
    movie_thrillerview <- movie_thrillerview[,c("Poster","Title","Info")]
    return(movie_thrillerview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$sci_fi = renderDataTable({
    movie_scifiview$Info <- displayViewBtn(movie_scifi$imdbID)
    movie_scifiview$Poster <- displayPoster(movie_scifi$poster)
    movie_scifiview <- movie_scifiview[,c("Poster","Title","Info")]
    return(movie_scifiview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$crime = renderDataTable({
    movie_crimeview$Info <- displayViewBtn(movie_crime$imdbID)
    movie_crimeview$Poster <- displayPoster(movie_crime$poster)
    movie_crimeview <- movie_crimeview[,c("Poster","Title","Info")]
    return(movie_crimeview)
  }, escape = FALSE, options = list(pageLength = 10))
  output$top200 = renderDataTable({
    movie_top200view$Info <- displayViewBtn(movie_top200$imdbID)
    movie_top200view$Poster <- displayPoster(movie_top200$poster)
    movie_top200view <- movie_top200view[,c("Poster","Title","Info")]
    return(movie_top200view)
  }, escape = FALSE, options = list(pageLength = 10))
  output$all = renderDataTable({
    movie_iflixview$Info <- displayViewBtn(movie_iflix$imdbID)
    movie_iflixview$Poster <- displayPoster(movie_iflix$poster)
    movie_iflixview <- movie_iflixview[,c("Poster","Title","Info")]
    return(movie_iflixview)
  }, escape = FALSE, options = list(pageLength = 10))
  
})
