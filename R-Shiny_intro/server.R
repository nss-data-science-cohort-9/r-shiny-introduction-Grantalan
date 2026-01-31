#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define server logic required to draw a histogram
function(input, output, session) {
  
  output$distPlot <- renderPlot({
    
    if(input$island != "All"){
      plot_data <- penguins |> 
        filter(island == input$island)
      title <- glue("Distribution of {input$hist_variable} for {input$island} Island")
    } else if(input$island == 'All'){
      plot_data <- penguins
      title <- glue("Distribution of {input$hist_variable}")
    }
    
    plot_data |> 
      ggplot(aes(x = .data[[input$hist_variable]])) +
      geom_histogram(bins = input$bins) +
      labs(title = title)
  })
  
  output$barPlot <- renderPlot({
    
    if(input$island != "All"){
      plot_data <- penguins |> 
        filter(island == input$island)
      title <- glue("Distribution of Body Mass for {input$island} Island")
    } else if(input$island == 'All'){
      plot_data <- penguins
      title <- "Distribution of Body Mass"
    }
    
    plot_data |> 
      ggplot(aes(x = species)) +
      geom_bar()
    
  })
  
  output$selectedTable <- renderDataTable({
    
    if(input$island != "All"){
      selected_data <- penguins |> 
        filter(island == input$island)
    } else if(input$island == 'All'){
      selected_data <- penguins
    }
    
    selected_data
    
  })
  
  
}
