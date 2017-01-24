
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
    #tabPanel("Home", wellPanel(uiOutput("welcome"))),
    
    tabPanel("Browse", wellPanel(h4("Browse Movie"),
                                 h4("Movie Categories"),
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
    tabPanel("Rating", wellPanel(selectInput("select_movie", label = h4("Select movie:"), 
                                             choices = as.character(movie_iflix$movie_title[])),
                                 selectInput("select_rating", label = h4("Select your rating (1-5):"),
                                             choices = c(1:5)),
                                 #uiOutput("title_selected"),
                                 br(),
                                 submitButton("Submit"),
                                 uiOutput("userdata")
                      )),
    
    tabPanel("Preference", wellPanel(uiOutput("preference"))),
    
    tabPanel("Recommended", wellPanel(h4("List of recommended movies based on your preferences."),
                                      p("Recommended movies:"))),
    
    tabPanel("Statistics", wellPanel("Display plotted graph or chart of the similarity of all movies.")),
    tabPanel(img(height = 80, src = "Rlogo.jpg"), wellPanel("About R")),
    tabPanel(img(height = 80, src = "iflixlogo.png"), wellPanel("About iFlix")),
    tabPanel(img(height = 80, src = "mmulogo.jpg"), wellPanel("About MMU"))
    
    
  )
))
