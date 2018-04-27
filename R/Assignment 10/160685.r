num_samples <- 50000
X <- rexp(num_samples, 0.2)
x <- data.frame(X = seq(1, num_samples , 1), Y = sort(X))
plot(x, main = "Scatter plot for 50000 samples")
mean <- mean(X)
sd <- sd(X)	

num_vectors <- 500
num_elements <- 100
Y <- matrix(, nrow = num_vectors, ncol = num_elements)
for(i in 1:num_vectors){
	for(j in 1:num_elements){
		Y[i,j] <- X[i*j]
	}
}

for(i in 1:5){

	pdata <- rep(0, 100);

	for(j in 1:num_elements){
	    val <- round(Y[i,j], 0)
	    if(val <= 100){
	       pdata[val] = pdata[val] + 1/ num_samples 
	    }
	}

	xcols <- c(0:99)

	plot(xcols, pdata, "l", col="green", main = paste("Probability Distribution Function for Y",i,sep=""), xlab=paste("Y",i,sep=""), ylab=paste("f(Y",i,")",sep=""))

	cdata <- rep(0, 100)

	cdata[1] <- pdata[1]

	for(j in 2:100){
	    cdata[j] = cdata[j-1] + pdata[j]
	}

	plot(xcols, cdata, "o", col="blue", main = paste("Cumulative Distribution Function for Y",i,sep=""), xlab=paste("Y",i,sep=""), ylab=paste("F(Y",i,")",sep=""))
}

Z <- rep(0, 100)
S <- rep(0, 100)

for(i in 1:num_vectors){
	Z[i] <- mean(Y[i,])
	S[i] <- sd(Y[i,])
}

for(i in 1:5){
	cat("Mean(Y",i,") = ",Z[i],"\n",sep="")
}

for(i in 1:5){
	cat("Standard deviation(Y",i,") = ",S[i],"\n",sep="")
}

tab <- table(round(Z))

plot(tab, "h", col="red", main = "Frequency Function for Mean of samples", xlab="Mean", ylab="Frequency")

pdata <- rep(0, 9)

for(i in 1:num_vectors){
    val <- round(Z[i], 0)
    if(val <= 9){
       pdata[val] = pdata[val] + 1/ num_samples 
    }
}

xcols <- c(1:9)

plot(xcols, pdata, "l", col="green", main = "Probability Distribution Function for Mean", xlab="Z", ylab="f(Z)",axes=FALSE)
box()
axis(1, at = seq(1, 9, by = 1))
axis(2)

cdata <- rep(0, 9)

cdata[1] <- pdata[1]

for(i in 2:9){
    cdata[i] = cdata[i-1] + pdata[i]
}

plot(xcols, cdata, "o", col="blue", main = "Cumulative Distribution Function for Mean", xlab="Z", ylab="F(Z)",axes=FALSE)
box()
axis(1, at = seq(1, 9, by = 1))
axis(2)

meanmean <- mean(Z)
sdmean <- sd(Z)	

cat("Mean of Mean of Samples =",meanmean,"\n")
cat("Standard Deviation of Mean of Samples =",sdmean,"\n")

diffmean <- abs(mean - meanmean)
diffsd <- abs(sd - sdmean)

cat("Difference b/n Mean of Sample Distribution and Mean of Mean of Samples =",diffmean,"\n")
cat("Difference b/n Standard Deviation of Sample Distribution and Standard Deviation of Mean of Samples =",diffsd,"\n")
cat("Hence, it is verified that the Mean and Standard Deviation of the Distribution of Sample Mean Values are close to the Original Distribution\n")