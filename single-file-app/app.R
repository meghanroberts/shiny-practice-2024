# load packages ----
library(shiny)
library(palmerpenguins)
library(tidyverse)
library(DT)

# user interface ----
ui<-fluidPage(
  
  #app title ----
  tags$h1("My App Title"), #level one header
  
  #app subtitle ----
  h4(strong("Exploring Antarctic Penguin Data")), #level four header and bold
  
  
  #body mass slider input ----
  sliderInput(inputId="body_mass_input",
              label="Select a range of body masses (g):",
              min=2700, max=6300, value=c(3000,4000)),
  
  #body mass plot output ----
  plotOutput(outputId = "body_mass_scatterplot_output"),
  
  
  #year input for table
  checkboxGroupInput(inputId = "year_input", 
                     label = "Select year(s):",
                     choices=c(unique(penguins$year)),
                     selected=c("2007","2008")),
  
  #table output
  DT::dataTableOutput(outputId = "penguin_dt_output")
  
)

# server ----
server<-function(input, output) { #must be singular, not plural
  
  #filter body masses ----
  body_mass_df<-reactive({
    
    penguins %>% 
      filter(body_mass_g %in% c(input$body_mass_input[1]:input$body_mass_input[2]))
  })
  
  #render penguin scatterplot ----
  output$body_mass_scatterplot_output<- renderPlot({ #code to generate plot
    
    ggplot(na.omit(body_mass_df()), #reactice df needs () after
           aes(x=flipper_length_mm, y=bill_length_mm, 
               color=species, shape+species))+
      geom_point()+
      scale_color_manual(values =c("Adelie"="darkorange", "Chinstrap"="purple","Gentoo"= "cyan4"))+
      scale_shape_manual(values= c("Adelie"=19, "Chinstrap"=17,"Gentoo"=15))+
      labs(x="Flipper Length (mm)", 
           y="Bill Length (mm)", color="Penguin species", shape="Penguin species")+
      theme_minimal()+
      theme(legend.position = c(0.85, 0.2), 
            legend.background = element_rect(color="white"))
    
  })
  
  #filter for years
  years_df<-reactive({
    
    penguins %>% 
      filter(year %in% c(input$year_input))
    
  })
  
  #render table
  output$penguin_dt_output<-DT::renderDataTable({
    DT::datatable(years_df())
  })
}

# combine ui and server into app ----
shinyApp(ui=ui, server=server)