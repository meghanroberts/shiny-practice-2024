# user interface ----
ui <- navbarPage(
  
  # add title
  title = "LTER Animal Data Explorer",
  
  # (page 1) intro tabPanel ----
  tabPanel(title = "About this page",
           
           "background info goes here"
           
  ), # END (page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout ----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type), # produces a vector, all the same data type. alternatively: choices = c("rapid", "cascade" ...)
                                      selected = c("cascade", "pool"),
                                      options = pickerOptions(actionsBox = TRUE), # lets you select all or deselect all 
                                      multiple = TRUE # you can select multiple channel type options
                          ) # END channel type pickerInput
                          
                        ), # END trout sidebarPanel
                        
                        # trout main panel ----
                        mainPanel(
                          
                          # trout scatterplot output ----
                          plotOutput(outputId = "trout_scatterplot_output")
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguins tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          "penguin inputs will live here"
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          "penguin outputs will live here :)"
                          
                        ) # END mainPanel 
                        
                      ) # END penguin sidebarLayout
                      
             ) #END penguins tabPanel
             
           ) # END tabsetPanel
           
  ) # END Page 2) data viz tabPanel
  
) # END navbarPage


