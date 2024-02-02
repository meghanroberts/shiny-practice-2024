server <- function(input, output) {
  
  
  # filter penguin species (scatterplot) ----
  filtered_spp_scatterplot_df <- reactive ({
    
    penguins |>
      filter(species %in% input$penguinSpp_scatterplot_input)
    
  })
  
  
  # render the scatterplot output ----
  output$penguin_scatterplot_output <- renderPlot({
    
    ggplot(na.omit(filtered_spp_scatterplot_df()),
           aes(x = bill_length_mm, y = bill_depth_mm,
               color = species, shape = species)) +
      geom_point() +
      geom_smooth(method = "lm", se = FALSE, aes(color = species)) + 
      scale_color_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      scale_shape_manual(values = c("Adelie" = 19, "Chinstrap" = 17, "Gentoo" = 15)) +
      labs(x = "Flipper length (mm)", y = "Bill length (mm)",
           color = "Penguin species", shape = "Penguin species")
    
  })
  
  
  # filter penguin species (histogram) ----
  filtered_spp_histogram_df <- reactive ({
    
    penguins |>
      filter(species %in% input$penguinSpp_histogram_input)
    
  })
  
  # render the histogram output ----
  output$penguin_histogram_output <- renderPlot({
    
    ggplot(na.omit(filtered_spp_histogram_df()),
           aes(x = flipper_length_mm, fill = species)) +
      geom_histogram(alpha = 0.5, position = "identity") +
      scale_fill_manual(values = c("Adelie" = "#FEA346", "Chinstrap" = "#B251F1", "Gentoo" = "#4BA4A4")) +
      labs(x = "Flipper length (mm)", y = "Frequency",
           fill = "Penguin species")
    
  })
  
} # END server