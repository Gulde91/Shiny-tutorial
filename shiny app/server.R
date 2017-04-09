library(shiny)

shinyServer(function(input, output) {
  
  # table output
  output$Table <-  renderDataTable(iris, options = list(lengthMenu=list(c(10,20,30,-1),c('10','20','30','ALL'))))
  

  # plot output
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    plot(Data(), 
         main = 'K-Means',  
         cex.main = 3, font.main = 3, col.main = 'blue', 
         col = clusters()$cluster, pch = 20, cex = 3)
  }, width = "auto", height = "auto"
  )
  
  # output verbatim
  output$coord <- renderText({
    paste0("x =  ", input$mouse$x, '\ny =  ', input$mouse$y)
  })
  
  
  # summary table
  sum <- as.data.frame.array(summary(iris))
  output$Table2 <- renderDataTable(sum)
  
  # Reactive
  Data <- reactive({
    iris[, c(input$select, input$checkGroup)]
  })
  
  # Reactive clusters
  clusters <-  reactive({
    kmeans(Data(), input$slider1)
  })
  
  # renderUI
  output$All <- renderUI({
    tagList(
      fluidRow(
        column(4,
      sliderInput('slider1', label = h4('Clusters'), 
                  min = 1, max = 9, value = 4)),
        column(4,
      checkboxGroupInput('checkGroup', label = h4('Variable X'), names(iris), selected = names(iris)[[2]])),
        column(4,
      selectInput('select', label = h4('Variable Y'), names(iris), selected = names(iris)[[2]]))
      )
    )
  })
})

# Put the variables of the iris dataset as inputs in your selectInput as “Variable Y” . HINT: Use names.

  
