# configure data directories
# source base functions
# load libraries
# setup cores for parallel computing
#######################################

if (!require("pacman")) install.packages("pacman")
p_load(here, tidyverse, kableExtra, haven, table1, WriteXLS, readxl, openxlsx, reshape2, patchwork, circlize, devtools, ggdist, 
       ggbeeswarm, gghalves, rcartocolor, NatParksPalettes, viridis, ggsignif, stringr)

# Setup multiple cores for large file processing:
n.cores <- parallel::detectCores() - 2
my.cluster <- parallel::makeCluster(n.cores, type = "FORK")
print(my.cluster)
doParallel::registerDoParallel(cl = my.cluster)
foreach::getDoParRegistered()
foreach::getDoParWorkers() #how many workers are available?


# define directories
data_dir <- here("../../data/final/individual_antigen_raw_data_files/")
out_dir_w <- paste0(here::here(),"/output/")
code_dir <- paste0(here::here(), "/R/")

# safe color blind palette
# http://jfly.iam.u-tokyo.ac.jp/color/
# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# Reference: Bang Wong, Nature Methods 2011: https://www.nature.com/articles/nmeth.1618
cbpal <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
cpal <- c("#FF8C00", "#A034F0", "#159090", "#8B3A62", "#6DBCC3")

# bright color blind palette:  https://personal.sron.nl/~pault/ 
cblack <- "#000004FF"
cblue <- "#3366AA"
cteal <- "#11AA99"
cgreen <- "#66AA55"
cchartr <- "#CCCC55"
cmagent <- "#992288"
cred <- "#EE3333"
corange <- "#EEA722"
cyellow <- "#FFEE33"
cgrey <- "#777777"

# other colors:
# https://github.com/kevinsblake/NatParksPalettes
# natparks.pals(name="DeathValley",n=7,type="discrete")[c(2,5,7)]
# q_pal <- colorspace::lighten(rcartocolor::carto_pal(n = 4, name = "Geyser")[c(2, 1, 4, 3)], .6)
# q_pal <- colorspace::adjust_transparency(rcartocolor::carto_pal(n = 4, name = "Tropic")[c(2, 1, 4, 3)], alpha = .7)
# values = c("#994c00", "grey70", "#003366")

