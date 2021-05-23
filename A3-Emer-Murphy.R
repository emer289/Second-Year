#Q1
# I use T becuase it's used in the question 

percentageOfLifetime <- function(k) {
  
  #lambda is the rate parameter 
  lambda <- 1/24000
  
  #mean of 10,000 samples for the first lamp
  T1 <- mean(rexp(10000,lambda)) 
  
  # t is the total time that we can use the lamps for 
  # t has the same meaning as it does in the question
  t <- T1
  
  for(j in 2:k){
    
    #mean of 10,000 samples for each the lamps up to k
    Tk <- mean(rexp(10000,lambda)) 
    
    t = t + Tk 
  }
  p <- 100*(T1/t)
  
  return(p)
  
}
# array for the results
resultsOfkLamps <- vector("numeric", 200)
# divide graph area in 2 columns
par(mfrow=c(2, 3))  
# an array for the mean  of the result for each k lamps
meanResultsOfkLamps <- vector("numeric", 4)
#x axis
theNumberOfLamps <- (2:5) 


for (k in 2:5) {
  # 200 iterations
  for (i in 1:200) {
    print(i)
    resultsOfkLamps[i] <- percentageOfLifetime(k)
  }
  # the mean result for each k cards
  meanResultsOfkLamps[k-1] <- mean(resultsOfkLamps)
  
}
plot(x=theNumberOfLamps, y=meanResultsOfkLamps, main ='The Results Verus K', xlab='The number of lamps', ylab='The percentages', col=2, type='h', lwd=20)





#2
prob <- function(sd) {
  
  #generating the 10,000 samples
  X <- rnorm(10000,0,sd)
  
  #checking each sample to see if it is between 1 and 2
  Y<- (1<X & X<2)
  
  # Z is the number of samples that are between 1 and 2
  Z<-sum(Y, na.rm = TRUE)
  
  #print(Z)
  
  #returns P(1<X<2) using the 10,000 samples
  #(Z/10,000)*100 = Z/100
  return(Z/100) 
  
}

# array for the results
resultsOfSD <- vector("numeric", 200)
# divide graph area in 2 columns
par(mfrow=c(2, 3))  
# an array for the mean of the result for each standard deviation 
meanResultsOfEachSD <- vector("numeric", 11)
#x axis
standardDeviation <- seq(1, 2, length.out = 11) 


for(sd in seq(1,2,0.1)){
  # 200 iterations
  for (i in 1:200) {
    resultsOfSD[i] <- prob(sd)
  }
  # the mean result for each sd
  A <- mean(resultsOfSD) 
  print(A)
  meanResultsOfEachSD[(sd*10)-9] <-A
}
sigma <-((which.max(meanResultsOfEachSD))+9)/10 
sigmaSquared <- sigma*sigma
print(sigma)
#the answer to the question
print(sigmaSquared)
#we aren't asked to plot in the question but I think it helps
plot(x=standardDeviation, y=meanResultsOfEachSD, main ='The value of Sigma for which P(1<X<2) is Max', xlab='Standard Deviation', ylab='P(1<X<2)', col=2, type='h', lwd=20)


#This is not part of my solution
#I used this code to decided the range of the standard deviation, between 1 and 2
#it helped me understand how the probability 
#changes when the standard deviation changes 

#for(sd in seq(1,2,0.1)){ #changing standard deviation
#y <- pnorm(2,0,sd)-pnorm(1,0,sd) #probability 1<X<2
#print(y)
#}



