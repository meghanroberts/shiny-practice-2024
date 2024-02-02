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
  
  #tab items (container function)---------------
  tabItems(
    
    #welcome tabeItem --------------
    tabItem(
      tabName = "welcome", #from above
        
      #left-hand column
      column(width=6, 
             
             #background info box
             box(width=NULL, #takes on width of the column
                 "background info here"
                 ) #END background box
             
             ), #END column
      
      #right-hand column
      column(width=6, 
             
             #create two boxes set on top of one another
             #fluidrow one------------------------
             fluidRow(
               
               #citation box
               box(width=NULL, 
                   "citation here"
                   )#END citation box
               
             ),#END fluidrow one
             
             #fluidrow two --------------------------
             fluidRow(
               
               #disclaimer box
               box(width=NULL, 
                   "disclaimer here"
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
            "slider inputs here"
            ), #END input box
        #map box --------------
        box(width=8, 
            "map here"
            ) #END map here
        
      )#END Fluidrow
      
    ) #END dashboard tab item
    
  )#END tab items
  
)#END dashboard body

#combine them ----------------------------------------
dashboardPage(header, sidebar, body)

