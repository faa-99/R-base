library(stats)
library(asbio)

# Function to calculate the z-score of a vector
get_z_score <- function(x) {
  # Calculate the mean of the vector
  mean_x <- mean(x)
  
  # Calculate the standard deviation of the vector
  sd_x <- sd(x)
  
  # Calculate the z-score of each value in the vector
  z <- (x - mean_x) / sd_x
  
  # Return the z-score of the vector
  return(z)
}

# Function to calculate the z-critical value
get_z_critical <- function(confidence) {
  # Calculate the z-critical value based on the given confidence interval
  z_critical <- qnorm(1 - (1 - confidence) / 2)
  
  # Return the z-critical value
  return(z_critical)
}

# Function to calculate the confidence interval of a sample mean
get_confidence_interval <- function(mean, sd, sample_size, confidence) {
  # Calculate the z-critical value based on the given confidence interval
  z_critical <- qnorm(1 - (1 - confidence) / 2)
  
  # Calculate the margin of error
  margin_error <- z_critical * (sd / sqrt(sample_size))
  
  # Calculate the lower and upper bounds of the confidence interval
  lower_bound <- mean - margin_error
  upper_bound <- mean + margin_error
  
  # Return the confidence interval
  return(c(lower_bound, upper_bound))
}

# Function to perform a one-sample z-test
one_sample_z_test <- function(x, mean, sd, sample_size, confidence) {
  # Calculate the sample mean
  sample_mean <- mean(x)
  
  # Calculate the z-score of the sample mean
  z_score <- (sample_mean - mean) / (sd / sqrt(sample_size))
  
  # Calculate the p-value of the z-score
  p_value <- 2 * pnorm(abs(z_score), lower.tail = FALSE)
  
  # Calculate the z-critical value based on the given confidence interval
  z_critical <- qnorm(1 - (1 - confidence) / 2)
  
  # Calculate the margin of error
  margin_error <- z_critical * (sd / sqrt(sample_size))
  
  # Calculate the lower and upper bounds of the confidence interval
  lower_bound <- mean - margin_error
  upper_bound <- mean + margin_error
  
  # Return the test results
  return(list(z_score = z_score, p_value = p_value,
              confidence_interval = c(lower_bound, upper_bound)))
}
