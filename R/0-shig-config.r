#----------------------------
# chat-amr-config.R
#
# CHAT trial
# AMR analyses
#
# Configuration file
#
# Load packages, color palettes
# set up for parallel computing
#----------------------------


#----------------------------
# load worker packages
#----------------------------
library(here)
library(tidyverse)
library(readxl)
library(broom)
library(kableExtra)
library(table1)

#----------------------------
# data visualization packages
#----------------------------
library(patchwork)
library(ggplot2)
library(cowplot)
library(RColorBrewer)

#----------------------------
# load stats packages
#----------------------------
library(sandwich)
library(lmtest)

#----------------------------
# set up for parallel computing
#----------------------------
library(foreach)
library(doParallel)
registerDoParallel(detectCores() - 1)

#----------------------------
# custom color pallettes
#----------------------------
# safe color blind palette
# http://jfly.iam.u-tokyo.ac.jp/color/
# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# Reference: Bang Wong, Nature Methods 2011: https://www.nature.com/articles/nmeth.1618
cbpal <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# NY Times rainbow from the Upshot
# https://www.nytimes.com/interactive/2020/03/21/upshot/coronavirus-deaths-by-country.html
nytpal <- c("#510000", "#AC112D", "#EC6D47", "#F2A058", "#F7D269", "#839772", "#325D8A")

#----------------------------
# set Box data directory
# datasets
#----------------------------
metadatadir <- "~/Library/CloudStorage/Box-Box/washb-serimmune/sample-selection/output"
datadir <- "~/Library/CloudStorage/Box-Box/washb-serimmune/data/final"


