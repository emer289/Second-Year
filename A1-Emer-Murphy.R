

hcf <- function(num1, num2) {
  if(num1 > num2) {
    smaller = num2
  } else {
    smaller = num1
  }
  for(i in 1:smaller) {
    if((num1 %% i == 0) && (num2 %% i == 0)) {
      hcf = i
    }
  }
  return(hcf)
}
coprime0 <- 0
coprime1 <- 0
for(i in 1:200){
  for(j in 1:10000){
    num1 = sample(1:10000, 1, replace = TRUE)
    #    print(paste("num1 is", num1))
    num2 = sample(1:10000, 1, replace = TRUE)
    #   print(paste("num2 is", num2))
    if(hcf(num1, num2) == 1){
      coprime0 = coprime0 + 1
    }
  }
  print(i)
  coprime1 = coprime1 + coprime0
} 
mean <- coprime1/200
print(paste("mean is", mean))


