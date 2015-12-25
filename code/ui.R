library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Simulation of Multivariate Linear Regression"),
  sidebarPanel(
    checkboxGroupInput("variable", "Select Variable:",
                       c("Cylinders" = "cyl",
                         "Transmission" = "am",
                         "Gears" = "gear",
                         "Horsepower" = "hp",
                         "Weight"="wt",
                         "Displacement"="disp",
                         "1/4 mile time"="qsec",
                         "Forward gear"="gear",
                         "Carburator"="carb"
                         )),
    
    strong("Description"),
    p("Simulate the multivariate linear regression by selecting variables that will be included as predictors.",
      "If at least one of the variables is selected, the application will display two plots.", 
      "The first plot shows the residual plot, that is the residual vs fitted value.",
      "The second plot shows prediction and the observation value at the same plot."),
    p("The formula used in the prediction can be found at the top of the right panel.",
      "The application will show the residual standard error that resulted from the prediction model."),
    p("This simulation uses Motor Trend Car Road Tests (mtcars) dataset provided by R.")
  ),
  mainPanel(
    strong("Formula: "),
    textOutput("formula"),
    strong("Residual standard error: "),
    textOutput("rss"),
    plotOutput('residualPlot'),
    plotOutput('scatterPlot')
  )
))
