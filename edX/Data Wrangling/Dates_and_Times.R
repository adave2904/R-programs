data("polls_us_election_2016")
polls_us_election_2016$startdate%>%head
class(polls_us_election_2016$startdate)       # R has a separate data type for date and time.

as.numeric(polls_us_election_2016$startdate)%>%head # Converts date into number of days since 1/1/1970.

library(lubridate)    # Package from tidyverse that helps with dates and times.

# Take a random sample of dates.
set.seed(2)
dates <- sample(polls_us_election_2016$startdate,10) %>% sort
dates

data.frame(date = days(dates),
           month = month(dates),
           day = day(dates),
           year = year(dates))

Sys.time()
now("GMT")

OlsonNames()

now() %>% hour()
now() %>% minute()
now() %>% second()

x <- c("12:34:16")
hms(x)
ms("9:12")

x <- "Nov/2/2012 12:34:56"
mdy_hms(x)

ymd_hms("20121102 12:34:56")
ymd_hm("20121102 12:34")
ymd_h("20121102 12")
dmy_hms("02112012 12:34:56")
ydm_hms("20200105 17:34:55")