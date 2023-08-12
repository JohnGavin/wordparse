
# https://cloud.r-project.org/web/packages/renv/vignettes/faq.html

rstudioapi::restartSession()
# only include packages which are explicitly listed in the project’s
# DESCRIPTION file as dependencies

file.remove(".Rprofile", "renv.lock")
unlink("renv", recursive = TRUE)
rstudioapi::restartSession()
# renv::settings$snapshot.type("explicit")
options(renv.settings.snapshot.type = "explicit")
# record renv 1.0.0 in the lockfile.
renv::record("renv@1.0.0") # for quarto
# install renv 0.17.3 into the project library.
# renv::restore(packages = "renv")

renv::init()
rstudioapi::restartSession()
renv::status()
# OR
# restore project state as defined in the lockfile
renv::restore()

renv::clean()
renv::purge("devtools")
renv::repair()
renv::rebuild()

# Verify code works then renv::snapshot() to update new lockfile
renv::snapshot() # to update the lockfile

# may not capture the packages that you use in
# iterative workflows (e.g. devtools
# DESCRIPTION file; typically, within the Suggests: field.
# Then execute (install the packages as described in the DESCRIPTION)
options(renv.settings.snapshot.type = "explicit")
renv::install()

# Associate a version of Python with your project.
renv::use_python()

# renv can see into subfolders!
renv::dependencies()
