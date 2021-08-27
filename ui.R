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
    
    #Second tab for Navbar
    tabPanel("New Tab",
             #FluidRow specifies layout using columns
             fluidRow(column(12, offset = 3,
                             "First",
                             #Radio Buttons in first column
                             radioButtons("radio", "Radio Buttons", 
                                          c("1" = "First",
                                            "2" = "Second",
                                            "3" = "Third"), inline = TRUE),
                             #Text input  underneath radio buttons
                             textAreaInput("TextBox", "TextBox", "Text"),
                             #Nested column inherits base position from parent column
                      column(6, offset = 3,
                             "Second",
                             #Slider input in nested column
                             sliderInput("Slider", "Slider", 0, 100, 1)
                             )),
                      #Horizontal Rule
                      hr(),
                      
                      ),
             #Sidebar layout setup underneath first set of nested columns
             sidebarLayout(
               sidebarPanel("side panel", width = 2,
                            #Checkboxes inside sidepanel
                 checkboxGroupInput("CheckBox", "CheckBox",
                                    c("These",
                                      "Are",
                                      "Test",
                                      "Boxes")),
                 #Helptext underneath checkboxes inside of sidepanel
                 helpText("Help Text")
               ),
               #Main panel for tab 2 with text output
               mainPanel("MainPanel",
                         textOutput("Text")
               )
             )
    )
  )
))