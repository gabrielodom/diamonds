# Workshop setup
# Gabriel Odom
# 2025-09-16

install.packages("pak")
pak::pak(c("usethis", "pointblank", "logger", "nanoparquet", "rsconnect", "shiny"))

# Notes: https://github.com/posit-conf-2025/r-production?tab=readme-ov-file
# Chapter 1: https://github.com/posit-conf-2025/r-production/blob/main/materials/1-whole-game.pdf

usethis::use_git()
usethis::use_github()

######  cron files  ###########################################################
# use https://crontab.guru/
# 1. 1AM on Friday: 0 1 * * 5
# 2. 1st and 15th of each month (pick a time, so I pciked 14:18): 18 14 1,15 * *
# 3. every 30 minutes on the weekend: */30 * * * 6-7
# 4. every hour of the workweek: */60 * * * 1-5



######  GitHub Actions Config  ################################################
# link: https://github.com/r-lib/actions/tree/v2-branch/examples

usethis::use_github_action()
# I'm goign to try to use this one:
# https://github.com/r-lib/actions/blob/v2-branch/examples/render-rmarkdown.yaml
# Ok, that's the "hard way". There is a magic invocation to get the actions file
# we need:
usethis::use_github_action(
  url = "https://github.com/posit-conf-2025/r-production/blob/main/1-render-qmd.yaml",
  save_as = "render.yml"
)
# Make sure you change the file name in the " - name: Render \n run: " part to
# the .qmd file that you are editing

# Ok, so after much pain and suffering, I am apparently REQUIRED to name the
# file "index.qmd". While this isn't actually true, none of the TAs were able
# to help me figure out what options I would have to change because I was using
# a different file name. Ugh...



######  Posit Cloud  ##########################################################
# Switching over to the madlibs/ repo


