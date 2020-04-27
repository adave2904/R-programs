# Binding functions can also be used to combine data sets.
# Binding functions do not try to match by a variable. They just combine the data sets into a tibble.
# If the datasets do not match by the appropriate dimension, it results into an error.

# Create a data frame where column a contains numbers 1-3 and column b contains numbers 4-6
bind_cols(a = 1:3,b = 4:6)

# Divide the table tab into three parts.
tab1 <- tab[,1:3]
tab2 <- tab[,4:6]
tab3 <- tab[,7:9]
# Bind all the columns together into a single table.
new_tab <- bind_cols(tab1,tab2,tab3)

# Bind data from tab1 and tab2 into a single table.
tab1 <- tab[1:2,]
tab2 <- tab[3:4,]
bind_rows(tab1,tab2)
