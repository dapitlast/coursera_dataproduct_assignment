library(ggplot2)
data(mtcars)

shinyServer(
  
  function(input, output) {
    formulaPredictor <- reactive({
      paste(input$variable, collapse="+")
    })
    
    formulaText <- reactive({
      paste("mpg ~", formulaPredictor())
    })
    
    predictModel <- reactive({
      lm(formulaText(),data=mtcars)
    })
    
    output$formula <- renderText({
      if(nchar(formulaPredictor())>0){
        paste("model <- lm (",formulaText(),", data=mtcars)")
      }
    })
    
    output$rss <- renderText({
      if(nchar(formulaPredictor())>0){
        paste(summary(predictModel())$sigma)
      }
    })
    
    output$residualPlot <- renderPlot({
      if(nchar(formulaPredictor())>0){
        g1<-ggplot(predictModel(), aes(.fitted, .resid))+geom_point()
        g1<-g1+stat_smooth(method="loess")+geom_hline(yintercept=0, col="red", linetype="dashed")
        g1<-g1+xlab("Fitted values")+ylab("Residuals")
        g1<-g1+ggtitle("Residual vs Fitted Plot")
        print(g1)
      }
    })
    
    output$scatterPlot <- renderPlot({
      if(nchar(formulaPredictor())>0){
        predicted <- data.frame(fitted = predictModel()$fitted.values)
        g2 <- ggplot(data=mtcars,aes(y=mpg,x=seq(1:nrow(mtcars))))
        g2 <- g2+geom_point()
        g2 <- g2+geom_line(aes(colour="Observation"))
        g2 <- g2+geom_line(data=predicted,aes(y=fitted,x=seq(1:nrow(mtcars)),colour="Prediction"))
        g2 <- g2+xlab("cars index")
        g2 <- g2+ggtitle("Observation vs Prediction Plot")
        g2 <- g2+scale_colour_manual("", 
                breaks = c("Observation", "Prediction"),
                values = c("Observation"="blue", "Prediction"="red"))
        print(g2)
      }
    })
  }
)
