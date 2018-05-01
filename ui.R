library(shiny)
library(UsingR)


# UserInterface
ui <- fluidPage(
        titlePanel("Predict the son's length based on the father's length"),
        tabsetPanel(type="tabs",
                    tabPanel("App",  verbatimTextOutput("App"),sidebarLayout(
                            sidebarPanel(
                                    sliderInput("sliderFather", "What is the length of the father in inches?", 55, 85, value=70),
                                    checkboxInput("showModel1", "Show/Hide Model", value=TRUE),
                                    submitButton("Submit")
                            ),
                            mainPanel(
                                    
                                    plotOutput("plot1"),
                                    h3("Predicted length of the son from Model 1:"),
                                    textOutput("pred1")
                            )
                    ) ), 
                    tabPanel("About", verbatimTextOutput("About"), 
                             mainPanel(
                              
                                h2("Instruction"),
                                p("Set the slider on the height of the father, and 
                                  click on Submit. The graph in the main panel will 
                                  show the observed data form the father.son dataset, 
                                  and the predicted value in the graph. This predicted 
                                  value is alsolo given below the graph."),
                                p("Depending on whether the button Show/Hide Model
                                is selected, the linear regression model is shown 
                                  in the graph."),
                                h2("Model"),
                                p("This app predicts the height of a son based on 
                                 the height of the father. The model is a simple 
                                linear regression model based on John Galton's 
                                father and son  height data in the R dataset father.son.")
                                )
                )
        )
        
)
