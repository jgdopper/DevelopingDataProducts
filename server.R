library(shiny)
library(UsingR)

# R code to assemble inputs into outputs
server <- function(input, output){
        #mtcars$mpgsp <- ifelse(mtcars$mpg -20 > 0, mtcars$mpg-20, 0)
        model1 <- lm(sheight ~ fheight, data = father.son)
        
        model1pred <- reactive({
                fatherInput <- input$sliderFather
                predict(model1, newdata = data.frame(fheight=fatherInput))
        })
        
        
        output$plot1 <- renderPlot({
                fatherInput <- input$sliderFather
                plot(father.son$fheight, father.son$sheight, xlab="Father's height (inch)",
                     ylab="Son's height (inch)", bty="n", pch=16,
                     xlim = c(55,85), ylim = c(55,85))
                if(input$showModel1){
                        abline(model1, col="red", lwd=2)
                }
                
                legend(25, 250, c("Model Prediction"), pch = 16,
                       col=c("red"), bty="n", cex=1.2)
                points(fatherInput, model1pred(), col="red", pch=16, cex=2)
        })
        
        output$pred1 <- renderText({
                model1pred()
        })
        
}