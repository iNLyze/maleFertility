
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Predicting male fertility from personal risk factors"),
  p("This application predicts male fertility based on user inputs. 
    You can enter some information about yourself. The application will make a prediction based on data from 100 volunteers involved in a scientific study.  
    The data was obtained from the UCI Machine Learning repository at",
    span( 
        a("UCI", href="https://archive.ics.uci.edu/ml/datasets/Fertility"),
        style = "blue"
        ),
    ". The original research paper by Gil et al. can be found",
    span(
        a("here", href="https://www.researchgate.net/profile/Joaquin_De_Juan/publication/230868076_Predicting_seminal_quality_with_artificial_intelligence_methods/links/09e415058f10cc3081000000.pdf")
    ),
    "."
    ),
  p("The original publication uses a larger data set with more variables, whereas the data set used for building this application was restricted to 10 variables. 
    The model was built using a random forest classifier from the 'rf' package."),
  p("Full documentation is found on",
  span(
      a("RPubs", href="http://rpubs.com/iNLyze/maleFertility"),
      style = "blue"
      ),
  "."
  ),
  br(),
  strong("DISCLAIMER: This application was created for research purposes only. THIS APPLICATION IS NOT A DIAGNOSTIC TOOL. If you suffer from any medical condition please consult a physician."),
  strong("By clicking the 'Submit' button below or using this application in any way you agree that you do so at your own responsibility. You agree that the autor will not take any liability for any consequence of using this application. "),
  br(),
  br(),
    
  # Input of personal data
  sidebarLayout(
    sidebarPanel(
        dateInput("season", "Enter current date: "),
        numericInput('age', 'What is your age?', 18,
                     min = 18, max = 36),
        checkboxInput('diseases', 'Did you suffer from childhood diseases, e.g. chicken pox, measels?'),
        checkboxInput('trauma', 'Did you suffer from accident or trauma?'),
        checkboxInput('surgery', 'Did you take any surgical intervention?'),
        selectInput("fevers", "When did you last suffer from high fevers?", 
                    choices=c("Less than three months ago", 
                              "More than three months ago", "None")
                    ),
        selectInput("alcohol", "What is your alcohol consumption?", 
                    choices = c("Several times a day",
                                "Every day", 
                                "Several times a week", 
                                "Once a week", 
                                "Hardly ever or never")
                    ),
        selectInput("smoking", "How often do you smoke?", 
                    choices = c("Never", "Occasionally", "Daily")
        ),
        numericInput("sitting", "How many hours per day do you sit?", 5, 
                     min = 0, max = 16
        ),
        
        # Use actionButton instead of submit button, so server.R can catch submit with eventReactive
        actionButton("submit", "Submit", 
                     style="color: #fff; background-color: #337ab7; border-color: #2e6da4"
                     )
        
    ),

    # Show a plot of the generated distribution
    mainPanel(
        h3("Outcome:"),
        h1(textOutput("prediction"))
    )
  )
))
