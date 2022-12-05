# Statistics - Introduction

Use data to find patterns, answer important scientific questions and draw conclusions

It includes 2 main areas:

1. Describing data (Numerical and Graphical Summaries)
2. Drawing conclusions about data (Making estimates, predictions, and decisions) from sampled data

Fundamental Elements of Statistics:

- **An experimental unit:** an object about which we collect data 
- **A population:** a set of units that we are interested in studying 
- **A sample:** a set of data collected from a statistical population by a defined procedure.
- **A parameter:** a number that describes a population
- **A statistic:** a number that is computed from the sample data
- **Biases:** introduced by sampling are often termed selection biases
    - To avoid them, sample randomly
    - Ensure that each individual or element from the population has an equal chance of being selected is key to protecting against selection bias.

- **Variables:** characteristics of the units of the population
    - **Quantitative:** contain numerical data (age, height, weight, etc…)
    - **Qualitative:** data about categorical variables (Yes/No, Big/Medium/Small, Easy/Hard, etc…)
    
## Data Summarization

### Measures of Central Tendency

#### Mean

sum of values divided by the number of the values

#### Median

the number that splits the data between the bottom 50% and the top 50%.

if the number of values is odd ⇒ median is the middle value

if the number of values is even ⇒ median is the mean of the two middle values

#### Mode

the most frequently occurring value in the data-set

### Measures of Variation

#### Range

the difference between the largest and smallest values

#### Standard Deviation and Variance

The st. deviation is the square root of the variance.

Unlike the range, it takes into account all values of the data-set

It is a measurement of how far each number in a data set is from the mean and every other number in the set

It is used to measure the spread between numbers and determine volatility

The more variation there is in the data set, the larger the standard deviation

#### Five Number Summary

The mean and standard deviation are sensitive to extreme values. 

Measures based on percentiles are resistant measures.

The quartiles are denoted by the three values Q1 , Q2 , and Q3 . The first quartile, Q1 , divides the bottom 25% of the data from the top 75% . The second quartile, Q2 , is the median that divides the bottom 50% from the top 50% . The third quartile, Q3 , divides the bottom 75% from the top 25% .

The interquartile range, IQR, is the difference between the third and first quartiles:

                                IQR = Q3 – Q1

                           

The IQR shows the variation in the middle 50% of the data.

The five number summary of the data set consists of the minimum, Q1 , Q2 , Q3 , and maximum values.

- The variation in the first quarter is **Q1 − minimum**
- The variation in the second quarter is **Q2 – Q1**
- The variation in the third quarter is **Q3 – Q2**
- The variation in the last quarter is **maximum – Q3**

### Outliers
- Values that are more than 3 standard deviations away from the mean
- Values < Q1 - 1.5 * IQR 
- Values > Q3 + 1.5 * IQR

## Shape of Data

The shape of data is the distribution of data values throughout the range of the data. 
### Symmetric

A distribution is symmetrical when the values below the mean are distributed the same way as the values above the mean. The **mean and the median** are the close to each other. 

### Skewed
#### Left Skewed
If most of the values are in the upper portion of the distribution, the distribution is left-skewed. The presence of fewer numbers of small value pulls the mean towards the left end of the data. 

The mean is less than the median in this case. 
#### Right Skewed
If most of the values are in the lower end of the distribution, the distribution is right-skewed. The presence of fewer numbers of larger value pulls the mean towards the right end of the data. 

The mean is greater than the median in this case.

### Bimodal
2 peaks indicating that there are two distinct groups of values.

### Uniform
All values are evenly distributed with no single value appearing more frequently than any other.