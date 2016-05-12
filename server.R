
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source('fertility_utils.R')
require(stringr)



# Load random forest model of fertility from file
model <- readRDS("rf_Fit1.Rds")

shinyServer(function(input, output) {
    
    
    # Normalize Input to match data format 
    normInput <- reactive({ normalizeInput(input) })

    
    # Prepare user input for prediction to fit data frame in model for predict()
    p.input <- eventReactive(eventExpr = input$submit, {h <- do.call(cbind, lapply(normInput(), as.data.frame))
                        names(h) <- names(normInput())
                        h
                        })
    

    # Create Output
    output$prediction <- renderText({
        paste0(
            
#                # For debugging only:
#                 "User inputs: \n",
#                "\n",
#                "Season: ", input$season, "\n",
#                "Age:", input$age, "\n",
#                "Diseases: ", input$diseases, "\n",
#                "Trauma: ", input$trauma, "\n", 
#                "Surgery: ", input$surgery, "\n",
#                "Fevers: ", input$fevers, "\n",
#                "Alcohol: ", input$alcohol, "\n",
#                "Smoking: ", input$smoking, "\n", 
#                "Sitting: ", input$sitting, "\n",
#                "\n", 
#                "\n",
#                "Normalized inputs: \n",
#                "\n", 
#                "Season: ", normInput()$season, "\n",
#                "Age: ", normInput()$age, "\n",
#                "Diseases: ", normInput()$diseases, "\n",
#                "Trauma: ", normInput()$trauma, "\n", 
#                "Surgery: ", normInput()$surgery, "\n",
#                "Fevers: ", normInput()$fevers, "\n",
#                "Alcohol: ", normInput()$alcohol, "\n",
#                "Smoking: ", normInput()$smoking, "\n", 
#                "Sitting: ", normInput()$sitting, "\n",
#                "\n", 
               
               
               switch(as.character( predict( model, p.input() ) ),
                   "N" = "Normal",
                   "O" = "Altered"
               )
               
               
               )
    })
  

})
