##########  Questions 5 and 6: Esophageal cancer and alcohol/tobacco use, part 2  ##########

#5A. For cases, what is the probability of being in the highest alcohol group?
ca_prob <- esoph %>% filter(alcgp == "120+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)
ca_prob

#5B. For cases, what is the probability of being in the highest tobacco group?
esoph %>% filter(tobgp == "30+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

#5C. For cases, what is the probability of being in the highest alcohol group and the highest tobacco group?
esoph %>% filter(alcgp == "120+" & tobgp == "30+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

#5D. For cases, what is the probability of being in the highest alcohol group or the highest tobacco group?
esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

#6A. For controls, what is the probability of being in the highest alcohol group?
co_prob <- esoph %>% filter(alcgp == "120+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)
co_prob

#6B. How many times more likely are cases than controls to be in the highest alcohol group?
ratio <- ca_prob$probability / co_prob$probability
ratio

#6C. For controls, what is the probability of being in the highest tobacco group?
esoph %>% filter(tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

#6D. For controls, what is the probability of being in the highest alcohol group and the highest tobacco group?
esoph %>% filter(alcgp == "120+" & tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

#6E. For controls, what is the probability of being in the highest alcohol group or the highest tobacco group?
esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

#6F. How many times more likely are cases than controls to be in the highest alcohol group or the highest tobacco group?
ca_prob1 <- esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_cases = sum(ncases),probability = sum_cases / all_cases)

co_prob1 <- esoph %>% filter(alcgp == "120+" | tobgp == "30+") %>% summarize(sum_controls = sum(ncontrols),probability = sum_controls / all_controls)

ratio1 = ca_prob1$probability / co_prob1$probability
ratio1