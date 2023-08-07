
# renv::install()
# renv::snapshot()
if (!requireNamespace("devtools")) install.packages("devtools")
if (!requireNamespace("pacman")) install.packages("pacman")
pacman::p_load(devtools, here)

here::dr_here()

my_folder <- "../wordparse"
# create(my_folder)
# use_mit_license()
# Add a dependency
# use_package('tibble')

# Add a function to your package
use_r("extract_vowels")

# (Re-)build NAMESPACE
document(my_folder)
install(my_folder)

document()

# Reload the package: CTRL-L or
load_all()

library(testthat)
library(wordparse)

use_test("extract_vowels")
test(my_folder)

# GITHUB_PAT
# usethis::edit_r_environ()
# Chp 10: Happy Git With R - setup a new PAT
usethis::create_github_token()
library(credentials)
set_github_pat()
# change authentication - paste in your PAT
gitcreds::gitcreds_set()
gh::gh_whoami()
# make sure everything is looking good
usethis::git_sitrep()

# https://stackoverflow.com/questions/22565024/how-to-properly-include-dependencies-in-r-package

# x <- '/Users/johngavin/Documents_GitHub/wordparse/renv/library/R-4.3/aarch64-apple-darwin20/wordparse/R/wordparse.rdb'
# file.remove(x)

