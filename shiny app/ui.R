library(shiny)

shinyUI(fluidPage(
titlePanel('Shiny app'),
  sidebarLayout(
    sidebarPanel(
      h2('Menu'),
      br(),
      fluidRow(
        column(width = 6,
      h4('ActionButton'),
      actionButton('Per', label = 'Perform')),
        column(width = 6,
      h4('Help Text'),
      helpText('For help'))
      ),
      br(),
      fluidRow(
        column(width = 6,
      numericInput('numer', label = h4('Numeric input'), value = 10))
      ),
      fluidRow(
        column(6,
      h4('Single Checkbox'),
      checkboxInput('checkbox', label='Choice A', value = F)
      )),
      fluidRow(
        column(6,
      selectInput('select', label = h4('Select Box'), 
                  choices = list('choice 1' = 1, 'choice 2' = 2), selected = 2)),
        column(6,
      checkboxGroupInput('checkGroup', label = h4('Checkbox Group'), 
                         choices = list('valg 1' = 1, 'valg 2' = 2, 'valg 3' = 3), selected = 2))
      ),
      fluidRow(
        column(6,
      dateInput('date', label = h4('Date input'), value = '2016-12-01')
      )),
      fluidRow(
        column(6,
      textInput('text', label = h4('Text input'), value = 'Some text')),
        column(6,
      dateRangeInput('dates', label = h4('Date Ranges'), start = '2000-01-01', format = 'd/M/yy'))
      ),
      fileInput('file', label = h4('File input'))
    ),

mainPanel(
      h1('Main'),
      br(),
      br(),
      img(src='petal.jpg', height = 150, width = 200),
      p('This famous (Fisher’s or Anderson’s)', a('iris data', href = 'http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html'), 'set gives the measurements in 
        centimeters of the variables sepal length and width and petal length and width, 
        respectively, for 50 flowers from each of 3 species of iris. The species are', 
        strong('Iris setosa,'), strong('versicolor'), 'and', strong('virginica'),'.'),
      br(),
      h2('Analysis'),
      tabsetPanel(type = "tabs", tabPanel("Data table", dataTableOutput('Table')), 
                  tabPanel('Summary', dataTableOutput('Table2')), 
                  tabPanel('K means',
                            #radioButtons('radio', label = h4('Select Image'), 
                            #     choices = list('Image 1' = 1, 'Image 2' = 2), selected = 1),
                            #imageOutput('Image'),
                            plotOutput('plot1', click = 'mouse'),
                            verbatimTextOutput('coord'),
                  #          sliderInput('slider1', label = h4('Clusters'), 
                  #                      min = 2, max = 20, value = 2),
                  #          textOutput('text1'),
                  #          submitButton('Submit'))
                             uiOutput('All')
                 )
    )
  )
)))

