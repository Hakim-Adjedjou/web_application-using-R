#loading libraries : 

library(shiny)
library(shinythemes)

ui<-fluidPage(theme = shinytheme("united"),
              navbarPage(
                "myfirst app",
                tabPanel("Navbar 1",
                         sidebarPanel(
                           tags$h3("input"),
                           textInput("txt1","Given name : ",""),
                           textInput("txt2","Surname : ", ""),
                           
                         ),
                         
                         mainPanel(
                             tags$h1("header"),
                             tags$h4("output"),
                             verbatimTextOutput("txtout"),
                             
                         )
                         ),
                tabPanel("navbar 2 ","nothing here")
              ))

server<-function(input , output) {
  output$txtout<-renderText({
    paste(input$txt1,input$txt2,sep = " ")
  })
}

shinyApp(ui,server)