
# renv::install()
# renv::snapshot()
# if (!requireNamespace("devtools")) install.packages("devtools")
# if (!requireNamespace("pacman")) install.packages("pacman")
pacman::p_load(devtools, here, rmarkdown)

here::dr_here()

my_folder <- "../wordparse"
# create(my_folder)
# use_mit_license()
# Add a dependency
# use_package('tibble')

# (Re-)build NAMESPACE
devtools::install(my_folder)
# update the NAMESPACE file
devtools::document(my_folder)
document()

# Reload the package: CTRL-L or
load_all()


# create README
# Choose whether you want a Markdown or an R Markdown README file
# use_readme_rmd() # create R Markdown README - run once
# brew install pandoc
# installr::install.pandoc(keep_install_file=TRUE)
rmarkdown::pandoc_available(version = NULL, error = FALSE)
# macOS, add the following to your .bash_profile file:
#  export RSTUDIO_PANDOC=/Applications/RStudio.app/Contents/MacOS/pandoc
devtools::build_readme()
Sys.getenv("RSTUDIO_PANDOC")

# Add a function to your package
use_r("extract_vowels")



library(testthat)
library(wordparse)

use_test("extract_vowels")
test(my_folder)

# GITHUB_PAT
# usethis::edit_r_environ()
# Chp 10: Happy Git With R - setup a new PAT
# https://ivelasq.rbind.io/blog/macos-rig/
# generate a PAT with suggested, pre-selected scopes
usethis::create_github_token()
# credentials::set_github_pat() # to update credentials
# change authentication - PASTE IN your PAT
# save the PAT locally using the macOS Git credential manager (after copying it from GitHub):
# gitcreds::gitcreds_set()
gh::gh_whoami()
# make sure everything is looking good
usethis::git_sitrep()


# push your project to GitHub
# usethis::use_git() # initialize a git repository
# usethis::use_github() # create a GitHub remote for project
pr_init('main')
pr_resume()
pr_fetch()
usethis::pr_push()

# https://stackoverflow.com/questions/22565024/how-to-properly-include-dependencies-in-r-package

# x <- '/Users/johngavin/Documents_GitHub/wordparse/renv/library/R-4.3/aarch64-apple-darwin20/wordparse/R/wordparse.rdb'
# file.remove(x)

usethis::edit_rstudio_prefs()
