library(tidyverse)
library(shiny)

homerange <- read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")

ui <- fluidPage(
  
  radioButtons("Fill", 
               "Select Fill Variable", 
               choices = c("trophic.guild", "thermoregulation"), 
               selected = "trophic.guild"),
  
  plotOutput("plot")
)

server <- function(input, output, session) {
  
  output$plot<- renderPlot({ #defining the output
    
    ggplot(data = homerange,
           aes_string(x = "locomotion", fill = input$Fill))+ #make sure to use aes_string not aes
      geom_bar(pos = "dodge", alpha = 0.6, color = "black")+
      theme_light(base_size = 14)
  })
}

shinyApp(ui, server)