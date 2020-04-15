##########  Questions 3 and 4: Esophageal cancer and alcohol/tobacco use, part 1  ##########

#3A. How many groups are in the study?
nrow(esoph)

#3B. How many cases are there? Save this result as all_cases for future use.
all_cases <- sum(esoph$ncases)

#3C. How many controls are there? Save this result as all_controls for future use.
all_controls <- sum(esoph$ncontrols)

#4A. What is the probability that a subject in the highest alcohol consumption group is a cancer case?
esoph %>% filter(esoph$alcgp == "120+") %>% summarize(sum_cases = sum(ncases,na.rm = TRUE),total = sum(ncontrols) + sum(ncases),prob=sum_cases / total)

#4B. What is the probability that a subject in the lowest alcohol consumption group is a cancer case?
esoph %>% filter(esoph$alcgp == "0-39g/day") %>% summarize(sum_cases = sum(ncases,na.rm = TRUE),total = sum(ncontrols) + sum(ncases),prob=sum_cases / total)

#4C. Given that a person is a case, what is the probability that they smoke 10g or more a day?

esoph %>% filter(tobgp != "0-9g/day") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

#4D. Given that a person is a control, what is the probability that they smoke 10g or more a day?

esoph %>% filter(tobgp != "0-9g/day") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

#4D. Given that a person is a control, what is the probability that they smoke 10g or more a day?
ca_prob <- esoph %>% filter(alcgp == "120+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

co_prob <- esoph %>% filter(alcgp == "120+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

ca_prob
co_prob

ca_prob / co_prob


esoph %>% filter(tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

esoph %>% filter(alcgp == "120+" & tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)


ca_prob1 <- esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

co_prob1 <- esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

ca_prob1 / co_prob1