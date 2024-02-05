
library(shiny)
source("dataF.R") 

 
country_choi<-c(" United-States", " Canada", " Mexico", " Germany", " Philippines")
counti_var<-c("age","hours_per_week")
graph_choi<-c("histogram","boxplot")
categ_var<-c("education","workclass","sex")


shinyUI(fluidPage(style = "colorbackground-color: #f5d8d7;",
  titlePanel("Trends in Demographics and Income"),
 
  
  fluidRow(
      column(width = 12,
       wellPanel(style = "background-color:#f5d8d7;",
         selectInput("country","Country",choices = country_choi,selected ="United-States")))),
  
  
  fluidRow(
    column(width = 3,
           wellPanel(style = "background-color:#f5d8d7;",
                  p("Select a continuous variable and graph type (histogram or boxplot) to view on the right."),
                  radioButtons("countinuous_var","countinuous",choices = counti_var),
                  radioButtons("graph_type","Graph",choices = graph_choi,selected = "histogram"))),
   column(width = 9,plotOutput("p1"))),
  
  
  fluidRow(
    column(width = 3,
           wellPanel(style = "background-color: #f5d8d7;",
             p("Select a categorical variable to view bar chart on the right.Use the check box to view a stacked bar chart to combine the income levels into one graph."),
                 radioButtons("categorical_var","categorical",choices = categ_var),
                 checkboxInput("isStacked","Stack bars",TRUE))),
    column(width = 9,plotOutput("p2")) )
))
