
library(shiny)
library(shinythemes)

shinyUI(fluidPage (
  theme = shinytheme("darkly"),
  includeCSS("styles.css"),
  titlePanel( #Title
    p("R-ecommender: An R Content-On-Demand Recommendation System " , align = "center", 
      style="font-weight:normal;font-family:lucida sans unicode, lucida grande, sans-serif;"),
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
    
    tabPanel("Recommended", wellPanel(h4("List of recommended movies based on your preferences."),
                                      actionButton("generate","Generate")),
                            wellPanel(
                              p("Recommended movies:"),
                              dataTableOutput("recommended_output")
                            )
             ),
    tabPanel("Preference", wellPanel(uiOutput("preference"))),
    
    tabPanel("Statistics", wellPanel("Display plotted graph or chart of the similarity of all movies.")),
    tabPanel(img(height = 50, src = "iflixlogo.png"), wellPanel(a(href="http://www.iflix.com", target="_blank", img(height = 60, src = "iflixlogo.png", style="display: block; margin-left: auto; margin-right: auto;")),
                                                                h2("About iflix"),
                                                                p("Imagine being able to access a crazy huge selection of your favourite shows, THOUSANDS of TV shows, movies and more from all over the globe. Shows from Hollywood and Hong Kong, Seoul and Shanghai, Thailand and Tokyo… And imagine being able to watch it whenever you want, wherever you want, 24/7 on your phone, laptop, tablet and TV.
                                                                  And all for a price that you cannot resist."),
                                                                h4("THAT'S THE IFLIX PROPOSITION.", align="center"),
                                                                img(height = 400, src = "iflix_website.png", style="display: block; margin-left: auto; margin-right: auto;"),
                                                                br(),br(),
                                                                h4("BEING ENTERTAINED SHOULD BE AS EASY AS PRESSING A BUTTON.", align="center"),
                                                                p("iflix is a partnership between disruptive local entrepreneurs and Hollywood heavyweights. Catcha Group and Evolution Media Capital have joined together to change the way you consume your entertainment. And this time, it's gonna be on your terms.
                                                                  No more jumping-through-hoops required. Cause as far as we're concerned, life is complicated enough."),
                                                                p("Source: https://piay.iflix.com/static?page=about")
                                                                )),
    tabPanel(img(height = 50, src = "Rlogo.png"), 
             wellPanel(a(href="http://www.rstudio.com", target="_blank", img(height = 60, src = "Rlogo.png", style="display: block; margin-left: auto; margin-right: auto;")),
                        h2("About RStudio"),
                        p("Why RStudio?
                            The technology to amass data exceeds our abilities to make use of it.
                            People all over the world are turning to R, an open source statistical language, to make sense of data.
                            Inspired by the innovations of R users in science, education, and industry, RStudio develops free and open tools for R and enterprise-ready professional products for teams to scale and share work.
                            Our goal is to empower users to be productive with R."),
                            img(height = 400, src = "rstudio_screen.png", style="display: block; margin-left: auto; margin-right: auto;")
                        ),
              wellPanel(a(href="http://www.r-project.org", target="_blank", img(height = 60, src = "Rlogo1.png", style="display: block; margin-left: auto; margin-right: auto;")),
                        h2("About R Language"),                        
                        p("R is a language and environment for statistical computing and graphics. It is a GNU project which is similar to the S language and environment which was developed at Bell Laboratories (formerly AT&T, now Lucent Technologies) by John Chambers and colleagues. R can be considered as a different implementation of S. There are some important differences, but much code written for S runs unaltered under R."),
                        p("R provides a wide variety of statistical (linear and nonlinear modelling, classical statistical tests, time-series analysis, classification, clustering, …) and graphical techniques, and is highly extensible. The S language is often the vehicle of choice for research in statistical methodology, and R provides an Open Source route to participation in that activity."),
                        img(height = 400, src = "rlang_screen.png", style="display: block; margin-left: auto; margin-right: auto;"),
                        p("One of R’s strengths is the ease with which well-designed publication-quality plots can be produced, including mathematical symbols and formulae where needed. Great care has been taken over the defaults for the minor design choices in graphics, but the user retains full control."),
                        p("R is available as Free Software under the terms of the Free Software Foundation’s GNU General Public License in source code form. It compiles and runs on a wide variety of UNIX platforms and similar systems (including FreeBSD and Linux), Windows and MacOS.")
                    )),
    tabPanel(img(height = 55, src = "mmulogo.png"), 
             wellPanel(a(href="http://www.mmu.edu.my", target="_blank", img(height = 60, src = "mmulogo.png", style="display: block; margin-left: auto; margin-right: auto;")),
                       h2("About Multimedia Univerity (MMU)"),
                       p("")
                    ))
    
    
  )
))
