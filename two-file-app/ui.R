# user interface ----
ui<- navbarPage(
  
  title="LTER Animal Data Explorer",
  
  # (Page 1) intro tab pane; -----
  tabPanel(title="About this page",
           
           "background info goes here"
           
  ), #END pg1
  # (Page 2) data vis tab panel ----
  tabPanel(title="Explore the data", 
           
           #tabsetpanel to contain tabs for data vis ----
           tabsetPanel(
             
             #trout tab panel ----
             tabPanel(title="Trout",
                      
                      #trout side bar layout ----
                      sidebarLayout(
                        
                        #trout side bar panel ----
                        sidebarPanel(
                          
                          "trout inputs will live here"
                          
                        ),#END trout side bar panel
                        
                        #trout main panel ----
                        mainPanel(
                          
                          "trout outputs here"
                          
                        )#END trout main panel
                      ) #END Trout side bar layout
                      
             ), #END trout tab panel
             #penguin tab panel ----
             tabPanel(title="Penguin",
                      
                      #penguin side bar layout ----
                      sidebarLayout(
                        
                        #penguin side bar panel ----
                        sidebarPanel(
                          
                          "penguins inputs live here"
                          
                        ), #END penguin side bar panel
                        
                        #penguin main panel -----
                        mainPanel(
                          
                          "penguin outputs here"
                          
                        ) #END penguin main panel
                        
                      ) #END penguin side bar layout
                      
             ) #END penguin tab panel
             
           )#END tabsetPanel
           
  ) #END pg 2
  
)#END navbar page