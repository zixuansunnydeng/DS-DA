# Practical Stats



# Data Types

**Quantitative** and **Categorical**

- Quantitative can be further divided into Continuous or Discrete. Height, Age, the Number of Pages in a Book and Annual Income all take on values that we can add, subtract and perform other operations with to gain useful insight. Hence, these are quantitative
  - Height, age, and income are all examples of continuous data. Alternatively, the number of pages in a book, dogs I count outside a coffee shop, or trees in a yard are discrete data. We would not want to split our dogs in half.
- Categorical data can be divided into Ordinal or Nominal. Gender, Letter Grade, Breakfast Type, Marital Status, and Zip Code can be thought of as labels for a group of items or individuals. Hence, these are categorical.
  -  Gender, Marital Status, Zip Code and your Breakfast items are nominal variables where there is no order ranking associated with this type of data. Whether you ate cereal, toast, eggs, or only coffee for breakfast; there is no rank ordering associated with your breakfast.
  - Letter Grade or Survey Ratings have a rank ordering associated with it, as ordinal data. If you receive an A, this is higher than an A-. An A- is ranked higher than a B+, and so on... Ordinal variables frequently occur on rating scales from very poor to very good. 
You should have now mastered what types of data in the world around us falls into each of these four buckets: Discrete, Continuous, Nominal, and Ordinal. In the next sections, we will work through the numeric summaries that relate specifically to quantitative variables. 




## Variables and Notations
- Capital letter represents the random variable
- lowercase letter represent the observations of rv.


# Quantitative variables
- Center
- Spread
- Shape
- Outliers

## Measure Center

Whether we use the mean or median to describe a dataset is largely dependent on the shape of our dataset and if there are any outliers.

1. Median 
 - The median splits our data so that 50% of our values are lower and 50% are higher. We found in this video that how we calculate the median depends on if we have an even number of observations or an odd number of observations. 
 - Median for Odd Values
   - If we have an odd number of observations, the median is simply the number in the direct middle. For example, if we have 7 observations, the median is the fourth value when our numbers are ordered from smallest to largest. If we have 9 observations, the median is the fifth value. 
 - Median for Even Values
   - If we have an even number of observations, the median is the average of the two values in the middle. For example, if we have 8 observations, we average the fourth and fifth values together when our numbers are ordered from smallest to largest. 
 - In order to compute the median we **MUST sort** our values first. 
 
2. Mode
- The mode is the most frequently observed value in our dataset. There might be multiple modes for a particular dataset, or no mode at all. 
- No Mode. If all observations in our dataset are observed with the same frequency, there is no mode. If we have the dataset:

  - 1, 1, 2, 2, 3, 3, 4, 4
  - There is no mode, because all observations occur the same number of times.

- Many Modes. If two (or more) numbers share the maximum value, then there is more than one mode. If we have the dataset:
  - 1, 2, 3, 3, 3, 4, 5, 6, 6, 6, 7, 8, 9
  - There are two modes 3 and 6, because these values share the maximum frequencies at 3 times, while all other values only appear once. 
3. Mean
- Obvious

## Spread
---
Measures of Spread are used to provide us an idea of how spread out our data are from one another. Common measures of spread include:

Calculating the 5 Number Summary

The five number summary consist of 5 values:

    Minimum: The smallest number in the dataset.
    Q1\bold{Q_1}Q1​: The value such that 25% of the data fall below.
    Q2\bold{Q_2}Q2​: The value such that 50% of the data fall below. (Median)
    Q3\bold{Q_3}Q3​: The value such that 75% of the data fall below.
    Maximum: The largest value in the dataset.

- Range
  - The range is then calculated as the difference between the maximum and the minimum. 
- Interquartile Range (IQR)
  - The interquartile range is calculated as the difference between Q3\bold{Q_3}Q3
- Standard Deviation
- Variance


## Shape
---
We learned how to build a histogram in this video, as this is the most popular visual for quantitative data.

1. Right-skewed
- Mean greater than Median
- Amount of drug remaining in a blood stream, Time between phone calls at a call center, Time until light bulb dies
2. Left-skewed
- Mean less than Median
- Grades as a percentage in many universities, Age of death, Asset price changes
3. Symmetric (frequently normally distributed)
- Mean equals Median
- Height, Weight, Errors, Precipitation

## Outliers
---
When outliers are present we should consider the following points.

1. Noting they exist and the impact on summary statistics.

2. If typo - remove or fix

3. Understanding why they exist, and the impact on questions we are trying to answer about our data.

4. Reporting the 5 number summary values is often a better indication than measures like the mean and standard deviation when we have outliers.

5. Be careful in reporting. Know how to ask the right questions.

## Descriptive vs. Inferential Statistics
---
- Descriptive Statistics
  - Descriptive statistics is about describing our collected data using the measures discussed throughout this lesson: measures of center, measures of spread, shape of our distribution, and outliers. We can also use plots of our data to gain a better understanding.
- Inferential Statistics
  - Inferential Statistics is about using our collected data to draw conclusions to a larger population. 
  - Performing inferential statistics well requires that we take a sample that accurately represents our population of interest. A common way to collect data is via a survey. However, surveys may be extremely biased depending on the types of questions that are asked, and the way the questions are asked. This is a topic you should think about when tackling the first project.
  -  5 elements:
       1. Population - our entire group of interest.
       2. Parameter - numeric summary about a population
       3. Sample - subset of the population
       4. Statistic - numeric summary about a sample

## Simpson's Paradox
Be careful of the data you used. Sometimes, you may even get an opposite conclusion. 


# Probability


## Binomial Distribution
${\displaystyle f(k,n,p)=\Pr(k;n,p)=\Pr(X=k)={\binom {n}{k}}p^{k}(1-p)^{n-k}}$
for k = 0, 1, 2, ..., n, where
${\displaystyle {\binom {n}{k}}={\frac {n!}{k!(n-k)!}}}{\displaystyle {\binom {n}{k}}={\frac {n!}{k!(n-k)!}}}$


## Bayes Theorem

Proior Probability +(*) test --> Posterior probability