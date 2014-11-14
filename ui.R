library(shiny)
library( shinyapps )

shinyUI(
        pageWithSidebar(
                headerPanel("Predicting Miles Per Gallon for a Car"),                
                sidebarPanel(
                        helpText("This application is designed to predict Miles Per Gallon(mpg) for a car from Weight, Horse Power and Transmission Type of a Car. "),
                        helpText("Note: Weight should be expressed in pounds, Horse Power and Transmission Type of a Car should be selected either as Automatic or Manual."),                        
                        h4('Enter car details below'),                                                                        
                        numericInput('wt', 'Weight of the car in lb: ', 1000, min = 1500, max = 6000, step = 50),
                        selectInput("am", "Transmission Type: ",
                                    
                                           c("Automatic" = "0",
                                             "Manual" = "1" ) ),
                        numericInput('hp', 'Gross Horse Power: ', 100, min = 50, max = 350, step = 10 )
                ),
                mainPanel(
                        h3('Prediction Results'),                        
                        h4('Weight: '),
                        verbatimTextOutput("wt"),
                        h4('Horse Power: '),
                        verbatimTextOutput("hp"),
                        h4('Transmissio Type: '),
                        verbatimTextOutput("am"),
                        h3('Miles per Gallon is: '),
                        verbatimTextOutput("prediction")
                )
        )
)