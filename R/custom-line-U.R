################################################################################
# Data Set: FFF6611.csv
# Purpose: clean data for plotting.
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



# rename columns --------------------------------------------------------------

df <- df |>
  rename(datetime = "RIGTIME",
         bit_pos_ft = "Bit Position (ft)",
         hole_dep_ft = "Hole Depth (ft)",
         rig_state = "RigState") 


# data cleaning ----------------------------------------------------------------


# remove rows where bit_pos_ft and hole_dep_ft is NULL
df <- df |>
  na.omit()



# convert datetime as lubridate datetime
df$datetime <- ymd_hms(df$datetime)


# saving the clean data

# save the clean co2 pressure and temp data
write.csv(x = df, file = 'data/clean-data/data-clean.csv',
          row.names = FALSE)








