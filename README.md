
<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.pinimg.com/564x/ca/20/27/ca2027c1708162d1027ade48b7e92505.jpg"></a>
</p>


<h3 align="center">:melon: :sunny:  Housing Price :seedling:</h3>


<p align="center">🌺 The real estate agents or companies help their clients with buying or selling homes. The clients or end consumers may want to buy a house for living or as an investment. For consumers who are buying their first house or a retirement house, one wants to know how much to money to earn or save for the house? For home owner interested in selling, one wants know how much money will a home go for? For a real estate agent or agency, one wants to know how much commission to expect. Therefore predicting housing prices is beneficial to the above stakeholders. 
    <br> 
</p>

# 📝 Table of Contents

+ [Summary](#Summary)
+ [Visualization](#PowerBI)
+ [Web Scraping and SQL](#webScraping_SQL)
+ [Time Series Analysis ](#TimeSeries)
+ [TS: ](#about)
+ [Conclusion](#conclusion)


# 🧐 Summary <a name = "Summary"></a>
This summary summarizes the steps of getting the forecast by utilizing time series analysis. The first step was to apply the predictability test for the data set. The second step was to process the partition and apply it into one-level forecast models to test which model has the best fit and less overfitting. The third step was to check the performance. The last step was to choose the top two models with the highest accuracy and apply these models to the entire dataset to predict the numbers for the next periods. 

<img src="https://media.giphy.com/media/xULW8JcEC9HUrJjHB6/giphy.gif" width="400" />

### Prerequisites

Power BI, SQL, Python or Jupyter Notebook, R


# 💭 Visualization <a name = "PowerBI"></a>

Used Power BI to visualize the overall housing prices from 2007 to 2019:

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/PB_1.PNG)


# 🎈 Web Scraping and SQL <a name = "webScraping_SQL"></a>

Used Python and SQL for web scraping：

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_1.PNG" width="700" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_2.PNG" width="700" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_3.PNG" width="700" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_4.PNG" width="600" />

Used SQL to restructure a table for time series analysis

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/SQL_1.PNG" width="600" />


## ✨ Step 1: Installed package and ran Time Series:<a name = "Installed"></a>

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_1.PNG" width="500" />

### check the trends and seasonality: 
The pattern can be visualizaed as nonlinear upward trend and seasonality with the low sales at the beginning, middle and end of each year.


<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_2.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_3.PNG" width="500" />


# 🚀Test Predictability <a name = "Predictability"></a>

## Approach 1: Use Arima() function to fit the AR(1) model for 4-bedroom house sales. The ARIMA model of order = c(1,0,0) gives an AR(1) model.

The coefficient we got is less than 1. This random walk hypothesis means that
house market prices do not evolve according to a random walk and thus can be
predicted. 


<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_4.PNG" width="500" />

## Approach 2: Apply ACF for differenced prices data (lag-1).

The ACF plot indicates that the autocorrelation coefficients at lag 1 and lag 12
are out of the horizontal threshold, which can be inferred that time series is not
random walk.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_5.PNG" width="500" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_6.PNG" width="500" />

### Result:
Predictability tests of Approach 1 and 2 indicate that this time series of data is
predictable. 

# 🚀 Models testing: Level-one <a name = "1_level"></a>

## Partition and found out the best fit models: 
### Need to satisfy both conditions: 1. R-sq and Adj-sq--> good fit--> close to 1; 2. P value--> statistical significant --> close to 0

In regression model with linear trend model, p-value is less than 0.05, R-squared is 0.74. It is a good fit and
statistically significant.
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_7.PNG" width="500" />

In regression model with quadratic trend, p-value is less than 0.05, R-squared is 0.82. It is a good fit and
statistically significant.
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_8.PNG" width="500" />

In regression model with seasonality, P-value is bigger than 0.05, R-squared is as low as 0.05. This model is not a
good fit. 
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_9.PNG" width="500" />

In regression model with linear trend and seasonality, p-value is less than 0.05, R-squared is 0.78. This model is not a
good fit. 
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_10.PNG" width="500" />

In regression model with quadratic trend and seasonality, p-value is less than 0.05, R-squared is 0.86. This model is not a
good fit. 
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_11.PNG" width="500" />

Trained ARIMA models:
AR(1) model:

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_12.PNG" width="500" />

AR(2) model:

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_13.PNG" width="500" />

Seasonal ARIMA:

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_14.PNG" width="500" />

Auto ARIMA:

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_15.PNG" width="500" />


### Evaluate and Compare Performance: chose the lowest RMSE and MAPE---> best performance
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_16.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_17.PNG" width="500" />

### Result:
AR(1), seasonal ARIMA, and auto ARIMA all have lowest MAPE and RMSE; however, Naive model is still the best. 
In order to find out if there were other models that would get better results than the naïve model, we checked if there's any pattern in the residuals not incorporated by those 1-level models using ACF function. 


# 🚀 Models testing: Level-two <a name = "2_level"></a>

### check residuals for each Level-one models:

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_18.PNG" width="500" />

Seasonality not included, and several autocorrelations out of the threshold, which
means the regression model with linear trend does not capture all data patterns. 

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_19.PNG" width="500" />

Seasonality is close to the threshold, which indicates the model with linear trend
and seasonality may well cover the seasonality. However, there’s still a lot of
correlation not incorporated.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_20.PNG" width="500" />

AR(2) model doesn’t catch the pattern of seasonality. There’s correlation significant at lag 2 not included.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_21.PNG" width="500" />


This plot indicates the auto ARIMA model well captured the training dataset’s pattern.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_22.PNG" width="500" />






## 🎉 Conclusion <a name = "Conclusion"></a>

In conclusion,  it is very important to figure out the label and features in classification. Also, testing a model's accuracy is necessary before applying it to a model for prediction. This prediction can help set up the selling price for increasing revenue. 
