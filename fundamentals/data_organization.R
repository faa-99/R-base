library(tidyverse)

set.seed(123)

sales <- 
  tibble(Store=rep(1:3, each=4),
         Year=rep(2014:2017, 3),
         Qtr_1 = round(runif(12, 10, 30)),
         Qtr_2 = round(runif(12, 10, 30)),
         Qtr_3 = round(runif(12, 10, 30)),
         Qtr_4 = round(runif(12, 10, 30))
  )

sales

# gather – takes multiple columns in the data set and collapses them into key-value pairs. 
# The resulting data set is typically known as the long form of the data.
sales %>%
  gather(Quarter, Revenue, Qtr_1 : Qtr_4, na.rm = TRUE) -> long_data

# separate – takes the values in a column and splits them into multiple columns.
long_data %>% 
  separate(Quarter, c("Time_Interval", "Interval_ID"),
           sep = "_", convert = TRUE) -> separate_data

separate_data

# unite – takes the values from multiple columns and combines them into a single column.
separate_data %>% 
  unite(Quarter, Time_Interval, Interval_ID)

separate_data %>% 
  unite(Quarter, Time_Interval, Interval_ID, sep = ".")

# spread – takes the data in a long form and spreads the key-value pairs across multiple columns.
long_data %>% spread(Quarter, Revenue)
