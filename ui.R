

#Standard UI object
fluidPage(
  
  #Main title on page
  titlePanel(
    "Video Game Console Sales By Year"),
  
  #creates sidebar html layout
  sidebarLayout(
    
    #creates drop down menu to select manufacturer to view
    sidebarPanel(
      selectInput("manufacturer", "Manufacturer:",
                  choices = console_Data$Manufacturer, selected = console_Data$Manufacturer[0]),
    
    #horizontal rule, thin barely visible line divider
    hr(),
    
    #additional info under selection dropdown box
    helpText("Video Game Console Manufacturers")
    ),
  
  #creates space for output plot
  mainPanel(
    plotOutput("consolePlot", height = "700px")
    )
  )
)