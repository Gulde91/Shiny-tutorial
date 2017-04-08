library(shiny)

shinyServer(function(input, output) {
  
  # table output
  output$Table <-  renderDataTable(iris, options = list(lengthMenu=list(c(10,20,30,-1),c('10','20','30','ALL'))))
  
  # image output
#  output$Image <- renderImage({
#    filename <- normalizePath(file.path('./www', paste('image', input$radio, '.jpg', sep = '')))
#    list(src=filename, width = 100, height = 100)
#  }, deleteFile = F)
  
  # plot output
  output$plot1 <- renderPlot({
    plot(iris$Sepal.Length, iris$Sepal.Width, 
         main = 'K-Means', xlab = 'Sepal Length', ylab = 'Sepal Width', 
         cex.main = 3, font.main = 3, col.main = 'green')
  }, width = "auto", height = "auto"
  )
  
  # output verbatim
  output$coord <- renderText({
    paste0("x =  ", input$mouse$x, '\ny =  ', input$mouse$y)
  })
  
  # output text
  output$text1 <- renderText({
      paste("You have selected", input$slider1,"clusters")
  })
  
  # summary table
  sum <- as.data.frame.array(summary(iris))
  output$Table2 <- renderDataTable(sum)
  
  # renderUI
  output$All <- renderUI({
    tagList(
      sliderInput('slider1', label = h4('Clusters'), 
                  min = 3, max = 10, value = 3),
      textOutput('text1')
    )
  })
})
