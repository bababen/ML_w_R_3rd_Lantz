##### Machine Learning with R (3rd Edition) by Brett Lantz

#### Chapter 2: Managing and Understanding Data

### Exploring and understanding data

## Example using NHANES data

# Pull out 5 variables from the NHANES dataset

age = NHANES::NHANES$Age
weight = NHANES::NHANES$Weight
height = NHANES::NHANES$Height
income = NHANES::NHANES$HHIncomeMid
bmi = NHANES::NHANES$BMI_WHO

# Put them in a dataframe

nhanes_data = data.frame(age,weight,height,income,bmi)

# Remove NA's

nhanes_data = na.omit(nhanes_data)

# check structure of NHANES data
str(nhanes_data)

## Exploring numeric variables -----

# summarize numeric variables
summary(nhanes_data$age)
summary(nhanes_data[c("weight","height")])

# calculate the mean income

mean(nhanes_data$income)

# the median income
median(nhanes_data$income)

# the min/max of weight
range(nhanes_data$weight)

# the difference of the range
diff(range(nhanes_data$weight))

# IQR for weight
IQR(nhanes_data$weight)

# use quantile to calculate five-number summary
quantile(nhanes_data$weight)

# the 99th percentile
quantile(nhanes_data$weight,probs = c(0.01, 0.99))

# quintiles
quantile(nhanes_data$weight, seq(from = 0, to = 1, by = 0.20))

# boxplot of human weight and age

boxplot(nhanes_data$weight, main="Boxplot of Human Weight",
      ylab="Weight (Lbs)")

boxplot(nhanes_data$age, main="Boxplot of Human Age",
      ylab="Age (years)")

# histograms of human weight and age

hist(nhanes_data$weight, main = "Histogram of Human Weight",
     xlab = "Weight (Lbs)")

hist(nhanes_data$age, main = "Histogram of Human Age",
     xlab = "Age (years)")

# variance and standard deviation of the NHANES data

var(nhanes_data$weight)
sd(nhanes_data$weight)
var(nhanes_data$age)
sd(nhanes_data$age)

## Exploring numeric variables -----

# one-way tables for the NHANES data
table(nhanes_data$age)
table(nhanes_data$weight)
table(nhanes_data$height)

# compute table proportions
income_table <- table(nhanes_data$income)
prop.table(income_table)

# round the data
income_pct <- prop.table(income_table) * 100
round(income_pct, digits = 1)

## Exploring relationships between variables -----

# scatterplot of weight vs. age
plot(x = nhanes_data$age, y = nhanes_data$weight,
     main = "Scatterplot of Weight vs. Age",
     xlab = "Human Age (years)",
     ylab = "Human Weight (Lbs.)")

# new variable indicating humans with obesity

nhanes_data$obese <-
  nhanes_data$bmi %in% c("30.0_plus")

# new variable indicating humans with high income

nhanes_data$rich <-
  nhanes_data$income %in% c("100000")

# checking our variable
table(nhanes_data$obese)
table(nhanes_data$rich)

table(nhanes_data$obese,nhanes_data$rich)

table(nhanes_data$obese,nhanes_data$income)

# Crosstab of obese by income
library(gmodels)
CrossTable(x = nhanes_data$obese, y = nhanes_data$rich)