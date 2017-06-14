
library(shiny)
library(raster)
library(rgdal)

ui <- fluidPage(
  
  titlePanel("Only thing separating us from Summer!"),
  
  sidebarLayout(
  
    sidebarPanel(
  selectInput("n",label = "Choose a Landsat Band to display",choices = c("1","2","3","4","5"))),
  mainPanel(
    imageOutput("preImage")
  )
  
    
  )
)


server <- function(input, output) {
 
  output$preImage <- renderImage({

  filename <- normalizePath(file.path('shinyimages/',paste('satband', input$n, '.png', sep='')))
    
    # Return a list containing the filename and alt text
    list(src = filename,
         alt = paste("Image number", input$n))
    
  }, deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)
