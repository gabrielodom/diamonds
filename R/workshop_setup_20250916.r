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



######  renv Setup  ###########################################################
# Switching over to penguins/ repo



######  Authentication  #######################################################
# We want to save a "secret" (an API key). We should NOT use keystrokes to save
# an API key, because we could accidentally share our .Rhistory file (which
# would have these executed lines).
# Signed up for a NEWS API key here: https://newsapi.org/
# Here is my API key that they emailed me: f2d3e6ef284046e3ac73f99e4ae4efcf
# NOTE: this is a pedagogical example ONLY. In real life, we would NEVER include
# the actual key in a readable text field.
usethis::edit_r_environ()
# This opens the .Renviron file. In this file, I will type the following:
# NEWS_API_KEY=f2d3e6ef284046e3ac73f99e4ae4efcf
# Now, restart RStudio.

# After restarting, we will create a data_news/ folder and run this code:
library(httr2)
date <- Sys.Date() - 1
req <- request("https:///newsapi.org/v2/everything") %>%
  req_url_query(
    # keyword here:
    q = '`"data science"`',
    from = date,
    pageSize = 10,
    apiKey = Sys.getenv("NEWS_API_KEY")
  )
req_perform(req, path = paste0("data_news/", date, ".json"))

# For the rest of the exercise, move to the scrape_news/ repo


