library(tidyverse)
library(leaflet)
library(here)

#read in data
lake_data<-read_csv(here("shiny-dashboard", "data", "lake_data_processed.csv"))

#practice filtering (for sliders)
filtered_lakes<-lake_data %>% 
  filter(Elevation >= 8 & Elevation <= 20) %>% 
  filter(AvgDepth >= 2 & AvgDepth <= 3) %>% 
  filter(AvgTemp >= 4 & AvgTemp <= 6)

#build leaflet map
leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery) %>% 
  setView(lng=-152.05, lat=70.25, zoom=6) %>% 
  addMiniMap(toggleDisplay = TRUE, minimized = FALSE) %>% #corner map
  addMarkers(data=filtered_lakes, 
             lng=filtered_lakes$Longitude, 
             lat=filtered_lakes$Latitude, 
             popup = paste0( #defines pop up text
               "Site Name: ", filtered_lakes$Site,"<br>", #br to make new line
               "Elevation: ", filtered_lakes$Elevation, " meters (above sea level)", "<br>", 
               "Average Depth: ", filtered_lakes$AvgDepth, " meters", "<br>", 
               "Average Lake Bed Temperature: ", filtered_lakes$AvgTemp, " \u00b0C" #unicode value for degree symbol
             )) 
