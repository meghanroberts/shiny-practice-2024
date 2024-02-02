server<-function(input, output){
  
  #filter lake data
  filtered_lakes_df<-reactive({
    
    lake_data %>% 
      filter(Elevation >= input$elevation_slider_input[1] & 
               Elevation <= input$elevation_slider_input[2])%>% 
      filter(AvgDepth >= input$depth_slider_input[1] & 
               AvgDepth <= input$depth_slider_input[2]) %>% 
      filter(AvgTemp >= input$temp_slider_input[1] & 
               AvgTemp <= input$temp_slider_input[2])
    
  }) #END reactive
    
  
  #building map  ---------------
  output$lake_map_output<-renderLeaflet({
    
    leaflet() %>% 
      addProviderTiles(providers$Esri.WorldImagery) %>% 
      setView(lng=-152.05, lat=70.25, zoom=6) %>% 
      addMiniMap(toggleDisplay = TRUE, minimized = FALSE) %>% #corner map
      addMarkers(data=filtered_lakes_df(), 
                 lng=filtered_lakes_df()$Longitude, 
                 lat=filtered_lakes_df()$Latitude, 
                 popup = paste0( #defines pop up text
                   "Site Name: ", filtered_lakes_df()$Site,"<br>", #br to make new line
                   "Elevation: ", filtered_lakes_df()$Elevation, " meters (above sea level)", "<br>", 
                   "Average Depth: ", filtered_lakes_df()$AvgDepth, " meters", "<br>", 
                   "Average Lake Bed Temperature: ", filtered_lakes_df()$AvgTemp, " \u00b0C" #unicode value for degree symbol
                 )) 
  })
  
}
