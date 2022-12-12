require(dplyr)
library(ggplot2)

# Function to calculate the statistics of a vector
calculate_stats <- function(x) {
  # Use dplyr to calculate the mean, median, and standard deviation of the vector
  x <- data.frame(x = x)
  stats <- x %>%
    summarize(mean = mean(x),
              median = median(x),
              sd = sd(x),
              var = var(x),
              min = min(x),
              max = max(x),
              range = max(x) - min(x),
              )
  
  # Return the statistics
  return(stats)
}


calculate_stats_by_group <- function(df, x, group) {
  stats <- df %>%
    group_by(df$group) %>%
    summarize(mean = mean(x),
              median = median(x),
              sd = sd(x),
              var = var(x),
              min = min(x),
              max = max(x),
              range = max(x) - min(x),
    )
  
  # Return the statistics
  return(stats)
}


# Function to calculate the IQR and outliers of a vector
calculate_iqr <- function(x) {
  # Calculate the 25th and 75th quantiles of the vector
  q25 <- quantile(x, 0.25)
  q75 <- quantile(x, 0.75)
  
  # Calculate the IQR of the vector
  iqr <- q75 - q25
  
  # Identify the outliers in the vector
  outliers <- x[x < (q25 - 1.5 * iqr) | x > (q75 + 1.5 * iqr)]
  
  # Return the IQR and outliers
  return(list(iqr = iqr, outliers = outliers))
}

# Function to remove the outliers from a vector
remove_outliers <- function(x) {
  # Calculate the 25th and 75th quantiles of the vector
  q25 <- quantile(x, 0.25)
  q75 <- quantile(x, 0.75)
  
  # Calculate the IQR of the vector
  iqr <- q75 - q25
  
  # Remove the outliers from the vector
  x_clean <- x[x >= (q25 - 1.5 * iqr) & x <= (q75 + 1.5 * iqr)]
  
  # Return the vector without the outliers
  return(x_clean)
}

# Function to calculate the frequency of each group
get_counts <- function(x) {
  x <- data.frame(x = x)
  counts <- x %>% count(x)
  
  return(counts)
}

# Function to plot a boxplot of a vector
plot_boxplot <- function(x, title, xlab, ylab, annot = FALSE) {
  # Import the ggplot2 package
  library(ggplot2)
  
  # Create a dataframe with a single column containing the vector
  df <- data.frame(x)
  
  if (annot == TRUE) {
    # Calculate the minimum, maximum, and median values of the vector
    min_val <- min(x)
    max_val <- max(x)
    median_val <- median(x)
    
    # Identify the outliers in the vector
    q25 <- quantile(x, 0.25)
    q75 <- quantile(x, 0.75)
    iqr <- q75 - q25
    outliers <- x[x < (q25 - 1.5 * iqr) | x > (q75 + 1.5 * iqr)]
    
    # Create a dataframe with the values to annotate on the plot
    annotations <- data.frame(
      x = rep(1, 5),
      y = c(min_val, median_val, max_val, outliers[1], outliers[2]),
      label = c("Min", "Median", "Max", "Outlier", "Outlier")
    )
    # Draw a boxplot of the vector
    ggplot(df, aes(x = 1, y = x)) +
      geom_boxplot() +
      geom_text(data = annotations, aes(x, y, label = label), hjust = 0, vjust = -0.5) +
      ggtitle(title) +
      xlab(xlab) +
      ylab(ylab)
  }
  
  else {
    # Draw a boxplot of the vector
    ggplot(df, aes(x = 1, y = x)) +
      geom_boxplot() +
      stat_boxplot(geom='errorbar') +
      ggtitle(title) +
      xlab(xlab) +
      ylab(ylab)
  }
  
  
}

# Function to plot a histogram of a vector
plot_histogram <- function(x, title, xlab, ylab, color = "blue") {
  # Create a dataframe with a single column containing the vector
  df <- data.frame(x)
  
  # Draw a histogram of the vector
  ggplot(df, aes(x)) +
    geom_histogram(fill = color, alpha = 0.5) +
    ggtitle(title) +
    xlab(xlab) +
    ylab(ylab)
}
