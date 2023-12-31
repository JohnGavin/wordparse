
library(targets) # else 'tar_script' not found in devtools::install
# plan_vig_targets.R
#' @importFrom targets tar_target tar_script
tar_script({
  dataa <- tar_target(dataa, {
    data <- mtcars
    data$mpg01 <- as.factor(ifelse(data$mpg > median(data$mpg), "High", "Low"))
    data
  })
  modell <- tar_target(modell, {
    glm(mpg01 ~ wt + hp,
        data = dataa, family = binomial)
  })
  # FIXME: this creates functions.R-1.png
  # in ~/Documents_GitHub/wordparse/vignettes/targets_pipeline_em_files/figure-html
  # i.e. plott creates a png of the plot?!
  plott <- tar_target(plott, {
    library(ggplot2)
    pred <- predict(modell, type = "response")
    ggplot(dataa, aes(x = wt, y = hp, color = pred)) +
      geom_point() +
      scale_color_gradient(low = "blue", high = "red") +
      labs(title = "Predicted probabilities of mpg01",
           x = "Weight (1000 lbs)",
           y = "Horsepower",
           color = "Probability")
  })
  list(dataa = dataa, modell = modell, plott = plott)
  }, ask = FALSE)
