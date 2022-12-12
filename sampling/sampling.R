library(boot)
library(sampling)

# Function that performs simple random sampling
simple_random_sampling <- function(sample.size, frame.size, rep = TRUE) {
 # Return vector of size N with the nb of times each element is included
  if (rep) {
   return (srswr(sample.size, frame.size))
  }
  # Returns vector of size N having 1 for each selected item

  else {
    return (srswor(sample.size, frame.size))
  }
}

# Function to get the selected data that was sampled
get_simple_data <- function(population, sample, rep = TRUE) {
  if (rep) {
    rows <- (1:nrow(population))[sample!=0]
    rows <- rep(rows, sample[sample != 0])
    return (population[rows,])
  }
  else {
    return (population[sample != 0])
  }
}

# Function which performs systematic sampling with equal prob
systematic_sampling_eq_prob <- function(sample.size, frame.size) {
  k <- ceiling(frame.size / sample.size)
  r <- sample(k, 1)
  return (seq(r, by = k, length = sample.size))
}

# Function which performs systematic sampling with unequal prob
systematic_sampling_uneq_prob <- function(data, sample.size) {
  pik <- inclusionprobabilities(data, sample.size)
  return (UPsystematic(pik))
}

# Function which performs stratified sampling
stratified_sampling <- function(data, strata, size) {
  st <- strata(data,
               stratanames = strata,
               size = size,
               method = "srswor",
               description = TRUE
               )
  return (getdata(data, st))
}

# Function which performs cluster sampling
cluster_sampling <- function(data, strata, size) {
  c <- cluster(data, strata, size = size, method = "srswor")
  
  return (getdata(data, c))
  
}

# Function to get the bias of the statistic and the standard error
samplemean <- function(x, indices) { 
  return (mean(x[indices]))
}

get_bias <- function(sample, resamples) {
  return (boot(data = sample, 
               statistic = samplemean, 
               R = resamples)
          )
  
}


n = 10

section.ids <- rep(LETTERS[1:4], c(10, 20, 30, 40))
section.scores <- round(runif(100, 60, 80))
data <- data.frame(
  Section = section.ids, 
  Score = section.scores)

sample <- rnorm(30, mean = 60, sd = 10)
sample <- as.integer(sample)

################################################################################

x <- simple_random_sampling(n, nrow(swissmunicipalities))
get_simple_data(swissmunicipalities, x)

y <- systematic_sampling_eq_prob(n, nrow(swissmunicipalities))
swissmunicipalities[y, ]

z <- systematic_sampling_uneq_prob(swissmunicipalities$POPTOT, n)
swissmunicipalities[z != 0, ]

freq <- table(data$Section)
st.sizes <- 20 * freq / sum(freq)
stratified_sampling(data, c("Section"), st.sizes)

v <- cluster_sampling(data, c("Section"), 3)
v

get_bias(sample, 1000)
