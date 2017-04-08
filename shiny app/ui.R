library(shiny)

ui <- shinyUI(fluidPage(
  titlePanel('Shiny app'),
  sidebarLayout(
    sidebarPanel(
      h2('Menu'),
      br(),
      h4('ActionButton'),
      actionButton('Per', label = 'Perform'),
      br(),
      h4('Submitbutton'),
      submitButton('Submit'),
      h4('Single Checkbox'),
      checkboxInput('checkbox', label='Choice A', value = F),
      checkboxGroupInput('checkGroup', label = h4('Checkbox Group'), 
                         choices = list('valg 1' = 1, 'valg 2' = 2, 'valg 3' = 3), selected = 2),
      dateInput('date', label = h4('Date input'), value = '2016-12-01'),
      dateRangeInput('dates', label = h4('Date Ranges'), start = '2000-01-01', format = 'd/M/yy'),
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
      h2('Analysis')
    )
  )
))


