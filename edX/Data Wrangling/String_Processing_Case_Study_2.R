# Reported Heights dataset in dslabs package.
library(dslabs)
data("reported_heights")

# Check the class of height column.
class(reported_heights$height)      # Character.

# Convert it to a number.
x <- as.numeric(reported_heights$height)
# Check how many NA values are there in the height column.
sum(is.na(x))

# Keep only entries that have height = NA.
reported_heights %>% mutate(new_height = as.numeric(height)) %>%
  filter(is.na(new_height))

# Keep only entries that either result in NAs or are outside the plausible range of heights
not_inches <- function(x,smallest = 50, tallest = 84){
  inches <- suppressWarnings(as.numeric(x))
  ind <- is.na(inches) | inches < smallest | inches > tallest
  ind
}

# Number of problematic entries in reported_heights.
problems <- reported_heights %>%
  filter(not_inches(height)) %>%
  .$height

# Patterns of problematic entries.
# 1. x' y or x' y" or x' y\"
pattern1 <- "^\\d\\s*'\\s*\\d{1,2}\\.*\\d*'*\"*$"
str_subset(problems,pattern1) %>% head(n=10) %>% cat

# 2. x.y or x,y
pattern2 <- "^[4-6]\\s*[\\.|,]\\s*([0-9]|10|11)$"
str_subset(problems, pattern2) %>% head(n=10) %>% cat

# 3. Entries in cm.
ind <- which(between(suppressWarnings(as.numeric(problems) / 2.54),54,81))
ind <- ind[!is.na(ind)]
problems[ind] %>% head(n=10) %>% cat

# Show all entries where "cm" was used.
str_subset(reported_heights$height,"cm")

# Number of entries matching the desired pattern.
pattern <- "^[4-7]'\\d{1,2}\"$"
sum(str_detect(problems,pattern))

# Problems
# 1. The word inches instead of ".
str_subset(problems,"inches")
# 2. Two '' instead of one ".
str_subset(problems,"''")

# Replace the problems -- feet with ' and inches with nothing.
# eg. 5'6 -- 5 feet 6 inches.
pattern <- "^[4-7]'\\d{1,2}$"

problems %>%
  str_replace("feet|ft|foot","'") %>%
  str_replace("inches|in|''|\"","") %>%
  str_detect(pattern) %>%
  sum

# 48 matches.

# 3. Spaces.
pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"  # \\s - spaces.
problems %>%
  str_replace("feet|ft|foot","'") %>%
  str_replace("inches|in|''|\"","") %>%
  str_detect(pattern) %>%
  sum

# 4. x,y or x.y or x y.
pattern_with_groups <- "^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$"

# ^(4-7) -- start of the string has to be one digit between 4 and 7.
# \\s* -- none or more white spaces.
# [,\\.\\s+] -- instead of feet symbol ('), there is a comma or dot or white spaces.
# \\s* -- none or more white spaces.
# (\\d*)$ -- one or more digits at the end of the string.
problems %>%
  str_replace("feet|ft|foot","'") %>%
  str_replace("inches|in|''|\"","") %>%
  str_detect(pattern_with_groups) %>%
  sum


###########################################################################################################
#######                                   Improving the data                                        #######
###########################################################################################################

# Detect the problematic entries.
not_inches_or_cm <- function(x,smallest = 50,tallest = 84) {
  inches <- suppressWarnings(as.numeric(x))
  ind <- !is.na(inches) & ((inches >= smallest & inches <= tallest) | 
                             (inches / 2.54 >= smallest & inches / 2.54 <= tallest))
  !ind
}

# Identify the problematic entries.
problems <- reported_heights %>%
  filter(not_inches_or_cm(height)) %>%
  .$height

length(problems) # 200.

# Replace the previously identified patterns.
converted <- problems %>%
  str_replace("feet|ft|foot","'") %>%
  str_replace("inches|in|''|\"","") %>%
  str_replace(pattern_with_groups,"\\1'\\2")

# How many instances now match the pattern we desire?
pattern <- "^[4-7]\\s*'\\s*\\d{1,2}$"
index <- str_detect(converted,pattern)
mean(index)

# Remaining cases.
converted[!index]

converted
# 1. No inches entered.
# Solution: Add 0 after the feet symbol.
# 2. For 5 or 6 feet, Only the feet number entered. Not the symbol.
# Solution: Add a ' after the feet number and 0 after the '.
# 3. Spaces at the end.
# Solution: In the new pattern, do not give white spaces.

converted <- str_replace(converted,"^([4-7])$","\\1'0")
converted

# 4. Inches with decimal points.
# Solution: Use quantifiers in the desired pattern.
# Permit the use of zero or one decimal point in inches (using ?).
# Then one or more digits (using *).

pattern <- "^[4-7]\\s*'\\s*(\\d+\\.?\\d*)$"

# 5. Entries in meters and European decimals. eg 1,7 -- 1 meter 70 cm or 170 cm.
# Solution: The first digit has to be 1 or 2. Then, replace x,y with x'y.

converted <- str_replace(converted,"^([12])\\s*,\\s*(\\d*)$","\\1\\.\\2")
converted

# 6. "cm"
# 7. "Five ' eight "
# Solution: No changes as of now.

###########################################################################################################
#######                                   Final Data Wrangling                                      #######
###########################################################################################################
pattern <- "^([4-7])\\s*'\\s*(\\d+\\.?\\d*)$"

smallest <- 50
tallest <- 84

# Create a function to cover all the cases above.
convert_format <- function(s){
  s %>%
    str_replace("feet|foot|ft", "'") %>%                              # Change feet or foor or ft into '.
    str_replace_all("inches|in|''|\"|cm|and", "") %>%                 # Change inches or in or '' or cm or and into nothing.
    str_replace("^([4-7])\\s*[,\\.\\s+]\\s*(\\d*)$", "\\1'\\2") %>%   # Replace white spaces after ' and inches value with nothing.
    str_replace("^([56])'?$", "\\1'0") %>%                            # Change 5/6 feet followed by ' (w/o inches) into 5/6'0".
    str_replace("^([12])\\s*,\\s*(\\d*)$", "\\1\\.\\2") %>%           # The first digit has to be 1 or 2. Then, replace x,y with x'y.
    str_trim() 
}

# Write a function to convert words into numbers.
words_to_numbers <- function(s){
  str_to_lower(s) %>%
    str_replace_all("zero","0") %>%
    str_replace_all("one","1") %>%
    str_replace_all("two","2") %>%
    str_replace_all("three","3") %>%
    str_replace_all("four","4") %>%
    str_replace_all("five","5") %>%
    str_replace_all("six","6") %>%
    str_replace_all("seven","7") %>%
    str_replace_all("eight","8") %>%
    str_replace_all("nine","9") %>%
    str_replace_all("ten","10") %>%
    str_replace_all("eleven","11")
}

# Final data wrangling.
new_heights <- reported_heights %>%
  dplyr::mutate(original = height,
         height = words_to_numbers(height) %>% convert_format()) %>%    # Convert words to numbers and handle the identified cases.
  extract(height,c("feet","inches"),regex = pattern,remove = FALSE) %>% # Convert height into feet and inches as columns.
  dplyr::mutate_at(c("height","feet","inches"),suppressWarnings(as.numeric)) %>%
  dplyr::mutate(guess = 12 * feet + inches) %>%
  dplyr::mutate(height = case_when(
    is.na(height) ~ as.numeric(NA),
    between(height,smallest,tallest) ~ height,         # inches
    between(height / 2.54,smallest,tallest) ~ height / 2.54,     # cm
    between((height * 100) / 2.54,smallest,tallest) ~ (height * 100) / 2.54,      # meters
    TRUE ~ as.numeric(NA))
  ) %>%
  dplyr::mutate(height = ifelse(is.na(height) &
                           inches < 12 & between(guess,smallest,tallest),
                         guess,height)
  ) %>%
  dplyr::select(-guess)

# Check all the converted entries.
new_heights %>%
  filter(not_inches(original)) %>%
  dplyr::select(original,height) %>%
  arrange(height) %>%
  View()

# Shortest students.
new_heights %>% arrange(height) %>% head(n = 7)
  
  