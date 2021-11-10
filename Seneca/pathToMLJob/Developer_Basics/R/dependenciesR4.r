# For an almost freash R 4.02 in Ubuntu 16.04, with R-studio 1.3
packagesInstall1 <- c("rprojroot", "assertthat", "desc")
install.packages(packagesInstall1)
packIn2 <- c("cli", "pkgbuild", "pkgload")
install.packages(packIn2)
install.packages("dbplyr")
install.packages(c("colorspace", "munsell"))
install.packages(c("cellranger", "readxl"))
install.packages(c("gtable", "scales", "ggplot2", "tidyverse"))

require(tidyverse)
# TODO: devtools
install.packages(c("lazyeval", "covr"))
install.packages("devtools")

# https://hodgettsp.github.io/cesR/
# TODO: for blogdown
install.packages("mime")
install.packages(c("xtable", "shiny"))

install.packages(c("servr", "miniUI", "blogdown"))

