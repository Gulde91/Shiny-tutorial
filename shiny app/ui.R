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
      submitButton('Submit')
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


