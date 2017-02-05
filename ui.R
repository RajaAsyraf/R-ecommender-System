
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
    tabPanel("How to use?",
             wellPanel(h2("How to start using R-ecommender?")),
             wellPanel(
              h4("1. Browse iflix Movies", img(height = 40, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16388032_1579322735428736_4237605348792415729_n.jpg?oh=66d1ccd73e3dd719877af9a80a853b97&oe=594822E6")),
              p("You browse what movies that are available in iflix by clicking 'Browse
                 iflix Movies' tab. Here, you can search and get information of each movies with 
                 the genres and link to
                 IMDb website. Each movie is grouped by its category as in iflix."),
              img(height = 400, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16426285_1579300542097622_7059334516291055654_n.jpg?oh=3222325c83118d55748b79cd5df03aae&oe=590E9410")
              ),
             wellPanel(
              h4("2. Get recommended movies"),
              p("There are two(2) ways to get a list of recommended movies. First thing 
                you have to provide us some information. You can give your rating 
                on selected movies and give us movie title you have watched before. Easy!"),
              p("To get recommended movies, you can:")),
             wellPanel(
              h4("A. Go to Rating Movies menu tab.", img(height = 40, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16406417_1579311228763220_5758896788752508392_n.jpg?oh=950ffab93085d2f6e2388b1233488f8f&oe=5909DABA")),
              img(height = 400, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16508283_1579305572097119_4192479511301754256_n.jpg?oh=96c944d7ebba4bfa1aee42b0d3da9a8e&oe=590B133F"),
              p("In this tab, you need to give rating any movie you want. Click submit to save the rating
                of selected movie title."),
              p("Next, you can get list of recommended movies by clicking 'Generate' button in 'Generate
                Recommended' tab."),
              img(height = 400, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16387912_1579308655430144_6602821875482348930_n.jpg?oh=b5af3e0163a161683dc22cab2e7ce063&oe=58FE7887")
              ),
             wellPanel(
              h4("B. Go to Watched Movies menu tab.", img(height = 40, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16388124_1579312438763099_4714136062847149940_n.jpg?oh=d7aa4c558dc753a8207891bd01ed7907&oe=593F8FC7")),
              img(height = 200, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16387327_1579315782096098_5337220546191872000_n.jpg?oh=8dda1008ff13c6f4cdb4dbaa67e7ff13&oe=5913F6F6"),
              p("For the second option to get a list of recommended movies, you can choose 3 movies you have seen and click 'Submit'")
             )
    ),
    
    tabPanel("Browse iflix Movies", wellPanel(
                                 tabsetPanel(
                                    tabPanel("All", br(), dataTableOutput("all")),
                                    tabPanel("Action", br(), dataTableOutput("action")),
                                    tabPanel("Drama", br(), dataTableOutput("drama")),
                                    tabPanel("Comedy", br(), dataTableOutput("comedy")),
                                    tabPanel("Horror", br(), dataTableOutput("horror")),
                                    tabPanel("Romance", br(), dataTableOutput("romance")),
                                    tabPanel("Family", br(), dataTableOutput("family")),
                                    tabPanel("Thriller", br(), dataTableOutput("thriller")),
                                    tabPanel("Sci-Fi", br(), dataTableOutput("sci_fi")),
                                    tabPanel("Crime", br(), dataTableOutput("crime"))
                                    #tabPanel("Top 200", br(), dataTableOutput("top200"))
                                  )
                                  )),
    tabPanel("Rating Movies", wellPanel(tabsetPanel(
                                   tabPanel("Your Rating", br(), 
                                            div(selectInput("select_movie", label = h4("Select movie:"), 
                                                            choices = as.character(movie_iflix$movie_title[])),
                                                selectInput("select_rating", label = h4("Select your rating (1-5):"),
                                                            choices = c(1:5)), style = 'width:50%;'),
                                            actionButton("submit", "Submit"),br(),br(),
                                            h4("Your rating:"),
                                            dataTableOutput("userdata"),
                                            br(),
                                            actionButton("clear", "Clear Table")
                                            ),
                                   tabPanel("Generate Recommended", br(),
                                            wellPanel(h4("List of recommended movies based on your preferences."),
                                                      actionButton("generate","Generate")),
                                            wellPanel(
                                              p("Recommended movies:"),
                                              dataTableOutput("recommended_output")
                                              #plotOutput("preference")
                                            )
                                            )
                                  )
                      )
            ),
    
    tabPanel("Watched Movies", wellPanel(tabsetPanel(
                                          tabPanel("Watched Movies", br(),
                                            div(selectInput("select_movie_watced_1", label = h4("Select 3 movies you have seen:"), 
                                                            choices = as.character(movie_iflix$movie_title[])),
                                                selectInput("select_movie_watced_2", label = NA,
                                                            choices = as.character(movie_iflix$movie_title[])),
                                                selectInput("select_movie_watced_3", label = NA,
                                                            choices = as.character(movie_iflix$movie_title[])),
                                                style = 'width:50%;'),
                                            actionButton("submit_watched_movies", "Submit")
                                          ),
                                          tabPanel("Generate Recommended", br(),
                                                   h4("List of recommended movies based on your preferences."),
                                                   actionButton("generate","Generate"),br(),
                                                   p("Recommended movies:"),
                                                   dataTableOutput("recommended_output_watched")
                                          )
                                        )
                              )
    ),
    
    #tabPanel("How it works?", wellPanel(
    #                          h4("Here how it works.")
    #                          )
    #         ),
    
    tabPanel(img(height = 50, src = "iflixlogo.png"), wellPanel(a(href="http://www.iflix.com", target="_blank", img(height = 60, src = "iflixlogo.png", style="display: block; margin-left: auto; margin-right: auto;")),
                                                                h2("About iflix"),
                                                                p("Imagine being able to access a crazy huge selection of your favourite shows, THOUSANDS of TV shows, movies and more from all over the globe. Shows from Hollywood and Hong Kong, Seoul and Shanghai, Thailand and Tokyo… And imagine being able to watch it whenever you want, wherever you want, 24/7 on your phone, laptop, tablet and TV.
                                                                  And all for a price that you cannot resist."),
                                                                h4("THAT'S THE IFLIX PROPOSITION.", align="center"),
                                                                img(height = 400, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16388444_1579282075432802_3291760626570252802_n.jpg?oh=4c74bcf85852db1e7827c3c60ceac133&oe=590B0AB9", style="display: block; margin-left: auto; margin-right: auto;"),
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
                            img(height = 400, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16406566_1579282198766123_5142365803759981627_n.jpg?oh=e886ec16e3c722366bf8863fa37ef43a&oe=5906F624", style="display: block; margin-left: auto; margin-right: auto;")
                        ),
              wellPanel(a(href="http://www.r-project.org", target="_blank", img(height = 60, src = "Rlogo1.png", style="display: block; margin-left: auto; margin-right: auto;")),
                        h2("About R Language"),                        
                        p("R is a language and environment for statistical computing and graphics. It is a GNU project which is similar to the S language and environment which was developed at Bell Laboratories (formerly AT&T, now Lucent Technologies) by John Chambers and colleagues. R can be considered as a different implementation of S. There are some important differences, but much code written for S runs unaltered under R."),
                        p("R provides a wide variety of statistical (linear and nonlinear modelling, classical statistical tests, time-series analysis, classification, clustering, …) and graphical techniques, and is highly extensible. The S language is often the vehicle of choice for research in statistical methodology, and R provides an Open Source route to participation in that activity."),
                        img(height = 400, src = "https://scontent-kul1-1.xx.fbcdn.net/v/t1.0-9/16406757_1579282195432790_3664111921106996522_n.jpg?oh=826effbc7bcdc247ec9e26446baef52b&oe=5912EE0C", style="display: block; margin-left: auto; margin-right: auto;"),
                        p("One of R’s strengths is the ease with which well-designed publication-quality plots can be produced, including mathematical symbols and formulae where needed. Great care has been taken over the defaults for the minor design choices in graphics, but the user retains full control."),
                        p("R is available as Free Software under the terms of the Free Software Foundation’s GNU General Public License in source code form. It compiles and runs on a wide variety of UNIX platforms and similar systems (including FreeBSD and Linux), Windows and MacOS.")
                    )),
    tabPanel(img(height = 55, src = "mmulogo.png"), 
             wellPanel(a(href="http://www.mmu.edu.my", target="_blank", img(height = 60, src = "mmulogo.png", style="display: block; margin-left: auto; margin-right: auto;")),
                       h2("Mulimedia University"),
                       p("As a part of the requirement to be awarded a Bachelor’s degree from the Faculty of Computing and
                          Informatics in Multimedia University, Cyberjaya, we are required to undertake, complete and pass a project-type course
                         in our final year of study. This final year project (FYP), usually executed over two trimesters (a 28-week
                         period), will be a substantial and important part of our undergraduate study. It will be the most time
                         consuming activity and a significant piece of independent work that you need to take on.")),
             wellPanel(
                       h4("Project Details:"),
                       p("Project ID: 442", br(),
                       "Project Title: R-commender: An R Content-On-Demand Recommedation System",br(),
                       "Session: 2016/2017", br(),
                       "Student Name: Raja Mohamad Asyraf B Raja Abdul Rahman",br(),
                       "Student ID: 1112703432",br(),
                       "Supervisor: Dr. Peter Ho Chiung Ching",br(),
                       "Moderator: Dr. Tan Saw Chin")
                    ))
    
    
  )
))
