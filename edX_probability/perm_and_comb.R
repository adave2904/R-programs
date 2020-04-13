##### Create a card deck. #####

#Define a vector to store the suits of the card deck.
suits <- c("Spades","Diamonds","Clubs","Hearts")

#Define a vector to store the numbers of the card deck.
numbers <- c("Ace","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Jack","Queen","King")

#Combine the suits and numbers vectors to get all possible combinations.
deck <- expand.grid(number = numbers,suit = suits)

#Paste the columns of the grid to get the complete deck.
deck <- paste(deck$number,deck$suit)

######## Determine the probability of drawing a King from the deck ########

kings <- paste("King",suits)
p_kings <- mean(deck %in% kings)
p_kings #0.07692308 which is 1 / 13.

######## Determine the conditional probability of drawing a King in the second draw  ########
######## given that a King was drawn in the first attempt. ########

### Determine all the possible permutations of drawing two cards from a deck of 52 cards.
hands <- permutations(52,2,v = deck)
hands

#Create vectors for the first card in each permutation and second card in each permutation
first_card <- hands[,1]
second_card <- hands[,2]

#Check for how many cases the first card is a King.
sum(first_card %in% kings) #204

#Get the probability of second card being a King given that the first card is King.
sum(first_card %in% kings & second_card %in% kings) / 
  sum(first_card %in% kings) #.05882353 -- 3 / 51


######## Determine the probability of drawing a natural 21 in black jack ########

#Get all the aces
aces <- paste("Ace",suits)
#Get all the facecards
faces <- c("King","Queen","Jack","Ten")
faces <- expand.grid(number = faces,suit = suits)
faces <- paste(faces$number,faces$suit)

#Get all possible hands
hands1 <- combinations(52,2,v = deck)

#Probability of a natural 21 given that the ace is first card.
mean(hands1[,1] %in% aces & hands[,2] %in% faces) #0.048

#Probability of a natural 21 given that the ace is first card or the second.
mean( (hands1[,1] %in% aces & hands[,2] %in% faces) | (hands1[,2] %in% aces & hands1[,1] %in% faces) ) #0.048


