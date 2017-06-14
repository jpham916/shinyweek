

library(shiny)
library(raster)
library(rgdal)


Landstack <- stack("Landsat7.tif")

ui <- fluidPage (selectInput("red",
            label = "Choose a Band to display as Red",
            choices = c("1","2","3","4","5"),
            plotText("redband")
))

server <- function(input, output) {
  output$redband <- input$red
  #output$myplot <- renderPlot(plot(Landstack[[redband]]))
}
shinyApp(ui = ui, server = server)