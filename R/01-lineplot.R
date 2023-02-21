################################################################################
# Data Set: data-clean.csv
# Purpose: Prepare vertical line plot.
# Last edited by: Muhammad Uzair 
# Last edited date: 21-02-2023
################################################################################

#**********************************************
# inputs: 
#       FFF6611.csv

# outputs: 
#      vertical-line-plot.
#      
#**********************************************


# clear memory
rm(list = ls())

# Attach libraries -------------------------------------------------------------

library(tidyverse)
library(here)

# Specify the directory --------------------------------------------------------

here::i_am("R/01-lineplot.R")


# loading raw data  ------------------------------------------------------------


# load in raw data and create workfile
df <- read_csv(here("data","clean-data","data-clean.csv"))



# Plotting ---------------------------------------------------------------------

##BaseGrey
BaseColour = "#777777"
LightGrey = "#01B8AA"


# Custom line chart 
bit_depth_plot <- ggplot(data = df, aes(x = hole_dep_ft, y = datetime)) + 
  geom_line(alpha = 0.7, color = "blue", orientation = "y", size = 0.7) +
  xlab("Hole Depth (ft)") +
  ylab("Time (Hours)") +
  ggtitle("Hole Depth with respect to time") +
  scale_x_continuous(breaks = c(14200, 14300, 14400, 14500, 14600, 14700, 
                                14800, 14900, 15000), 
                     labels = c("14,200", "14,300", "14,400","14,500", "14,600",
                                "14,700","14800", "14,900", "15,000")) +
  scale_y_datetime(
    date_minor_breaks = "1 hour", date_breaks = "1 hour",
    date_labels = "%d-%m-%y %H:%M:%p",
  ) +
  theme_bw()

# Build Power BI theme ---------------------------------------------------------

bit_depth_plot_themed_bi <- bit_depth_plot + theme(
  axis.text = element_text(size = 11, family = " Segoe UI", colour = BaseColour),
  axis.ticks = element_blank(), 
  axis.title = element_text(size = 11, family = "Segoe UI", colour = BaseColour),
  panel.grid.major.y = element_line( size = .1, color = BaseColour),   
  panel.grid.major.x = element_blank(),   
  panel.background = element_blank()  
)

#save the plot
ggsave(filename = "vertical-line-bit-depth-plot", plot = bit_depth_plot_themed_bi,
      device = "png", path = 'plots/visual-2',
      width = 30, height = 30, units = "cm")



















