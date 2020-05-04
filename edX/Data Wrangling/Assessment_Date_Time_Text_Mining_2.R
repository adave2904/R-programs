install.packages("gutenbergr")
library(gutenbergr)
library(tidyverse)
options(digits = 3)

gutenberg_metadata %>% head

# Question 6
# Use str_detect() to find the ID of the novel Pride and Prejudice.
gutenberg_metadata %>% filter(str_detect(title,"Pride and Prejudice")) %>%
  summarize(n = n_distinct(gutenberg_id))

# How many different ID numbers are returned?
6

# Question 7
# Notice that there are several versions of the book.
# The gutenberg_works() function filters this table to remove replicates and include only English language works.
# Use this function to find the ID for Pride and Prejudice.
gutenberg_works(title == "Pride and Prejudice")
# What is the correct ID number?
1342

# Question 8
# Use the gutenberg_download() function to download the text for Pride and Prejudice.
book <- gutenberg_download(1342)

# Use the tidytext package to create a tidy table with all the words in the text. Save this object as words.
words <- book %>%
  unnest_tokens(word,text)

# How many words are present in the book?
nrow(words)

# Question 9
# Remove stop words from the words object. Recall that stop words are defined in the stop_words data frame from the tidytext package.
words <- book %>%
  unnest_tokens(word,text) %>%
  filter(!word %in% stop_words$word)
# How many words remain?
nrow(words)

# Question 10
# After removing stop words, detect and then filter out any token that contains a digit from words.
words <- book %>%
  unnest_tokens(word,text) %>%
  filter(!word %in% stop_words$word &
           !str_detect(word,"[0-9]+"))

# How many words remain?
nrow(words)

# Question 11
# Analyze the most frequent words in the novel after removing stop words and tokens with digits.
# How many words appear more than 100 times in the book?
words %>%
  count(word) %>%
  filter(n > 100) %>%
  arrange(desc(n))

# What is the most common word in the book?
# How many times does that most common word appear?
words %>%
  count(word) %>%
  top_n(1,n)

# Question 12
# Define the afinn lexicon:
afinn <- get_sentiments("afinn") %>% select(word,value)
afinn

# Use this afinn lexicon to assign sentiment values to words.
# Keep only words that are present in both words and the afinn lexicon.
# Save this data frame as afinn_sentiments.
afinn_sentiments <- words %>% inner_join(afinn,by = "word") %>%
  select(gutenberg_id,word,value)
# How many elements of words have sentiments in the afinn lexicon?
nrow(afinn_sentiments)

# What proportion of words in afinn_sentiments have a positive value?
nrow(afinn_sentiments %>% filter(value >= 0)) / nrow(afinn_sentiments)


# How many elements of afinn_sentiments have a value of 4?
nrow(afinn_sentiments %>%filter(value == 4)) # 51