#Importing libraries that will be used

library(ggplot2)
library(data.table)
library(ggthemes)

#Creating a scatter plot using ggplot2

pl <- ggplot(df, aes(x = CPI, y = HDI, color = Region))

pl <- pl + geom_point(shape = 1, size = 4)

#Added the line

pl <- pl + geom_smooth(aes(group = 1), method = 'lm', 
                       formula = y~log(x), se = F, color = 'red')
                       
#Labeling only a subset of countries

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan", "Afghanistan", "Congo", 
"Greece", "Argentina", "Brazil", "India", "Italy", "China", "South Africa", "Spain", "Botswana", 
"Cape Verde", "Bhutan", "Rwanda", "France", "United States", "Germany", "Britain", "Barbados", 
"Norway", "Japan", "New Zealand", "Singapore")

pl <- pl + geom_text(aes(label = Country), color = "gray20", 
                     data = subset(df, Country %in% pointsToLabel), check_overlap = T)
                     
#Adding theme for the plot
pl <- pl + theme_bw()

#Scaling and naming x axis

pl <- pl + scale_x_continuous(name = "Corruption Perceptions Index, 2011",
                              limits = c(0.9, 10.5), breaks = 1:10)
                              
#Scaling and naming y axis
pl <- pl + scale_y_continuous(name = "Human Development Index, 2011", 
                              limits = c(0.2,1))               
                              
#Adding the title
pl <- pl + ggtitle("Corruption and Human development")

#Last touch
pl <- pl + theme_economist_white()

print(pl)

