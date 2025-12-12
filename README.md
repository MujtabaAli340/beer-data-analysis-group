
# Beer Consumption and Temperature Analysis

## Project Overview

This project analyses the relationship between temperature and beer consumption in Sao Paulo, Brazil, using daily data from 2015. The aim of the study is to understand whether changes in temperature are associated with variations in beer consumption. The analysis supports a university group assignment for the module 7COM1079 and focuses on statistical testing and data visualisation using R.

## Research Question

Is there a correlation between beer consumption and average temperature in Sao Paulo, Brazil?

## Dataset Description

The dataset contains 365 observations, representing one full year of daily records. The main variables used in this analysis include:

- Maximum temperature in degrees Celsius  
- Average temperature in degrees Celsius  
- Beer consumption measured in litres  

The data was collected in Sao Paulo, Brazil, in areas with high student activity and social events.

## Methods and Analysis

The analysis was carried out using R. The following methods were applied:

- Data cleaning and numeric conversion
- Scatter plots to visualise the relationship between temperature and beer consumption
- Pearson correlation test to assess the strength and direction of the relationship
- Linear regression to model beer consumption as a function of temperature
- Histograms to examine the distribution of temperature and beer consumption
- Frequency distribution with a fitted normal curve
- Contingency table using binned temperature and consumption levels

The Pearson correlation test was chosen because both variables are continuous and approximately normally distributed.

## Key Findings

The Pearson correlation test showed a strong positive correlation between temperature and beer consumption. The p value was less than 0.05, indicating statistical significance. The linear regression model confirmed that beer consumption increases as temperature rises. These results support the alternative hypothesis that higher temperatures are associated with increased beer consumption.

## Files in This Repository

- Analysis.R  
  Main R script used for data cleaning, analysis, statistical testing, and visualisation.

- Beer.csv 
  Dataset used for the analysis.

- README.md  
  Project documentation and explanation.

## How to Run the Code

1. Open R or RStudio.
2. Set the working directory to the folder containing the files.
3. Run the following commands:

```r
setwd("path_to_your_folder")
source("Analysis.R")
```

4. The script will generate all statistical outputs and graphs automatically.

## Requirements

- R version 4.0 or later
- No additional packages are required

## Authors

Group Project for 7COM1079  
Beer Data Analysis Group

## Academic Use

This repository is created for educational purposes only as part of a university coursework submission.
