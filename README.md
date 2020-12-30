
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
+ [Test Predictability](#Predictability)
+ [Models testing: Level-one ](#1_level)
+ [Models testing: Level-two](#2_level)
+ [Residuals in Two-level models (two methods)](#residuals)
+ [Predict housing price](#price) 
+ [Conclusion](#conclusion)


# 🍯 Summary <a name = "Summary"></a>
This summary summarizes the steps of getting the forecast by utilizing time series analysis. The first step was to apply the predictability test for the data set. The second step was to process the partition and apply it into one-level forecast models to test which model has the best fit and less overfitting. The third step was to check the performance. The last step was to choose the top two models with the highest accuracy and apply these models to the entire dataset to predict the numbers for the next periods. 

<img src="https://media.giphy.com/media/xULW8JcEC9HUrJjHB6/giphy.gif" width="400" />

### Prerequisites

Power BI, SQL, Python or Jupyter Notebook, R


# 🍦 Visualization <a name = "PowerBI"></a>

Used Power BI to visualize the overall housing prices from 2007 to 2019:

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/PB_1.PNG)


# 🍉 Web Scraping and SQL <a name = "webScraping_SQL"></a>

Used Python and SQL for web scraping：

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_1.PNG" width="700" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_2.PNG" width="700" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_3.PNG" width="700" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_4.PNG" width="600" />

Used SQL to restructure a table for time series analysis

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/SQL_1.PNG" width="600" />



# 🎨 Time Series Analysis <a name = "TimeSeries"></a>

###  Installed package and ran Time Series:<a name = "Installed"></a>

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_1.PNG" width="500" />

###  check the trends and seasonality: 
The pattern can be visualizaed as nonlinear upward trend and seasonality with the low sales at the beginning, middle and end of each year.


<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_2.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_3.PNG" width="500" />


## ✨Test Predictability <a name = "Predictability"></a>

### Approach 1: Use Arima() function to fit the AR(1) model for 4-bedroom house sales. The ARIMA model of order = c(1,0,0) gives an AR(1) model.

The coefficient we got is less than 1. This random walk hypothesis means that
house market prices do not evolve according to a random walk and thus can be
predicted. 


<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_4.PNG" width="500" />

### Approach 2: Apply ACF for differenced prices data (lag-1).

The ACF plot indicates that the autocorrelation coefficients at lag 1 and lag 12
are out of the horizontal threshold, which can be inferred that time series is not
random walk.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_5.PNG" width="500" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_6.PNG" width="500" />

#### Result:
Predictability tests of Approach 1 and 2 indicate that this time series of data is
predictable. 

## 🍵 Models testing: Level-one <a name = "1_level"></a>

### Partition and find the best fit models: 
#### Need to satisfy both conditions: 1. R-sq and Adj-sq--> good fit--> close to 1; 2. P value--> statistical significant --> close to 0

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


#### Evaluate and Compare Performance: choose the lowest RMSE and MAPE---> best performance

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_16.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_17.PNG" width="500" />

#### Result:
AR(1), seasonal ARIMA, and auto ARIMA all have lowest MAPE and RMSE; however, Naive model is still the best. 
In order to find out if there were other models that would get better results than the naïve model, we checked if there's any pattern in the residuals not incorporated by those 1-level models using ACF function. 


## 🍲 Models testing: Level-two <a name = "2_level"></a>

#### check residuals for each Level-one models:

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

The correlation at lag 8 is little bit higher than the threshold, which means this seasonal ARIMA model incorporated all patterns for the training dataset. 

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_22.PNG" width="500" />


This plot indicates the auto ARIMA model well captured the training dataset’s pattern.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_37.PNG" width="500" />


## 🍏 Residuals in Two-level models (two methods)<a name = "residuals"></a>

#### used AR(1) for residuals:

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_23.PNG" width="500" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_24.PNG" width="500" />

Seasonality is a little bit out of the threshold. Most correlations captured. 

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_25.PNG" width="500" />

More correlations were incorporated by AR(1) model for residuals of residuals, but there are still three correlations at lag 2, 6 and 9 not captured.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_26.PNG" width="500" />

Seasonality still is not captured, and correlation at lag 2 is not included either.
This may indicate that the AR(1) model for residuals of residuals for AR(2) Model is not ideal.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_27.PNG" width="500" />


#### used Trailing MA for residuals:

After using the rollmean() function to develop three trailing MAs for the window
width of 2, 6, 12, respectively, we applied the accuracy() function to get their
accuracy measurement. 

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_28.PNG" width="500" />

From the accuracy measurements, we see that trailing MAs for the window width
of 12 is the most accurate. Thus we’ll apply trailing MA with k = 12 to forecast
residuals. 

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_29.PNG" width="500" />

Except for the seasonality, all other correlations were captured. 

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_38.PNG" width="500" />



No pattern was left since there’s no correlations out of the threshold. 

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_39.PNG" width="500" />

Seasonality is not totally included, but other correlations were well covered.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_40.PNG" width="500" />


#### Result:
Both the Seasonal ARIMA model and auto ARIMA model well captured all patterns of partitioned data set. 
Regression model with trend,Regression model with trend, AR(2) model--> failed to capture
Therefore, need AR(1) and trailing ma model for residuals. 



### Two-level forecasts:

Two-level models include 6 combinations. The first three are a regression model with linear trend plus AR(1) model for its residuals, regression model with linear trend and seasonality plus AR(1) model for its residuals, AR(2) model plus AR(1) model for its residuals.

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_30.PNG" width="500" />

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_31.PNG" width="500" />


#### Result:
AR(2) model with trailing ma was better. Therefore, choose 3 models with best accuracy for forecasting:
two-level model: AR(2) model+trailing MA residuals
one-level model: Seasonal ARIMA, auto ARIMA


## ☕ Predict housing price <a name = "price"></a>
#### Apply entire data set to those three models to predict the housing price for the future twelve months.  

<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_32.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_33.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_34.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_35.PNG" width="500" />
<img src="https://github.com/YingHu1234/HousingPrice/blob/main/img/R_36.PNG" width="500" />

# 🎉 Conclusion <a name = "Conclusion"></a>

In conclusion, the results from both two forecasting models were quite similar. Both models forecasted a price drop in January 2020, followed with a slow increase in the upcoming two months, and then a drop after March 2020.

