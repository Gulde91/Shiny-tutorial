library(shiny)



shinyServer(function(input, output) {
  output$Table <-  renderDataTable(iris, options = list(lengthMenu=list(c(10,20,30,-1),c('10','20','30','ALL'))))
})

