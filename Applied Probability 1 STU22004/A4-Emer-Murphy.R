#1
#lambda = 1/60
#beta = lambda
#k=2

prob <- function(k) {
  
  lambda <- 1/60
  #given in the question
  beta <- lambda
  
  #gets time that the customer is in the shop
  time <- mean(rexp(10000, lambda)) 
  
  #the number of customers that arrive during that time 
  X <- rpois(10000, time*beta) 
  
  # true if it's 2 or less customers that arrived in that time
  Y <- (X<=2)
  
  # Z is the percentage of arrivals <=2
  # ((num of <2 customers arrive)/10000)*100 = num of <2 customers arrive)/100
  Z <- sum(Y, na.rm = TRUE)/100
  
  #returns the probability 
  return(Z) 
  
}

# array for the results
resultsOfk <- vector("numeric", 200)
k <- 2


for (i in 1:200) {
  print(i)
  resultsOfk[i] <- prob(k)
}

#this is the probability that while a particular customer is shopping, 
#max k other customers arrive
print(mean(resultsOfk))


#Q2

f <- function(a) {
  
  #10,000 samples
  X <- runif(10000, 0, a)
  
  # check each sample for the conditions of Y  
  for (i in 1:10000) {
    if (X[i] >= (a/2)) {
      X[i] = a/2
    }
    #else if X[i] < a/2, X[i] = X, the sample generated
  }
  
  # return the mean of the 10,000 samples
  return(mean(X))
  
}

# array for the results
resultFora <- vector("numeric", 200)
par(mfrow=c(2, 3))  # divide graph area in 2 columns
# an array for the mean of the result for each a
meanResultsFora <- vector("numeric", 5)
theNumberOfa <- (1:5) #x axis

for (a in 1:5) {
  # run 200 times
  for (i in 1:200) {
    print(i)
    resultFora[i] <- f(a)
  }
  meanResultsFora[a] <- mean(resultFora)
}

#The means for are 3a/8
plot(x=theNumberOfa, y=meanResultsFora, main ='E[Y] versus a', xlab='a', ylab='E[Y]', col=2, type='h', lwd=20) 






