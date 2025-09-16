# Workshop setup
# Gabriel Odom
# 2025-09-16

install.packages("pak")
pak::pak(c("usethis", "pointblank", "logger", "nanoparquet", "rsconnect", "shiny"))

# Notes: https://github.com/posit-conf-2025/r-production?tab=readme-ov-file
# Chapter 1: https://github.com/posit-conf-2025/r-production/blob/main/materials/1-whole-game.pdf

usethis::use_git()
usethis::use_github()
