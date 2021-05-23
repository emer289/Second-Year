#1
meanOf10000tot <- 0

for (j in 1:200) {
  diceRollsFor6Facestot <- 0 # sum of dicerolls to get 6 faces
  for(i in 1:10000){ #check 10000 times how many dice rolls it takes to get 6 sides
    diceFaces <- c(NA,NA,NA,NA,NA,NA)
    dicerolls <- 0 #this keeps count of the num of dice roles until there are 6 faces
    while(any(is.na(diceFaces))){
      x <- sample(1:6, size = 1, replace = TRUE)
      dicerolls = dicerolls + 1
      diceFaces[x] = 1
    }
    diceRollsFor6Facestot = diceRollsFor6Facestot + dicerolls
  }
  print(j)
  meanOf10000 <- diceRollsFor6Facestot/10000
  meanOf10000tot <- meanOf10000tot + meanOf10000
}
meanOf200OfmeanOf10000 <- meanOf10000tot/200
print(paste("answer is", meanOf200OfmeanOf10000))

#Q2
guess <- function(k) {
  resultOfEachSample <- matrix(0, 1, 10000) 
  # 10,000 random samples
  for (i in 1:10000) {
    theCards <- array(sample(1:k, k, replace = FALSE))
    # picks a set of guesses
    theGuesses <- array(sample(1:k, k, replace = FALSE))
    #the array to compare the cards and the guesses
    compareCardsAndGuesses <- array(0, k)
    for (j in 1:k) {
      if (theCards[j] == theGuesses[j]) {
        compareCardsAndGuesses[j] <- 0
      } else {
        compareCardsAndGuesses[j] <- 1
      }
    }
    #default is that all guesses are wrong
    allWrong <- TRUE
    #if there is a correct guess
    for (j in 1:k) {
      if (compareCardsAndGuesses[j] == 0) {
        allWrong <- FALSE
      }
    }
    if (allWrong) {
      resultOfEachSample[i] <- 1
    } else {
      resultOfEachSample[i] <- 0
    }
  }
  # return the mean of the 10,000 samples
  return(mean(resultOfEachSample))
  
}

# array for the results
resultsOfkCards <- array(0, 200)
par(mfrow=c(2, 3))  # divide graph area in 2 columns
# an array for the mean  of the result for each k cards
meanResultsOfkCards <- array(0, 5)
theNumberOfCards <- array(6:10, 5)

for (k in 6:10) {
  # 200 iterations
  for (i in 1:200) {
    resultsOfkCards[i] <- guess(k)
  }
  # the mean result for each k cards
  meanResultsOfkCards[k-5] <- mean(resultsOfkCards)
  
}
plot(x=theNumberOfCards, y=meanResultsOfkCards, xlab='The number of cards', ylab='The probabilities')

