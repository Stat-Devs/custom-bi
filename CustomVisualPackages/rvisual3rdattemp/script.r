source('./r_files/flatten_HTML.r')

############### Library Declarations ###############
libraryRequireInstall("ggplot2");
libraryRequireInstall("plotly")
####################################################

################### Actual code ####################
BaseColour = "#777777"
  LightGrey = "#01B8AA"
    
  
  # Custom line chart 
  bit_depth_plot = 
    ggplot(Values) + 
    geom_line(aes(x = hole_dep_ft, y = datetime),alpha = 0.7, color = "blue", orientation = "y", linewidth = 0.7) +
    
    theme_bw()
  
  # Build Power BI theme ---------------------------------------------------------
  
  bit_depth_plot_themed_bi = bit_depth_plot + theme(
    axis.text = element_text(size = 11, family = " Segoe UI", colour = BaseColour),
    axis.ticks = element_blank(), 
    axis.title = element_text(size = 11, family = "Segoe UI", colour = BaseColour),
    panel.grid.major.y = element_line( size = .1, color = BaseColour),   
    panel.grid.major.x = element_blank(),   
    panel.background = element_blank()  
  )
  
  
####################################################

############# Create and save widget ###############
p = ggplotly(bit_depth_plot_themed_bi);
internalSaveWidget(p, 'out.html');
####################################################


