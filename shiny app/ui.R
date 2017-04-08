library(shiny)

ui <- shinyUI(fluidPage(
  titlePanel('Shiny app'),
  sidebarLayout(
    sidebarPanel("sidebar panel"),
    mainPanel("main panel")
  )
))


server <- shinyServer(function(input, output) {})


shinyApp(ui=ui, server = server)

