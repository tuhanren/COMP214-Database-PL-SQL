## set up workspace
rm(list = ls()) # release the memory 
options(stringsAsFactors = F)
options(dplyr.width = Inf)
getwd()

# pacman for package management 
# TODO: dependency remotes
# install.packages("pacman")
# load the package, if not installed, then install it
pacman::p_load(rgl)
require(rgl)
######## toy data generation ##############
x <- runif(100, 0, 100)
y <- runif(100, 0, 80)
z <- y + runif(100, 0, 20)
# scatter plot
plot(x,y); plot(x,z); plot(y,z)
plotsd(x, y, z)


