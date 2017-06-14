
library(shiny)
library(raster)
library(rgdal)


Landstack <-stack("Landsat7.tif")
windows()
plot(Satband3)
Satband1 <- raster("Landsat7.tif", band = 1)
Satband2 <- raster("Landsat7.tif", band = 2)
Satband3 <- raster("Landsat7.tif", band = 3)
Satband4 <- raster("Landsat7.tif", band = 4)
Satband5 <- raster("Landsat7.tif", band = 5)


ui <- fluidPage (selectInput("red",label = "Choose a Band to display as Red",choices = c("Satband1","Satband2","Satband3","Satband4","Satband5")), imageOutput("myImage"))

server <- function(input, output) {
  output$myImage <- tempfile(fileext = ".tif")
}
shinyApp(ui = ui, server = server)
