Simulation of Multivariate Regression in Shiny
========================================================
author: David
date: 24 December 2015

The Objective
========================================================

This application was developed with following objectives:

- To simulate the impact of adding or removing predictor in multivariate linear regresion
- To show that adding predictor doesn't always result in better prediction

The Application
========================================================

![Screenshot](image/Capture.PNG)

Features
========================================================

- Up to 9 variables available for selection
- Generate two plots for better insight:
  + Residual vs Fitted Plot
  + Observation vs Prediction
- Provide view access for the constructed formula and the residual standard error

The Simulation
========================================================

Data from mtcars datasets provided in R.
Example of constructed formula and the residual if Weight and Horsepower variable are selected.

```r
data(mtcars)
model <- lm(mpg ~ wt+hp,data=mtcars)
summary(model)$sigma
```

```
[1] 2.593412
```