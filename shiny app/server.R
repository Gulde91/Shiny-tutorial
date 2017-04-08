library(shiny)

shinyServer(function(input, output) {
  
  # table output
  output$Table <-  renderDataTable(iris, options = list(lengthMenu=list(c(10,20,30,-1),c('10','20','30','ALL'))))
  
  # image output
  output$Image <- renderImage({
    filename <- normalizePath(file.path('./www', paste('image', input$radio, '.png', sep = '')))
    list(src=filename, width = 300, height = 200)
  }, deleteFile = F)
  
  # output text
  output$text1 <- renderPrint({
      paste('You have selected', input$slider1, 'clusters', sep = ' ')
  })
})

