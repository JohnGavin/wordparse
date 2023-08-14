
install.packages(c("rmarkdown", "knitr"))
dir.create("vignettes")

# https://r-pkgs.org/vignettes.html#sec-vignettes-workflow-writing
# create .Rmd (not .qmd) your first vignette, run:
# usethis::use_vignette("targets_pipeline_em")
# install your current source package with
devtools::install()

# packages in vignette - list in Suggests DESCRIPTION
# targets package in vignette - add targets to Suggests

if (!requireNamespace("quarto")) install.packages("quarto")
library(quarto)
quarto::quarto_render("vignettes/targets_pipeline_em.qmd")

# Most developers should avoid using build_vignettes()

# create an HTML file for your vignette in the inst/doc
# output: rmarkdown::html_vignette
# properly install your package and
# request that vignettes be built,
install(build_vignettes = TRUE)
# browseVignettes()
browseVignettes(package = "wordparse")

# render the vignette.
# builds against a temp installed development version of your package
devtools::build_rmd("vignettes/targets_pipeline_em.qmd")

# https://r-pkgs.org/vignettes.html#sec-vignettes-how-built
# Be aware that anyone who installs directly from GitHub
# will need to explicitly request vignettes
devtools::install_github(repo = "JohnGavin/wordparse", dependencies = TRUE, build_vignettes = TRUE)

devtools::release() # build the package.
