# There are files available in the directory extdata of the package dslabs. Set path to this location.
path <- system.file("extdata",package = "dslabs")

# List all the files available at the above path.
list.files(path)

# Get the full path of the file murders.csv including the filename.
filename <- "murders.csv"
fullpath <- file.path(path,filename)

# Copy the above file to the current working directory.
file.copy(fullpath,getwd())

# Check if the file exists in the working directory.
file.exists(filename)