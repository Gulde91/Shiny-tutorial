library(shiny)
library(shinydashboard)

ui <- dashboardPage(
# Header 
      dashboardHeader(title = 'Shiny app',
                      dropdownMenuOutput('messageMenu'),
                      dropdownMenu(type = 'notifications',
                                   notificationItem(
                                     text = "20 new users today",
                                     icon("users")
                                   ),
                                   notificationItem(
                                     text = "14 items delivered",
                                     icon("truck"),
                                     status = "success"
                                   ),
                                   notificationItem(
                                     text = "Server load at 84%",
                                     icon = icon("exclamation-triangle"),
                                     status = "warning"
                                   )
                                   ),
                      dropdownMenu(type = 'tasks', badgeStatus = 'success',
                                   taskItem(value = 100, color = "green",
                                            "Documentation"
                                            ),
                                   taskItem(value = 17, color = "aqua",
                                            "Project X"
                                            ),
                                   taskItem(value = 75, color = "yellow",
                                            "Server deployment"
                                            ),
                                   taskItem(value = 80, color = "red",
                                            "Overall project"
                                            )
                                   )
                      ),
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
                  h2('Data table'),
                  fluidRow(
                    box(title = 'Iris data', solidHeader = T, status = 'primary',
                        dataTableOutput('Table'), width = 400)
                  )
                  ),
          tabItem(tabName = 'sm', 
                  h2('Summary'),
                  fluidRow(
                    box(title = 'Summary af Iris data', solidHeader = T, status = 'primary',
                        dataTableOutput('Table2'), width = 400)
                  )
                  ),
          tabItem(tabName = 'km', 
                  h2('K-means'),
                  fluidRow(
                    box(title = 'Scatterplot', solidHeader = T, status = 'primary', plotOutput( 'plot1', click = 'mouse')),
                    box(status = 'warning', sliderInput('slider1', label = h4('Clusters'), 
                                    min = 1, max = 9, value = 4),
                        verbatimTextOutput('coord'))
                  ),
                  fluidRow(
                    box(status = 'warning', checkboxGroupInput('checkGroup', label = h4('Variable X'), 
                                           names(iris), selected = names(iris)[[1]])),
                    box(status = 'warning', selectInput('select', label = h4('Variable Y'), names(iris), 
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
  
  output$messageMenu <- renderMenu({
    # Code to generate each of the messageItems here, in a list. messageData
    # is a data frame with two columns, 'from' and 'message'.
    # Also add on slider value to the message content, so that messages update.
    msgs <- apply(messageData, 1, function(row) {
      messageItem(
        from = row[["from"]],
        message = paste(row[["message"]], input$slider)
      )
    })
    dropdownMenu(type = "messages", .list = msgs)
  })
  
})

messageData <- data.frame(
  from = c("Admininstrator", "New User", "Support"),
  message = c(
    "Sales are steady this month.",
    "How do I register?",
    "The new server is ready."
  ),
  stringsAsFactors = FALSE
)


shinyApp(ui=ui, server = server)



