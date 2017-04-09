library(shiny)
library(shinydashboard)

ui <- dashboardPage(
# Header 
      dashboardHeader(title = 'Shiny app'),
# Sidebar      
      dashboardSidebar(
        sidebarMenu(
          menuItem('Data table', tabName = 'dt', icon = icon('table')),
          menuItem('Summary', tabName = 'sm', icon = icon('list-alt')),
          menuItem('K-means', tabName = 'km', icon = icon('area-chart'))
        )
      ),
# Body
      dashboardBody(
        tabItems(
          tabItem(tabName = 'dt', 
                  h2('Iris Data table'),
                  fluidRow(
                    box(dataTableOutput('Table'), width = 400)
                  )
                  ),
          tabItem(tabName = 'sm', 
                  h2('Summary'),
                  fluidRow(
                    box(dataTableOutput('Table2'), width = 400)
                  )
                  ),
          tabItem(tabName = 'km', 
                  h2('K-means'),
                  fluidRow(
                    box(plotOutput('plot1', click = 'mouse')),
                    box(sliderInput('slider1', label = h4('Clusters'), 
                                    min = 1, max = 9, value = 4),
                        verbatimTextOutput('coord'))
                  ),
                  fluidRow(
                    box(checkboxGroupInput('checkGroup', label = h4('Variable X'), 
                                           names(iris), selected = names(iris)[[1]])),
                    box(selectInput('select', label = h4('Variable Y'), names(iris), 
                                    selected = names(iris)[[2]]))
                  )
                  )
        )  
      )
)

server <- shinyServer(function(input, output) {
  
  # table output
  output$Table <-  renderDataTable(iris, options = list(lengthMenu=list(c(10,20,30,-1),c('10','20','30','ALL'))))
  
  # summary table
  sum <- as.data.frame.array(summary(iris))
  output$Table2 <- renderDataTable(sum)
  
  # plot output
  output$plot1 <- renderPlot({
    palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
              "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
    plot(Data(), 
         main = 'K-Means',  
         cex.main = 2, font.main = 1, col.main = 'black', 
         col = clusters()$cluster, pch = 20, cex = 3)
  }, width = "auto", height = "auto"
  )
  
  # output verbatim
  output$coord <- renderText({
    paste0("x =  ", input$mouse$x, '\ny =  ', input$mouse$y)
  })
  
  # Reactive
  Data <- reactive({
    iris[, c(input$select, input$checkGroup)]
  })
  
  # Reactive clusters
  clusters <-  reactive({
    kmeans(Data(), input$slider1)
  })
  
})

shinyApp(ui=ui, server = server)



