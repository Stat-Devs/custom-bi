################################################################################
# Data Set: FFF6611.csv
# Purpose: Create a line chart with inverted axis.
# Last edited by: Muhammad Uzair 
# Last edited date: 20-02-2023
################################################################################

#**********************************************
# inputs: 
#       FFF6611.csv

# outputs: 
#      co2-processed.csv
#      co2-processed-min.csv
#      co2-processed-max.csv
#      
#**********************************************


# clear memory
rm(list = ls())

# Attach libraries -------------------------------------------------------------

library(tidyverse)
library(here)
library(readxl)
library(janitor)
library(lubridate)



# Specify the directory --------------------------------------------------------

here::i_am("R/custom-line-U.R")


# loading raw data  ------------------------------------------------------------


# load in raw data and create workfile
df <- read_csv(here("data","raw-data","FFF6611.csv"))


#











