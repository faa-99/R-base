library(tidyverse)
library(nycflights13)

flights <- nycflights13::flights
flights
# Data frame alternative. Can be created in one step
a <- 1:100
b <- a * 2
c <- b^2
tibble(a, b, c)
as_tibble(iris)
is_tibble(iris)

# Can specify the data row-wise
athlete.info <- tribble(
  ~Name,       ~Salary, ~Endorsements, ~Sport,
  "Farah",  105,      0,             "Boxing",
  "Joe",      52,     28,            "Soccer",
  "Rami",      19.3,  53,            "Basketball",
)

athlete.info

# sneak peek of data
glimpse(athlete.info)

# summary of the data
athlete.info %>% summary

# filter – extract existing observations by their values
filter(flights, month == 4, day == 10)
filter(flights, month == 4 | day == 10)
filter(flights, month %in% c(3, 4, 5))

# arrange – reorder the rows of the data
arrange(flights, year, dep_time)
arrange(flights, desc(month), dep_time)

# select – pick existing variables by their names
select(flights, carrier, flight, origin, dest)
select(flights, carrier:dest)
select(flights, -(carrier:dest))
select(flights, starts_with("d"))
select(flights, ends_with("time"))
select(flights, contains("in"))

select(flights, c = carrier )
select(flights, flight, origin, dest, everything())
rename(flights, c = carrier)

# mutate – create new variables based on expressions from existing variables
flights %>%
  mutate(gain = arr_delay - dep_delay,
         speed = (distance / air_time) * 60)  %>% 
  select(flight, arr_delay, dep_delay, gain, 
         distance, air_time, speed, everything())
# To keep only the new variables
flights %>%
  transmute(gain = arr_delay - dep_delay,
            speed = (distance / air_time) * 60)

# group_by - grouped data by similar feature
group_by(flights, carrier) %>%
  summarise(count = n())


flights %>%
  filter(arr_delay > 0) %>%
  group_by(origin, dest) %>%
  summarise(count = n(),
            avg_delay = mean(arr_delay))
