library(lubridate)
require(stringr)

getSeason <- function(inputDate) {
    #Returns -0.33 for spring, 0.33 for summer, 1 for autumn, -1 for winter 
    #and 0 if no valid season was found
    if (month(inputDate) > 2 && month(inputDate) < 6) {
        return(-0.33)
    } else if (month(inputDate) > 5 && month(inputDate) < 9) {
        return(0.33)
    } else if (month(inputDate) > 8 && month(inputDate) < 12) {
        return(1)
    } else if (month(inputDate) > 11 || month(inputDate) < 3) {
        return(-1)
    } else {return(0)}
}


normalizeInput <- function(userInput) {
    
    # Declare variable
    inputList <- list(99, 99, 99, 99, 99, 99, 99, 99, 99)
    names(inputList) <- c("season",
                          "age", 
                          "diseases", 
                          "trauma", 
                          "surgery",
                          "fevers", 
                          "alcohol", 
                          "smoking", 
                          "sitting")
    
    inputList$season <- getSeason(userInput$season)
    inputList$age <- (userInput$age-18)/18
    inputList$diseases <- as.numeric(userInput$diseases)
    inputList$trauma <- as.numeric(userInput$trauma) 
    inputList$surgery <- as.numeric(userInput$surgery)
    
    
    inputList$fevers <- switch (userInput$fevers, 
            "Less than three months ago" = -1,
            "More than three months ago" = 0,
            "None" = 1
            ) 

    if (str_detect(userInput$alcohol, "Several times a day")) {
        inputList$alcohol <- 1
    } else if (str_detect(userInput$alcohol, "Every day")) {
        inputList$alcohol <- 0.8
    } else if (str_detect(userInput$alcohol, "Several times a week")) {
        inputList$alcohol <- 0.6
    } else if (str_detect(userInput$alcohol, "Once a week")) {
        inputList$alcohol <- 0.4
    } else {
        inputList$alcohol <- 0.2
    } 
    
    if (str_detect(userInput$smoking, "Never")) {
        inputList$smoking <- -1
    } else if (str_detect(userInput$smoking, "Occasionally")) {
        inputList$smoking <- 0
    } else if (str_detect(userInput$smoking, "Daily")) {
        inputList$smoking <- 1
    }
    inputList$sitting <- (userInput$sitting)/16
    
    inputList
}