# dahsboard header -----------------------------------
header<-dashboardHeader(
  
  #title ----------------
  title="Fish Creek Watershed Lake Monitoring", 
  titleWidth = 400 #make sure the entire title is visible
)

#dashboard sidebar --------------------------------
sidebar<-dashboardSidebar(
  
  #sidebar------------------
  sidebarMenu(
    
    menuItem(text="Welcome", 
             tabName = "welcome", #used to identify this sidetab later on
             icon=icon("star")), 
    menuItem(text="Dashboard", 
             tabName = "dashboard", 
             icon=icon("gauge"))
  ) #END sidebarMenu
  
  
)

#dashboard body ------------------------------------
body<-dashboardBody(
  
  #theme here ------------------------------------
  fresh::use_theme("dashboard-fresh-theme.css"),
  
  #tab items (container function)---------------
  tabItems(
    
    #welcome tabeItem --------------
    tabItem(
      tabName = "welcome", #from above
      
      #left-hand column
      column(width=6, 
             
             #background info box
             box(width=NULL, #takes on width of the column
                 title = tagList(icon("water"), 
                                 strong("Monitoring Fish Creek Watershed")),
                 includeMarkdown("text/intro.md"), 
                 tags$img(src="FishCreekWatershedSiteMap_2020.jpg",
                          alt="A map of Northern Alaska showing Fish Creek Watershed located within the National Petroleum Reserve.",
                          style="max-width:100%;"), #css to ensure the map is the correct size
                 tags$h6(tags$em("Map Source:", tags$a(href="http://www.fishcreekwatershed.org", 
                                                       "FCWO")), #end italics
                         style="text-align: center;")#end h6 (size)
             ) #END background box
             
      ), #END column
      
      #right-hand column
      column(width=6, 
             
             #create two boxes set on top of one another
             #fluidrow one------------------------
             fluidRow(
               
               #citation box
               box(width=NULL, 
                   title = tagList(
                     icon("table"), 
                     strong("Data Source")),
                   includeMarkdown("text/citation.md")
               )#END citation box
               
             ),#END fluidrow one
             
             #fluidrow two --------------------------
             fluidRow(
               
               #disclaimer box
               box(width=NULL, 
                   title = tagList(
                     icon("triangle-exclamation"), 
                     strong("Disclaimer")),
                   includeMarkdown("text/disclaimer.md")
               ) #END disclaimer box
             ) #END fluidrow two
             
      )#END column right
      
    ), #END welcome tab item
    
    #dashboard tabeItem --------------
    tabItem(
      tabName = "dashboard", #from above
      
      #fluid row ------------
      fluidRow(
        
        #input box -----------
        box(width = 4, 
            
            title=tags$strong("Adjust lake parameter ranges:"),
            
            #first slider input ---------------
            sliderInput(inputId="elevation_slider_input", 
                        label = "Elevation (meters above sea level):", 
                        min=min(lake_data$Elevation), 
                        max=max(lake_data$Elevation),
                        value=c(min(lake_data$Elevation), max(lake_data$Elevation)) #two point slider
            ),#END first slider input
            
            #second slider input ---------------
            sliderInput(inputId="depth_slider_input", 
                        label = "Depth (meters):", 
                        min=min(lake_data$AvgDepth), 
                        max=max(lake_data$AvgDepth),
                        value=c(min(lake_data$AvgDepth), max(lake_data$AvgDepth)) #two point slider
            ),#END second slider input
            
            #third slider input ---------------
            sliderInput(inputId="temp_slider_input", 
                        label = "Temp (\u00b0C):", 
                        min=min(lake_data$AvgTemp), 
                        max=max(lake_data$AvgTemp),
                        value=c(min(lake_data$AvgTemp), max(lake_data$AvgTemp)) #two point slider
            )#END third slider input
            
        ), #END input box
        
        
        #map box --------------
        box(width=8, 
            title=tags$strong("Monitoring Lakes within Fish Creek Watershed"), 
            
            #leaflet output
            leafletOutput(outputId = "lake_map_output") %>% 
              withSpinner(type = 1, color="#4287f5")
        ) #END map here
        
      )#END Fluidrow
      
    ) #END dashboard tab item
    
  )#END tab items
  
)#END dashboard body

#combine them ----------------------------------------
dashboardPage(header, sidebar, body)

