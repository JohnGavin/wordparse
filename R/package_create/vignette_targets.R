
install.packages(c("rmarkdown", "knitr"))
dir.create("vignettes")

# packages in vignette - list in Suggests DESCRIPTION
# targets package in vignette - add targets to Suggests

if (!requireNamespace("quarto")) install.packages("quarto")
library(quarto)
quarto::quarto_render("vignettes/targets_pipeline_em.qmd")

# create an HTML file for your vignette in the inst/doc
# output: rmarkdown::html_vignette
devtools::build_vignettes()

# browseVignettes()
browseVignettes(package = "wordparse")

