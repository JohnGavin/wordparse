
library(usethis)
# create a GitHub workflow file
# https://github.com/r-lib/actions/tree/v2-branch/examples
# runs the tests on a daily schedule
use_github_action("check-standard") # remove Mac/Windows?

# test coverage report on Codecov
# uses [covr](https://covr.r-lib.org) package
# query test coverage of package
# upload the result to [codecov.io](https://codecov.io)
use_github_action("test-coverage")

use_github_action("render-rmarkdown")
# use_github_action("check-full.yaml")
# use_github_action("docker.yaml")
# https://github.com/r-lib/actions/blob/v2-branch/examples/README.Rmd
# usethis::use_github_action("check-release") # Quickstart CI workflow

# edit this file if you want to customize the workflow settings, such as the time, frequency, and platforms for running the tests. You can also add other steps or actions to the workflow, such as uploading the test results or sending notifications
edit_file("./.github/workflows/R-CMD-check.yaml")
edit_file("./.github/workflows/test-coverage.yaml")

# see workflow on the Actions tab of your repository page.

