library(shiny)
library( shinyapps )
library( datasets )
data( mtcars )

mtcars$am <- as.factor( mtcars$am )
fit1 <- lm( mpg ~ wt + hp + am, data = mtcars )

shinyServer(

        function(input, output) {
                mpg <- reactive({
                        newdata <- data.frame( wt = (input$wt/1000), 
                                               hp = input$hp,
                                               am = input$am )
                        predict( fit1, newdata = newdata )
                })           
                
                amtype <- reactive ( { ifelse( input$am == 1, "Manual Transmission", "Automatic Transmission" ) })
                
                output$wt <- renderText({input$wt})
                output$hp <- renderText({input$hp})
                output$am <- renderText({amtype()})
                output$prediction <- renderText( {mpg()} )  

        }
)


