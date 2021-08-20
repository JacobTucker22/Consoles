
#standard server object function
function(input, output) {
  
  #setup renderplot to output to UI
  output$consolePlot <- renderPlot({
    
    #ggplot creates the main structure of chart
    ggplot(data = subset(console_Data, console_Data$Manufacturer == input$manufacturer)) +
      
      #geom_col creates bar chart with stat = "identity", which makes heights of bars 
      #equal data values instead of counts. Other arguments define look of bar chart
      geom_col(mapping = aes(x = factor(Release_Year), y = Sales, fill = Console_Name), width = 0.4) +
      
      #ggtitle and labs identify main title of chart and axis labels
      ggtitle(input$manufacturer) + xlab("Year Released") + ylab("Units Sold in Millions") +
      
      #Theme further define particular look of chart elements
      theme(axis.text.x=element_text(angle=45,vjust=1,hjust=1, size=15), legend.position = "bottom", 
            plot.title = element_text(color="blue", size=20, face="bold", hjust = 0.5)) +
      
      #Creates random colors for console values in bars and labels the legend
      scale_fill_manual(values = c(tpalette)) + labs(fill = "Console Name")
      
  })
}