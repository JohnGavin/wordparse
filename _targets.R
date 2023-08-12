library(targets)
dataa <- tar_target(dataa, {
    data <- mtcars
    data$mpg01 <- as.factor(ifelse(data$mpg > median(data$mpg), 
        "High", "Low"))
    data
})
modell <- tar_target(modell, {
    glm(mpg01 ~ wt + hp, data = dataa, family = binomial)
})
plott <- tar_target(plott, {
    library(ggplot2)
    pred <- predict(modell, type = "response")
    ggplot(dataa, aes(x = wt, y = hp, color = pred)) + geom_point() + 
        scale_color_gradient(low = "blue", high = "red") + labs(title = "Predicted probabilities of mpg01", 
        x = "Weight (1000 lbs)", y = "Horsepower", color = "Probability")
})
list(dataa, modell, plott)
