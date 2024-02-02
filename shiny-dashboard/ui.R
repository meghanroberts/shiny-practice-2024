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
             tabName = "dashboar", 
             icon=icon("gauge"))
  ) #END sidebarMenu
  
  
)

#dashboard body ------------------------------------
body<-dashboardBody()

#cmobine them ----------------------------------------
dashboardPage(header, sidebar, body)