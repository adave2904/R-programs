#1. Import data file into a data frame.
movie_data <- read.csv(file.choose())
head(movie_data)
#Change column names for easy accessibility
colnames(movie_data) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillion","Year")

#To categorize data by Year, the colum Year needs to be a Factor of the data matrix.
str(movie_data)
movie_data$Year <- factor(movie_data$Year)
str(movie_data)

############## Introduction to ggplot #####################
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating))

######## Add geometry to the plot #########
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating)) + geom_point()

######### Add colour
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating, colour = Genre)) + geom_point()

######## Add size
ggplot(data = movie_data, aes(x = CriticRating, y = AudienceRating, colour = Genre, size = BudgetMillion)) + geom_point()


####### Histogram

s <- ggplot(data = movie_data,aes(x = BudgetMillion))
s + geom_histogram(binwidth = 10)

#### Add color to histogram
s + geom_histogram(binwidth = 10,aes(fill=Genre))

#### Add border to histogram
s + geom_histogram(binwidth = 10,aes(fill=Genre),color="Black")

####### Density Chart

s <- ggplot(data = movie_data,aes(x = BudgetMillion))
s + geom_density()

#### Add color to histogram
s + geom_density(aes(fill=Genre))

#### Add border to histogram
s + geom_density(aes(fill=Genre),position = "stack")



######## Starting Layer

t <- ggplot(data=movie_data,aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,fill = "White",color = "Blue")

##### ALternate way
t <- ggplot(data=movie_data)
t + geom_histogram(binwidth = 10,aes(x=AudienceRating),fill = "White",color = "Blue")
t + geom_histogram(binwidth = 10,aes(x=CriticRating),fill = "White",color = "Blue")


