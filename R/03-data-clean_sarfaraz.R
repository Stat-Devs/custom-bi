################################################################################
# Data Set: FFF6611.csv
# Purpose: clean data for plotting. Add seconds too to plot
# Last edited by: Sarfaraz Jamal 
# Last edited date: 20-02-2023
################################################################################

#**********************************************
# inputs: 
#       FFF6611.csv

# outputs: 
#      data-clean.csv
#      
#**********************************************


# clear memory
rm(list = ls())

# Attach libraries -------------------------------------------------------------

library(tidyverse)
library(here)
library(lubridate)



# Specify the directory --------------------------------------------------------

here::i_am("R/03-data-clean_sarfaraz.R")


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

# convert datetime 
date_time <- substring(df$datetime, 1, 19)
gmt_offset <- substring(df$datetime, 29, 34)

df$datetime <- paste(date_time, gmt_offset, sep = " ")

df$datetime <- as.POSIXct(df$datetime)


# remove rows where bit_pos_ft and hole_dep_ft is NULL
df <- df |>
  na.omit() |>
  filter(bit_pos_ft > 0)


# saving the clean data -------------------------------------------------------

write.csv(x = df, file = 'data/clean-data/clean-data-2.csv',
          row.names = FALSE)








