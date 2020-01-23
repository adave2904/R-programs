######## Statistical Transformations ################
####### Function: geom_smooth() #####################

u <- ggplot(data=movie_data,aes(x=CriticRating,y=AudienceRating,colour=Genre))

u + geom_point() + geom_smooth(fill=NA)


########## Using Facets #########################
v <- ggplot(data = movie_data,aes(x = BudgetMillion))
v + geom_histogram(binwidth = 10,aes(fill=Genre),color = "Black")

# To get histogram for each Genre use Facets.
v + geom_histogram(binwidth = 10,aes(fill=Genre),color = "Black") + facet_grid(Genre~.,scales = "free")


### Scatterplots and Facets:
w <- ggplot(data = movie_data,aes(x = CriticRating, y = AudienceRating, color = Genre))

w + geom_point(size = 3) + facet_grid(Genre~.) ### Plot the chart by Genre
w + geom_point(size = 3) + facet_grid(.~Year)  ### Plot the chart by Year
w + geom_point(size = 3) + geom_smooth(fill=NA) + facet_grid(Genre~Year) ### Plot the chart by Genre and Year

############# Using coordinates ######################
m <- ggplot(data = movie_data,aes(x = CriticRating, y = AudienceRating, size = BudgetMillion, color = Genre))
m + geom_point()

### Chart data with CriticRating between 50 and 100
m + geom_point() + xlim(50,100)
### Chart data with CriticRating between 50 and 100 and AudienceRating between 50 and 100
m + geom_point() + xlim(50,100) + ylim(50,100)

#### Using this can result in data loss.

### Use zoom.
n <- ggplot(data = movie_data,aes(x = BudgetMillion))
n + geom_histogram(binwidth = 10,aes(fill=Genre),colour = "Black")

n + geom_histogram(binwidth = 10,aes(fill=Genre),colour = "Black") +
  coord_cartesian(ylim = c(0,50))

### Zoom example:
w + geom_point(size = 3) + 
  geom_smooth() + 
  facet_grid(Genre~Year) +                        ### Plot the chart by Genre and Year
  coord_cartesian(ylim = c(0,100))

