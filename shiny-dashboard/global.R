#load packages
library(shiny)
library(shinydashboard)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown) #to load text

#read in data -----------------------
#don't use here in an app
#start from within shiny_dashboard folder
lake_data<-read_csv("data/lake_data_processed.csv")

