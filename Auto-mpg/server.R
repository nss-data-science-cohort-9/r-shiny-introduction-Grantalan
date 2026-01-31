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
    
    if(input$origin != "All"){
      plot_data <- cars |> 
        filter(origin == input$origin)
      title <- glue("Distribution of {input$hist_variable} for Origin {input$origin}")
    } else if(input$origin == 'All'){
      plot_data <- cars
      title <- glue("Distribution of {input$hist_variable}")
    }
    
    plot_data |> 
      ggplot(aes(x = .data[[input$hist_variable]])) +
      geom_histogram(bins = input$bins) +
      labs(title = title)
  })
  
  output$barPlot <- renderPlot({
    
    if(input$origin != "All"){
      plot_data <- cars |> 
        filter(origin == input$origin)
      title <- glue("Count of cars by cylinder (Origin {input$island})")
    } else if(input$origin == 'All'){
      plot_data <- cars
      title <- "Count of cars by cylinder"
    }
    
    plot_data |> 
      ggplot(aes(x = cylinders)) +
      geom_bar() +
      labs(title = title, x = "Cylinders", y = "Count")
    
  })
  
  output$selectedTable <- renderDataTable({
    
    if(input$origin != "All"){
      selected_data <- cars |> 
        filter(origin == input$origin)
    } else if(input$origin == 'All'){
      selected_data <- cars
    }
    
    selected_data
    
  })
  
  
}
