library(shiny)

ui <- shinyUI(fluidPage(
  titlePanel('Shiny app'),
  sidebarLayout(
    sidebarPanel(
      h2('Menu')
    ),
    mainPanel(
      h1('Main'),
      p('This famous (Fisher’s or Anderson’s)', a('iris data', href = 'http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html'), 'set gives the measurements in 
        centimeters of the variables sepal length and width and petal length and width, 
        respectively, for 50 flowers from each of 3 species of iris. The species are 
        Iris setosa, versicolor, and virginica.')
      
    )
  )
))



