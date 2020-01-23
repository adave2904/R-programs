############# Themes #########################
o <- ggplot(data = movie_data,aes(x = BudgetMillion))
h <- o + geom_histogram(binwidth = 10,aes(fill=Genre),color = "Black")

### Add Axes labels:
h + xlab("Money") +
  ylab("No. of Movies")

### Label formatting
h + xlab("Money") +
  ylab("No. of Movies") +
  theme(axis.title.x = element_text(colour = "Dark Green",size = 30),axis.title.y = element_text(colour = "Red",size = 30))

### Tick Mark formatting
h + xlab("Money") +
  ylab("No. of Movies") +
  ?theme(axis.title.x = element_text(colour = "Dark Green",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20))


### Legend formatting
h + xlab("Money") +
  ylab("No. of Movies") +
  theme(axis.title.x = element_text(colour = "Dark Green",size = 30),
         axis.title.y = element_text(colour = "Red",size = 30),
         axis.text.x = element_text(size = 20),
         axis.text.y = element_text(size = 20),
         
         legend.title = element_text(size = 30),
         legend.text = element_text(size = 20),
         legend.position = c(1,1),
         legend.justification = c(1,1)
         )

### Title of the Plot
h + xlab("Money") +
  ylab("No. of Movies") +
  ggtitle("Movie Budget Distribution by Genre") + 
  theme(axis.title.x = element_text(colour = "Dark Green",size = 30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size = 20),
        axis.text.y = element_text(size = 20),
        
        legend.title = element_text(size = 30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color = "Dark Blue",size = 40,family = "Cambria")
  )

