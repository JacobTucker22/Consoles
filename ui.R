#Standard UI object
shinyUI(fluidPage(
  theme = shinytheme("superhero"),
  
  #Main title on page
  titlePanel("Video Game Console Sales By Year"),
  
  navbarPage(
    "Navbar",
    tabPanel(icon("home"),
             
             #creates sidebar html layout
             sidebarLayout(
               #creates drop down menu to select manufacturer to view
               sidebarPanel(
                 selectInput(
                   "manufacturer",
                   "Manufacturer:",
                   choices = console_Data$Manufacturer,
                   selected = console_Data$Manufacturer[0]
                 ),
                 
                 #horizontal rule, thin barely visible line divider
                 hr(),
                 
                 #additional info under selection dropdown box
                 helpText("Video Game Console Manufacturers")
               ),
               
               #creates space for output plot
               mainPanel(plotOutput("consolePlot", height = "700px"))
             )),
    
    tabPanel("New Tab",
             fluidRow(column(12, offset = 3,
                             "First",
                             radioButtons("radio", "Radio Buttons", 
                                          c("1" = "First",
                                            "2" = "Second",
                                            "3" = "Third"), inline = TRUE),
                             textAreaInput("TextBox", "TextBox", "Text"),
                      column(6, offset = 3,
                             "Second",
                             sliderInput("Slider", "Slider", 0, 100, 1)
                             )),
                      hr(),
                      
                      ),
             sidebarLayout(
               sidebarPanel("side panel", width = 2,
                 checkboxGroupInput("CheckBox", "CheckBox",
                                    c("These",
                                      "Are",
                                      "Test",
                                      "Boxes")),
                 helpText("Help Text")
               ),
               mainPanel("MainPanel",
                         textOutput("Text")
               )
             )
    )
  )
))