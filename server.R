
library(shiny)
library(ggplot2)
source("dataF.R") 


shinyServer(function(input, output){
  
  df_country <- reactive({
    dataR %>% filter(native_country == input$country)
  })
  
  
    output$p1<- renderPlot({
      if(input$graph_type == "histogram"){
        ggplot(data=df_country(),aes_string(x=input$countinuous_var)) +
         geom_histogram(binwidth=5,fill= "#9AC0CD",color=I("#EEE9E9")) +
         labs(title =str_c("Trend of ",input$countinuous_var),y="Number of People") +
         facet_wrap(~prediction)+
         theme(plot.background = element_rect(fill="#EEE9E9",color="#EEE9E9"))
        
      }else{
        ggplot(data=df_country(),aes_string(y=input$countinuous_var)) +
          geom_boxplot(fill="#8B8378") + 
          coord_flip() + 
          labs(title =str_c("Trend of ",input$countinuous_var),y="Number of People") +
          facet_wrap(~prediction)+
          theme(plot.background = element_rect(fill="#EEE9E9",color="#EEE9E9"))
          }})
    
  
    output$p2<- renderPlot({
      if(input$isStacked){
        ggplot(data=df_country(),aes_string(x=input$categorical_var,fill="prediction")) +
          geom_bar(position = "stack") +
          labs(title =str_c("Trend of ",input$categorical_var),y="Number of People") +
          theme(axis.text.x = element_text(angle = 45),
                legend.position="bottom",
                plot.background = element_rect(fill="#EEE9E9",color="#EEE9E9"))+
          scale_fill_manual(values = c("salmon3","#B4CDCD")) 
        
       }else{
        ggplot(data=df_country(),aes_string(x=input$categorical_var,fill=input$categorical_var)) +
          geom_bar() +
          labs(title =str_c("Trend of ",input$categorical_var),y="Number of People") +
          facet_wrap(~prediction) + 
          theme(axis.text.x = element_text(angle = 45),
                legend.position="bottom",
                plot.background = element_rect(fill="#EEE9E9",color="#EEE9E9"))+
          scale_fill_manual(values = c("#EEF5FD", "#D1E5F0", "#95C5E1", "#6495ED", "#4682B4",
                                        ,"#E5F5E0", "#C7E9C0", "#A1D99B", "#74C476", "#41AB5D",
                                        ,"#F5F5DC", "#E4D0C8", "#D2B48C",)) 
    }
      })
  })
