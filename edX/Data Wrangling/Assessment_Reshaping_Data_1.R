# Question 1
# A collaborator sends you a file containing data for three years of average race finish times.
# age_group,2015,2016,2017
# 20,3:46,3:22,3:50
# 30,3:50,3:43,4:43
# 40,4:39,3:49,4:51
# 50,4:48,4:59,5:01
# Are these data considered “tidy” in R? Why or why not?
No. These data are not considered “tidy” because the variable “year” is stored in the header.

# Question 2
# Below are four versions of the same dataset. Which one is in a tidy format?
state      abb region  population total
Alabama     AL	South  4779736	  135
Alaska      AK   West  710231	    19
Arizona     AZ   West	 6392017    232
Arkansas    AR  South	 2915918	  93
California  CA   West  37253956   1257
Colorado    CO   West	 5029196	  65

# Question 3
# Your file called “times.csv” has age groups and average race finish times for three years of marathons.
# age_group,2015,2016,2017
# 20,3:46,3:22,3:50
# 30,3:50,3:43,4:43
# 40,4:39,3:49,4:51
# 50,4:48,4:59,5:01
# You read in the data file using the following command.
d <- read_csv("times.csv")
# Which commands will help you “tidy” the data?
tidy_data <- d %>% gather(year, time, `2015`:`2017`)

# Question 4
# You have a dataset on U.S. contagious diseases, but it is in the following wide format:
# state year population HepatitisA Mumps Polio Rubella
# Alabama 1990    4040587      86	   19    76    1
# Alabama 1991    4066003      39	   14    65    0
# Alabama 1992    4097169      35	   12    24    0
# Alabama 1993    4133242      40	   22    67    0
# Alabama 1994    4173361      72	   12    39    0
# Alabama 1995    4216645      75     2    38    0
# You want to transform this into a tidy dataset, with each row representing an observation of the incidence of each specific disease (as shown below):
# state   year  population  disease  count
# Alabama 1990	4040587 HepatitisA	86
# Alabama 1991	4066003 HepatitisA	39
# Alabama 1992	4097169 HepatitisA	35
# Alabama 1993	4133242 HepatitisA	40
# Alabama 1994	4173361 HepatitisA	72
# Alabama 1995	4216645 HepatitisA	75
# Which of the following commands would achieve this transformation to tidy the data?
dat_wide <- read_csv("US_diseases.csv")
dat_tidy <- dat_wide %>% gather(key = disease, value = count, HepatitisA:Rubella)

# Question 5
# You have successfully formatted marathon finish times into a tidy object called tidy_data. The first few lines are shown below.
# age_group year   time
# 20        2015   03:46
# 30        2015   03:50
# 40        2015   04:39
# 50        2015   04:48
# 20        2016   03:22
tidy_data %>% spread(year,time)

# Question 6
# You have the following dataset:

# state   abb region    	var   people
# Alabama  AL  South population 4779736
# Alabama  AL  South  	total 	  135
# Alaska   AK   West population  710231
# Alaska   AK   West  	total  	   19
# Arizona  AZ   West population 6392017
# Arizona  AZ   West  	total 	  232

# You would like to transform it into a dataset where population and total are each their own column (shown below):

# state      abb region population total
# Alabama     AL  South	4779736   135
# Alaska      AK   West 	 710231    19
# Arizona     AZ   West	6392017   232
# Arkansas    AR  South	2915918    93
# California  CA   West  37253956  1257
# Colorado    CO   West	5029196	   65

# Which code would best accomplish this?
wide_data <- read_csv("US_pop_total.csv")
wide_data %>% spread(key = var, value = people)

# Question 7
# A collaborator sends you a file containing data for two years of average race finish times, "times1.csv":
  
# age_group,2015_time,2015_participants,2016_time,2016_participants
# 20,3:46,54,3:22,62
# 30,3:50,60,3:43,58
# 40,4:39,29,3:49,33
# 50,4:48,10,4:59,14

#You read in the data file:
d <- read_csv("times1.csv")
# Which of the answers below best makes the data tidy?
td <- d %>% gather(key = "key", value = "value", -age_group) %>%
  separate(col = key, into = c("year", "variable_name"), sep = "_") %>% 
  spread(key = variable_name, value = value)


# Question 8
# You are in the process of tidying some data on heights, hand length, and wingspan for basketball players in the draft. Currently, you have the following:
# key               value
# allen_height      75
# allen_hand_length 8.25
# allen_wingspan	  79.25
# bamba_height      83.25
# bamba_hand_length 9.75
# bamba_wingspan    94
# Select all of the correct commands below that would turn this data into a “tidy” format with columns "height", "hand_length" and "wingspan".
bbdata <- read_csv("bbplayers.csv")
bbdata %>% separate(key,c("player","variable_name"),sep = "_",extra = "merge") %>% spread(key = variable_name,value = value)