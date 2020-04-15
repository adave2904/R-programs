# Question 2: Restaurant management
# A restaurant manager wants to advertise that his lunch special offers enough choices to eat different meals every day of the year.
# He doesn't think his current special actually allows that number of choices, but wants to change his special if needed to allow at least 365 choices.
# A meal at the restaurant includes 1 entree, 2 sides, and 1 drink.
# He currently offers a choice of 1 entree from a list of 6 options,
# a choice of 2 different sides from a list of 6 options, and a choice of 1 drink from a list of 2 options.

# Question 2a
# How many meal combinations are possible with the current menu?
entree <- combinations(6,1)
sides <- combinations(6,2)
drink <- combinations(2,1)

meals <- nrow(entree) * nrow(sides) * nrow(drink)
meals # 180


# Question 2b
# The manager has one additional drink he could add to the special.
# How many combinations are possible if he expands his original special to 3 drink options?
drink <- combinations(3,1)

meals <- nrow(entree) * nrow(sides) * nrow(drink)
meals # 270

# Question 2c
# The manager decides to add the third drink but needs to expand the number of options.
# The manager would prefer not to change his menu further and wants to know if he can meet his goal by letting customers choose more sides.
# How many meal combinations are there if customers can choose from 6 entrees, 3 drinks,
# and select 3 sides from the current 6 options?
sides <- combinations(6,3)

meals <- nrow(entree) * nrow(sides) * nrow(drink)
meals # 360

# Question 2d
# The manager is concerned that customers may not want 3 sides with their meal.
# He is willing to increase the number of entree choices instead,
# but if he adds too many expensive options it could eat into profits.
# He wants to know how many entree choices he would have to offer in order to meet his goal.
# Write a function that takes a number of entree choices and returns the number of meal combinations possible given that number of entree options, 3 drink choices, and a selection of 2 sides from 6 options.
# Use sapply() to apply the function to entree option counts ranging from 1 to 12.
# What is the minimum number of entree options required in order to generate more than 365 combinations?
f <- function(entree1){
  print(3 * 15 * entree1)
}

options <- 1:12

sapply(options,f)

# Question 2e
# The manager isn't sure he can afford to put that many entree choices on the lunch menu
# and thinks it would be cheaper for him to expand the number of sides.
# He wants to know how many sides he would have to offer to meet his goal of at least 365 combinations.
# Write a function that takes a number of side choices and returns the number of meal combinations possible given 6 entree choices, 3 drink choices, and a selection of 2 sides from the specified number of side choices.
# Use sapply() to apply the function to side counts ranging from 2 to 12.
# What is the minimum number of side options required in order to generate more than 365 combinations?

f <- function(sides1){
  print(6 * nrow(combinations(sides1,2)) * 3)
}

options <- 2:12

sapply(options,f)
