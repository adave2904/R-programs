# dplyr package also gives Set operator functions for tables as well as vectors.

# Take two numeric vectors.
n1 <- c(1:10)
n2 <- c(6:15)

# Intersect gives the data available in both vectors.
intersect(n1,n2)      # 6  7  8  9 10

# Join the tables murders and results_us_election_2016 using left_join.
tab <- left_join(murders,results_us_election_2016,by = "state")
head(tab)

# Now create two subtables.
# 1. Rows 1-5.
tab1 <- tab[1:5,]
# 2. Rows 3-7.
tab2 <- tab[3:7,]

# For tables, Intersect gives the rows available in both tables having the same column names.
dplyr::intersect(tab1,tab2)    # Rows 3-5 are returned.

# Union, when applied to vectors, gives distinct elements from each vector.
union(n1,n2)

# Union can be applies to two tables having the same column names.
dplyr::union(tab1,tab2)       # Rows 1-7 are returned.

# The difference between two vectors or tables can be determined by using setdiff()
setdiff(1:10,6:15)  # Returns elements in first vector not available in the second.
setdiff(6:15,1:10)  # Asymmetric function. The result is not the same as of above command.

dplyr::setdiff(tab1,tab2) # Rows for Alabama and Alaska are returned.
dplyr::setdiff(tab2,tab1) # Rows for Colorado and Connecticut are returned.

# The function setequal tells us if two sets are equal regardless of the order of the elements.
setequal(1:5,1:6)       # False
setequal(1:5,5:1)       # True

dplyr::setequal(tab1,tab2)

