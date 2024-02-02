# user interface ----
ui <- navbarPage(
  
  #theme
  theme="shiny-fresh-theme.css",
  
  # add title
  title = "LTER Animal Data Explorer",
  
  # (page 1) intro tabPanel ----
  tabPanel(title = "About this page",
           
        #intro text fluid row ----
        fluidRow(
          
          column(1), #adding space on the left
          column(10, includeMarkdown("text/about.md")),
          column(1) #adding space on the right
          
        ), #END intro text fluidrow
         
        hr(),
        
        includeMarkdown("text/footer.md")
        
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
                          ), # END channel type pickerInput
                          
                          #section checkbox group buttons ----
                          checkboxGroupButtons(inputId="section_input", 
                                               label= "Select a sampling selection(s):", 
                                               choices = c("clear cut forest", "old growth forest"),
                                               selected=c("clear cut forest", "old growth forest"),
                                               individual = FALSE, justified = TRUE, size = "sm", 
                                               checkIcon = list(yes=icon("check"), 
                                                                no=icon("xmark")) #from fontawesome
                          ) #END checkbox group buttons
                          
                          
                        ), # END trout sidebarPanel
                        
                        # trout main panel ----
                        mainPanel(
                          
                          # trout scatterplot output ----
                          plotOutput(outputId = "trout_scatterplot_output") %>% 
                            shinycssloaders::withSpinner(color="magenta", type=1) #add a loading spinner
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguins tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          # island pickerInput ----
                          pickerInput(inputId = "island_input",
                                      label = "Select island(s):",
                                      choices = unique(penguins$island), # produces a vector, all the same data type. alternatively: choices = c("rapid", "cascade" ...)
                                      selected = unique(penguins$island),
                                      options = pickerOptions(actionsBox = TRUE), # lets you select all or deselect all 
                                      multiple = TRUE # you can select multiple channel type options
                          ), # END island pickerInput
                          
                          #bin width slider -----
                          sliderInput(inputId="bin_width_input",
                                      label="Select the number of bins:",
                                      min=5, max=100, value=25)
                          
                        ), # END penguin sidebarPanel
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          # penguin scatterplot output ----
                          plotOutput(outputId = "penguin_barchart") %>% 
                            shinycssloaders::withSpinner(color="magenta", type=1)
                          
                        ) # END mainPanel 
                        
                      ) # END penguin sidebarLayout
                      
             ) #END penguins tabPanel
             
           ) # END tabsetPanel
           
  ) # END Page 2) data viz tabPanel
  
) # END navbarPage


