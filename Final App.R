
library("shiny")
library("ggplot2")
library("lubridate")
library("tidyr")
library("dplyr")

ui <- fluidPage(
  h4("Tesla Average Stock Price & Elon Musk's Tweet Volume"),
  selectInput("Year",
              label = "Year",
              choices = c("Stock Price History", "Tweet Volume History"),
              selected = "Tweet History"),
  plotOutput("plot", click = "plot_click"),
  verbatimTextOutput("info"),
  plotOutput("plot2", click = "plot_click2"),
  verbatimTextOutput("info2")
)

server <- function(input,output)output$plot <- renderPlot({plot(Tesla_S_P500) %>%
    ggplot(aes(x= Tesla_S_P500$stock_date, y=Tesla_S_P500$Close))+
    geom_point(color = "darkorchid4")+
    labs(title = "Stock Close, Date",
         subtitle = "The data frame shows the stock closing price",
         y = "closing price ($)",
         x = "Date") + theme_classic(base_size = 5)
  #tweetvolumegraph
  counts <- table(elonmusk_tweets$Year)
  output$plot2 <- renderPlot(counts <- table(elonmusk_tweets$Year),
                             barplot(counts, main = "Tweets per Year"),
                             barplot(counts, main = "Tweet Volume",
                                     xlab = "Year",
                                     ylab = "Volume"))})


shinyApp(ui = ui, server = server)

https://github.com/shahchintal/CSC275Final.git
