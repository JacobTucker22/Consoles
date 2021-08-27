#Libraries used by the program
library(shiny)
library(shinythemes)
library(tidyverse)
library(randomcoloR)

#global variables
#create data set object
console_Data <- read.csv("console.csv")

#uses random color to create distinct colors for bar chart
tpalette <- randomColor(45, luminosity = "bright")
