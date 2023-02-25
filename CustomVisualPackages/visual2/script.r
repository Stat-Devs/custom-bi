source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
library(plotly)
library(ggplot2)
library(htmlwidgets)
####################################################

################### Actual code ####################
##BaseGrey
BaseColour = "#777777"
  LightGrey = "#01B8AA"
    
  
  # Custom line chart 
  bit_depth_plot <- ggplot(data = dataset, aes(x = hole_dep_ft, y = datetime)) + 
    geom_line(alpha = 0.7, color = "blue", orientation = "y", linewidth = 0.7) +
    xlab("Hole Depth (ft)") +
    ylab("Time (Hours)") +
    ggtitle("Hole Depth with respect to time") +
    scale_x_continuous(breaks = c(14200, 14300, 14400, 14500, 14600, 14700, 
                                  14800, 14900, 15000), 
                       labels = c("14,200", "14,300", "14,400","14,500", "14,600",
                                  "14,700","14800", "14,900", "15,000"))+
    theme_bw()
  bit_depth_plot_themed_bi <- bit_depth_plot + theme(
    axis.text = element_text(size = 11, family = " Segoe UI", colour = BaseColour),
    axis.ticks = element_blank(), 
    axis.title = element_text(size = 11, family = "Segoe UI", colour = BaseColour),
    panel.grid.major.y = element_line( size = .1, color = BaseColour),   
    panel.grid.major.x = element_blank(),   
    panel.background = element_blank()  
  )
  
  bit_depth_plot_themed_bi;
####################################################

############# Create and save widget ###############

####################################################

################ Reduce paddings ###################

####################################################
