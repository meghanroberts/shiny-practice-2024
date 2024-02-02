#load packages
library(tidyverse)
library(here)

#read in raw data
lake_raw<-read_csv(here("raw_data", "FCWO_lakemonitoringdata_2011_2022_daily.csv"))

#calculate avg depth and temp
avg_depth_temp<-lake_raw %>% 
  select(Site, Depth, BedTemperature) %>% 
  filter(Depth!="NaN") %>% 
  drop_na(BedTemperature) %>% 
  group_by(Site) %>% 
  summarise(
    AvgDepth=round(mean(Depth), 1), 
    AvgTemp=round(mean(BedTemperature), 1)
  )

#join dfs together
joined_dfs<-full_join(lake_raw, avg_depth_temp)

#grab unique lakes
unique_lakes<-joined_dfs %>% 
  select(Site, Latitude, Longitude, Elevation, AvgDepth, AvgTemp) %>% #remove date
  distinct()

write.csv(unique_lakes, here("shiny-dashboard", "data", "lake_data_processed.csv"))
