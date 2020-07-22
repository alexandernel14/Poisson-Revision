# Alexander Nel Poisson Revision, solving problems in R.

# Supposed the number of people entering a building follows a Poisson Distribuition with rate parameter 5/minute
# For all of the examples below assume that X ~ Po(lambda = 5/min)

# Lets use the ? (help) to get more information about the functions related to the Poisson Distribution.
?ppois

# Question 1, What is the probability that the number of arrivals, X is less than or equal to 4
# in the first minute.

# There are two approaches:

# Approach 1 Use the sum of the values of the probability mass function values at X = 0,1,2,3,4.
sum(dpois(0:4, lambda = 5))

# Get the probability that X is less than or equal to 4.
# Approach 2 is to use the Cumulative Distribution Function (ppois()), which returns the probabilites
# That the Random Variable will be less than or equal to a value q. Note that we can change the less than or
# equal to greater than or equal by changing the lower.tail argument to F.

ppois(4, lambda = 5, lower.tail = T)

# As we can see both these approaches yield the same result.


# An example of changing the lower.tail argument to F and verifying that the sum of these answers are 1.

# Probability that X  is less than or equal to 4.
a <- ppois(4, lambda = 5, lower.tail = T)
a
# Probability that X is greater than 4.
b <- ppois(4, lambda = 5, lower.tail = F)
b

# Now add these two numbers and verify that they add up to 1.
a + b

# Question 2 What is the probability that in the first ten minutes no people arrive at the building.


# Step 1: Note that lambda is 5 per minute that means we need to multiply our rate paramter by 10.
# This is so that we can have the rate of arrivals per 10 minutes (5*10)
# Now use P(X = 0), thus use the dpois function.

dpois(0, lambda = 50)
exp(-50)

# Set a seed so that we can reproduce the same results each time the code runs.
set.seed(12)
sample_1 <- rpois(10000, lambda = 5)
# Generate a sample of 10000 results from the Distribution X~Po(5/minute)

# Lets verify that the mean and variance of sample_1 are around 5.
Expected_value = mean(sample_1)
Expected_value

Variance = var(sample_1)
Variance
# Randomly generate 10000 samples from X ~ Po(5), and plot them
hist(rpois(10000, lambda = 5), main = "Histogram of 10000 samples drawn from X", ylim = c(0,0.2),xlab = "Number of arrivals", freq = F, las = T)

