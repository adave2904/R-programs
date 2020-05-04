#############################################################################################################
####################                        Case Study: Trump Tweets                     ####################
#############################################################################################################
install.packages("tidytext")
library(tidytext)
install.packages("textdata")
library(textdata)

data("trump_tweets")

head(trump_tweets)
colnames(trump_tweets)

# text -- The text of the tweet.
# source -- device used to post the tweet.
trump_tweets %>% count(source) %>% arrange(desc(n))

# Filter out retweets by removing "Twitter for".
trump_tweets %>%
  extract(source,"source","Twitter for (.*)") %>%
  count(source)

# Tweets during the election campaign.
campaign_tweets <- trump_tweets %>%
  extract(source,"source","Twitter for (.*)") %>%
  filter(source %in% c("Android","iPhone") &
           created_at >= ymd("2015-06-07") &
           created_at < ymd("2016-11-08")) %>%
  filter(!is_retweet) %>%
  arrange(created_at)

nrow(campaign_tweets)
head(campaign_tweets)

# For each tweet, extract the hour in EST.
# Then, compute the proportion of tweets each hour on each device.
# Then, create a data visualization.
campaign_tweets %>%
  mutate(hour = hour(with_tz(created_at,"EST"))) %>%
  count(source,hour) %>%
  group_by(source) %>%
  mutate(percent =n / sum(n)) %>%
  ungroup %>%
  ggplot(aes(hour,percent,color = source)) +
  geom_line() +
  geom_point() +
  scale_y_continuous(labels = percent_format()) +
  labs(x= "Hour of day(EST)",y = "% of Tweets",color = "")

# Observation: A big peak for Android in the early hours between 6 and 8 AM.
# Observation: Two different entities are using these two devices.

###########                         Study of differences in the tweets.                           ###########

# Split the text of tweet 3008 word by word.
campaign_tweets$text[3008]
campaign_tweets[3008,] %>%
  unnest_tokens(word,text) %>%
  select(word)

# Removes characters such as # and @.
# Define a regex pattern.
pattern <- "([^A-Za-z\\d#@']|'(?![^A-Za-z\\d#@']))"
campaign_tweets[3008,] %>%
  unnest_tokens(word,text,token = "regex",pattern = pattern) %>%
  select(word)

# Remove the link to pictures.
campaign_tweets[3008,] %>%
  mutate(text = str_replace_all(text,"https://t.co/[A-Za-z\\d]+|&amp;","")) %>%
  unnest_tokens(word,text,token = "regex",pattern = pattern) %>%
  select(word)

# Extract the words for all tweets.
tweet_words <- campaign_tweets %>%
  mutate(text = str_replace_all(text,"https://t.co/[A-Za-z\\d]+|&amp;","")) %>%
  unnest_tokens(word,text,token = "regex",pattern = pattern)

head(tweet_words)

# What are the most commonly used words?
tweet_words %>%
  count(word) %>%
  arrange(desc(n))

# stop_words (part of tidytext) is a collection of the most commonly used words
stop_words

# Filter the stop words.
tweet_words <- campaign_tweets %>%
  mutate(text = str_replace_all(text,"https://t.co/[A-Za-z\\d]+|&amp;","")) %>%
  unnest_tokens(word,text,token = "regex",pattern = pattern) %>%
  filter(!word %in% stop_words$word)

# Top 10 tweeted words.
tweet_words %>%
  count(word) %>%
  top_n(10,n) %>%
  mutate(word = reorder(word,n)) %>%
  arrange(desc(n))
  

# Observation: Some tokens are just numbers. Remove them using the regex ^/d+$
# Observation: Some tokens are quotes and start with '. Remove the '.
tweet_words <- campaign_tweets %>%
  mutate(text = str_replace_all(text,"https://t.co/[A-Za-z\\d]+|&amp;","")) %>%
  unnest_tokens(word,text,token = "regex",pattern = pattern) %>%
  filter(!word %in% stop_words$word &
           !str_detect(word,"^/d+$")) %>%
  mutate(word = str_replace(word,"^'",""))

# For each device and a given word y, compute the ratio between the proportion of words that are y and not y.
android_iphone_ratio <- tweet_words %>%
  count(word,source) %>%
  spread(source,n,fill = 0) %>%
  mutate(ratio = (Android + 0.5) / (sum(Android) - Android + 0.5) / ((iPhone + 0.5) / (sum(iPhone) - iPhone + 0.5)))

android_iphone_ratio %>% arrange(desc(ratio))
android_iphone_ratio %>% arrange(ratio)

# Filter based on total frequency.
android_iphone_ratio %>% filter(Android+iPhone > 100) %>%
  arrange(desc(ratio))

android_iphone_ratio %>% filter(Android+iPhone > 100) %>%
  arrange(ratio)

###########                                   Sentiment Analysis                                  ###########
# The assertion is that Android tweets are more hyperbolic.
# Words can be associated to sentiments -- anger, fear, joy and surprise.

# Assign sentiment to each word.
# The tidytext package includes several maps or lexicons in the object sentiments
# The nrc lexicon provides different sentiments.
nrc <- get_sentiments("nrc") %>% select(word,sentiment)
nrc

# Join the tweet_words and nrc using word.
tweet_words %>% inner_join(nrc,by = "word") %>%
  select(source,word,sentiment) %>% sample_n(10)

# Count and compare the frequencies of each sentiment appearing on each device.
sentiment_count <- tweet_words %>%
  left_join(nrc,by = "word") %>%
  count(source,sentiment) %>%
  spread(source,n) %>%
  mutate(sentiment = replace_na(sentiment,replace = "none"))

sentiment_count