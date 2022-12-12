library(stringr)

################################################################################
# Joining strings with str_c
str_c(c(1,2))
str_c(c("a", "b"), c(1,2), c("c", "d"))
str_c(c("a", "b"), c(1,2), c("c", "d"), sep = "-")

str_c("Letter: ", letters)
str_c("Letter", letters, sep = ": ")
str_c(LETTERS, " is for", "...")
str_c(LETTERS, c(" is for", " for"), "...")
str_c(letters[-26], " is before ", letters[-1])

str_c(c(1,2), collapse = "")
str_c(c("a", "b"), c(1,2), c("c", "d"), collapse=":")
str_c(c("a", "b"), c(1,2), c("c", "d"), sep = "-", collapse=":")

str_flatten(letters)
str_flatten(letters, collapse = ":")

# Missing inputs give missing outputs
str_c(c("a", NA, "b"), "-d")

################################################################################
# Lengths of strings with str_length
str_length(c("a", "b", "c"))
str_length(c("a1", "b23", "c456"))
str_length(c("a1", NA, "c456"))

str_length(letters)

################################################################################
# Sub-strings: indexing starts from 1 and it is inclusive
s <- "United States"

str_sub(s, 1, 6) # United
str_sub(s, end = 6) # United
str_sub(s, start = 2, end = 5) # nite
str_sub(s, 8) # States

str_sub(s, c(1, 8), c(6, 13)) # "United" "States"
str_sub(s, start = c(1, 8), end = c(6, 13))  # "United" "States"
str_sub(s, c(1, 8)) # "United States" "States"
str_sub(s, end = c(6, 13)) # "United" "United States"

str_sub(s, -1)
str_sub(s, -6)
str_sub(s, -10, -8)
str_sub(s, end = -6)

x <- "CLAP"
str_sub(x, 1, 1) <- "F"; x
str_sub(x, -1, -1) <- "T"; x
str_sub(x, 2, -2) <- "OO"; x
str_sub(x, 2, -2) <- ""; x

################################################################################
# Duplicate strings
x <- c("a1", "b2", "c3")
str_dup(x, 2)
str_dup(x, 1:3)
str_c("a", str_dup("ha", 0:4))

################################################################################
# Trimming strings
x <- "    How     are \n you?\t"

str_trim(x)
str_trim(x, side="left")
str_trim(x, side="right")
str_squish(x)

################################################################################
# Padding strings
str_pad("cs544", 10)
str_pad("cs544", 10, pad = "_")

rbind(
  str_pad("cs544", 10, "left"),
  str_pad("cs544", 10, "right"),
  str_pad("cs544", 10, "both")
)

str_pad(c("a", "abc", "abcdef"), 5)
str_pad("a", c(2, 4, 6))
str_pad("cs544", 10, pad = c("_", "#"))
str_pad(c("cs544", "cs555"), 10, pad = c("_", "#"))

# Longer strings are returned unchanged
str_pad("cs544", 3)

################################################################################
# Truncating strings
x <- "My name is Farah and I am 23 years old."
str_length(x)

rbind(
  str_trunc(x, 25, "left"),
  str_trunc(x, 25, "right"),
  str_trunc(x, 25, "center")
)

################################################################################
# Detecting patterns in strings - Regex

fruit[str_detect(fruit, "ap")]
fruit[str_detect(fruit, "^ap")]
fruit[str_detect(fruit, "it$")]
fruit[str_detect(fruit, "[dvw]")]
fruit[str_detect(fruit, "[:space:]")]

str_subset(fruit, "ap")
str_locate(fruit, "ap")
str_locate_all(fruit, "ap")
str_extract(fruit, "ap")
str_extract_all(fruit, "ap")
str_replace(fruit, "ap", "XX")
str_replace_all(fruit, "ap", "XX")

################################################################################
# Count number of matches in strings
str_count(fruit, "ap")
y <- c("Hello, how are you? I am fine, thank you.", "Good bye!")
str_length(y)

str_count(y, boundary("sentence"))
str_count(y, boundary("word"))
str_count(y, boundary("character"))

################################################################################
# Split strings
x <- c("Hello, how are you? I am fine, thank you.", "Good bye!")

str_split(x, boundary("sentence"))
str_split(x, boundary("sentence"), simplify = TRUE)

str_split(x, boundary("word"))
str_split(x, boundary("word"), n = 4)

str_split(x, boundary("character"))
