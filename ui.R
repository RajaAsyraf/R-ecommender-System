
library(shiny)
library(shinythemes)

shinyUI(fluidPage (
  theme = shinytheme("darkly"),
  includeCSS("styles.css"),
  titlePanel( #Title
    p("R-ecommender: An R Content-On-Demand Recommendation System " , align = "center"),
    "R-ecommender"
  ),
  navlistPanel(
    
    tabPanel("Browse", wellPanel(h4("Movie Categories"),
                                 tabsetPanel(
                                    tabPanel("Action", br(), dataTableOutput("action")),
                                    tabPanel("Drama", br(), dataTableOutput("drama")),
                                    tabPanel("Comedy", br(), dataTableOutput("comedy")),
                                    tabPanel("Horror", br(), dataTableOutput("horror")),
                                    tabPanel("Romance", br(), dataTableOutput("romance")),
                                    tabPanel("Family", br(), dataTableOutput("family")),
                                    tabPanel("Thriller", br(), dataTableOutput("thriller")),
                                    tabPanel("Sci-Fi", br(), dataTableOutput("sci_fi")),
                                    tabPanel("Crime", br(), dataTableOutput("crime")),
                                    tabPanel("Top 200", br(), dataTableOutput("top200"))
                                    #tabPanel("All", br(), dataTableOutput("all"))
                                  )
                                  )),
    tabPanel("Rating", wellPanel(div(selectInput("select_movie", label = h4("Select movie:"), 
                                             choices = as.character(movie_iflix$movie_title[])),
                                 selectInput("select_rating", label = h4("Select your rating (1-5):"),
                                             choices = c(1:5)), style = 'width:50%;'),
                                 actionButton("submit", "Submit")
                      ),
                      wellPanel(
                        h4("Your rating:"),
                        dataTableOutput("userdata"),
                        br(),
                        actionButton("clear", "Clear Table")
                      )
            ),
    
    tabPanel("Preference", wellPanel(uiOutput("preference"))),
    
    tabPanel("Recommended", wellPanel(h4("List of recommended movies based on your preferences."),
                                      p("Recommended movies:"))),
    
    tabPanel("Statistics", wellPanel("Display plotted graph or chart of the similarity of all movies.")),
    tabPanel(img(height = 50, src = "iflixlogo.png"), wellPanel("About iFlix")),
    tabPanel(img(height = 50, src = "Rlogo.png"), wellPanel("About R")),
    tabPanel(img(height = 50, src = "mmulogo.png"), wellPanel("About MMU"))
    
    
  )
))
