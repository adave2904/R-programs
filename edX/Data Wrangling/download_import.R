# Import data from Internet directly.
url <- "https://raw.githubusercontent.com/rafalab/dslabs/master/inst/extdata/murders.csv"

data2 <- read_csv(url)
class(data2)

# Download the file and then import into R.
download.file(url,"murders.csv")
data3 <- read_csv("murders.csv")
class(data3)
# Download the file, store it into a temp file and then import into R.
tmp_file <- tempfile()
download.file(url,tmp_file)
data4 <- read_csv(tmp_file)
file.remove(tmp_file)
