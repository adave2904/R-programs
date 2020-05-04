# Case Study 3: Extract table from a PDF.

# Scientific funding rates by gender in the Netherlands.
library(dslabs)
data("research_funding_rates")
research_funding_rates

# Data is a paper published in the journal PNAS.
# The data is not a spreadsheet. It is a PDF file.

install.packages("pdftools")
library(pdftools)

# Download the PDF document and import into R.
temp_file <- tempfile()
url <- "http://www.pnas.org/content/suppl/2015/09/16/1510159112.DCSupplemental/pnas.201510159SI.pdf"
download.file(url,temp_file)
txt <- pdf_text(temp_file)
file.remove(temp_file)

# Get the second page data as raw data for research funding rates.
rfr_raw <- txt[2]

rfr_raw %>% head

# Each line on the page is separated by the newline character \n.
tab <- str_split(rfr_raw,"\n")
tab <- tab[[1]]

# Column Information is in entries 3 and 4.
rfr_col_names_1 <- tab[3]
rfr_col_names_1

rfr_col_names_2 <- tab[4]
rfr_col_names_2

# Extract column 1 data.
# Remove leading spaces and everything following the comma.
# Obtain the data by splitting the elements using space (only when there are 2 or more).
rfr_col_names_1 <- rfr_col_names_1 %>%
  str_trim() %>%
  str_replace_all(",\\s.","") %>%
  str_split("\\s{2,}",simplify = TRUE)

rfr_col_names_1

# Extract column 2 data.
# Remove leading spaces and everything following the comma.
# Obtain the data by splitting the elements using spaces.
rfr_col_names_2 <- rfr_col_names_2 %>%
  str_trim() %>%
  str_split("\\s+",simplify = TRUE)

rfr_col_names_2

# Join the two columns.
tmp_names <- str_c(rep(rfr_col_names_1,each = 3),rfr_col_names_2[-1],sep = "_")
rfr_col_names <- c(rfr_col_names_2[1],tmp_names) %>%
  str_to_lower() %>%
  str_replace_all("//s","_")      # Convert Success rates_total to Success_rates_total.

# The data is available within lines 6 to 14.
rfr_data <- tab[6:14] %>%
  str_trim() %>%                            # Trim all leading spaces.
  str_split("\\s{2,}",simplify = TRUE) %>%   # Remove 2 or more spaces.
  data.frame(stringsAsFactors = FALSE) %>%    # Create a data frame without converting the character vectors into factors.
  setNames(rfr_col_names) %>%                 # Assign column names to each column.
  mutate_at(-1,parse_number)                  # Drops any non-numeric characters from all columns except first.