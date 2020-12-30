## USE FORECAST LIBRARY.

# install.packages("forecast")
install.packages('ggfortify')
install.packages('forecast')

library(forecast)
library(ggfortify)
library(zoo)



# Set working directory for locating files.
setwd("C:/Users/wingy/Desktop/TS project/TS")

# read doc
house.data <- read.csv("monthly_house_bed4.csv")



# create time series:
price.ts <- ts(house.data$price, 
                 start = c(2008, 1), end = c(2019, 7), freq = 12)



# check the Autocorrelation:
autocor <- Acf(price.ts, lag.max = 12, main = "Autocorrelation for Housing Price")

# Display autocorrelation coefficients for various lags.
Lag <- round(autocor$lag, 0)
ACF <- round(autocor$acf, 3)
data.frame(Lag, ACF)


# check the trends and seasonality:
monthly.stl <- stl(price.ts, s.window = "periodic")
autoplot(monthly.stl, main = "Housing Time Series Components")




# Part 1:## TEST PREDICTABILITY (two approaches)

# a. approach1: AR(1)

# Use Arima() function to fit AR(1) model.
# The ARIMA model of order = c(1,0,0) gives an AR(1) model.
monthly.ar1<- Arima(price.ts, order = c(1,0,0))
summary(monthly.ar1)# Coefficients is 0.0422 which is smaller than 1. 
#it is predictable, if close to 1, need to use approach 2. most of the time we always use both togther. 




# b. approach2: lag-1

# Create differenced ClosePrice data using (lag-1).
diff.h.price <- diff(price.ts, lag = 1)
diff.h.price
    

# Use Acf() function to identify autocorrealtion for differenced
# ClosePrices and plot autocorrelation for different lags 
# (up to maximum of 12).
## it shows the trend lag 1 and seasonality lag 12 both are significant. 
## Therefore, predictable
Acf(diff.h.price, lag.max = 12, 
    main = "Autocorrelation for Differenced Housing Prices")
#1. if # of lags are more than 6 out of 12, means predictable
#2. if lag #1 and #12 are out of blue threshold, means predictable



# Part 2:## Train all the models and choose the best fit and less overfitting. 
# Need to satisfy both conditions: summary()
# 1. R-sq and Adj-sq--> good fit--> close to 1
# 2. P value--> statistical significant --> close to 0


#a. 
##petition:

nValid <- 12 
nTrain <- length(price.ts) - nValid
train.ts <- window(price.ts, start = c(2008, 1), end = c(2008, nTrain))
valid.ts <- window(price.ts, start = c(2008, nTrain + 1), 
                   end = c(2008, nTrain + nValid))

nValid
nTrain

## linear trend.
train.lin <- tslm(train.ts ~ trend)
# See summary of linear trend model and associated parameters.
summary(train.lin)



##  REGRESSION MODEL WITH QUADRATIC (POLYNOMIAL) TREND: MODEL ii. 
train.quad <- tslm(train.ts ~ trend + I(trend^2))
summary(train.quad)



## FIT REGRESSION MODEL WITH SEASONALITY: MODEL iii.
train.season <- tslm(train.ts ~ season)
summary(train.season)



## FIT REGRESSION MODEL WITH LINEAR TREND AND SEASONALITY: MODEL iv. 
train.lin.season <- tslm(train.ts ~ trend + season)
summary(train.lin.season)



## FIT REGRESSION MODEL WITH QUADRATIC TREND AND SEASONALITY: MODEL v. 
train.quad.season <- tslm(train.ts ~ trend + I(trend^2) + season)
summary(train.quad.season)


#####Arima model:
#AR(1):
train.ar1<-Arima(train.ts,order=c(1,0,0))
summary(train.ar1)

#AR(2):
train.ar2<-Arima(train.ts,order=c(2,0,0))
summary(train.ar2)


# Seasonal Arima
train.arima.seas <- Arima(train.ts, order = c(2,1,2), 
                    seasonal = c(1,1,2)) 
summary(train.arima.seas)

# Auto Arima
train.auto.arima <- auto.arima(train.ts)
summary(train.auto.arima)




## forecast for validation period by each model:
train.lin.pred <- forecast(train.lin, h = nValid, level = 0)
train.quad.pred <- forecast(train.quad, h = nValid, level = 0)
train.sea.pred <- forecast(train.season, h = nValid, level = 0)
train.lin.sea.pred <- forecast(train.lin.season, h = nValid, level = 0)
train.quad.sea.pred <- forecast(train.quad.season, h = nValid, level = 0)
train.ar1.pred <- forecast(train.ar1, h = nValid, level = 0)
train.ar2.pred <- forecast(train.ar2, h = nValid, level = 0)
train.arima.seas.pred <- forecast(train.arima.seas, h = nValid, level = 0)
train.auto.arima.pred <- forecast(train.auto.arima, h = nValid, level = 0)

## Naive model is baseline model, need to use them to compare with other models
train.naive.pred <- naive(train.ts, h = 12)
train.snaive.pred <- snaive(train.ts, h = 12)


## apply accuracy() to check performance measures:
round(accuracy(train.lin.pred, valid.ts), 3)
round(accuracy(train.quad.pred, valid.ts), 3)
round(accuracy(train.sea.pred, valid.ts), 3)
round(accuracy(train.lin.sea.pred, valid.ts), 3)
round(accuracy(train.quad.sea.pred, valid.ts), 3)
round(accuracy(train.ar1.pred, valid.ts), 3)
round(accuracy(train.ar2.pred, valid.ts), 3)
round(accuracy(train.arima.seas.pred, valid.ts), 3)
round(accuracy(train.auto.arima.pred, valid.ts), 3)
round(accuracy(train.naive.pred$mean, valid.ts), 3)
round(accuracy(train.snaive.pred$mean, valid.ts), 3)


#result: AR(1), seasonal ARIMA, and auto ARIMA all have lowest 
# MAPE and RMSE, however, Naive model is still the best. 
# find out if there were other models that would get better results 
# than the naïve model, we checked if there's any pattern in the residuals 
# not incorporated by those 1-level models using ACF function 



# b.
# Level-two model combination
# check residuals for each models:

train.lin.res<-train.lin.pred$residuals
Acf(train.lin.pred$residuals, lag.max=12,
    main='Autocorrelation for train.lin.res 4-bed House Training Residuals')



train.lin.sea.res<-train.lin.sea.pred$residuals
Acf(train.lin.sea.pred$residuals, lag.max=12,
    main='Autocorrelation fortrain.lin.sea.res 4-bed House Training Residuals')



train.ar2.res<-train.ar2.pred$residuals
Acf(train.ar2.pred$residuals, lag.max=12,
    main='Autocorrelation for train.ar2.res 4-bed House Training Residuals')



Acf(train.arima.seas$residuals, lag.max=12,
    main='Autocorrelation of ARIMA(2,1,2)(1,1,2) Model Residuals')



Acf(train.auto.arima$residuals, lag.max=12,
    main='Autocorrelation of Auto ARIMA Model Residuals')



## 2 ways for two-level residuals: 1. AR(1) model, 2. Trailing MA of residuals. 
## user AR(1) model for each model's residuals:
# no seasonal ARIMA and auto ARIMA since they capture residual well.
lin.res.ar1<-arima(train.lin.res,order=c(1,0,0))
summary(lin.res.ar1)

lin.sea.res.ar1<-arima(train.lin.sea.res,order=c(1,0,0))
summary(lin.sea.res.ar1)

ar2.res.ar1<-arima(train.ar2.res, order=c(1,0,0))
summary(ar2.res.ar1)

lin.res.ar1.pred <- forecast(lin.res.ar1, h = nValid, level = 0)
lin.sea.res.ar1.pred <- forecast(lin.sea.res.ar1, h = nValid, level = 0)
ar2.res.ar1.pred <- forecast(ar2.res.ar1, h = nValid, level = 0)

## check the residuals of residuals for training data set, to see if 
# the residuals were cleared and used for forecast or not:


Acf(lin.res.ar1$residuals, lag.max=12,
    main='Autocorrelation for 4-bed House Residuals of Residuals for the Training Data Set')
    
    


Acf(lin.sea.res.ar1$residuals, lag.max=12,
    main='Autocorrelation for 4-bed House Residuals of Residuals for the Training Data Set')





Acf(ar2.res.ar1$residuals, lag.max=12,
    main='Autocorrelation for 4-bed House Residuals of Residuals for the Training Data Set')

##Result:
# both the Seasonal ARIMA model and auto ARIMA model well captured all 
# patterns of partitioned data set. 
# Regression model with trend,Regression model with trend, AR(2) model--> failed to capture
# Therefore, need AR(1) and trailing ma model for residuals. 



## Trailing MA for residuas.

#1. using the rollmean() function to develop three trailing MAs for the window width of 2, 6,
# 12, respectively
ma.trail_2 <- rollmean(train.ts, k = 2, align = "right")
ma.trail_6 <- rollmean(train.ts, k = 6, align = "right")
ma.trail_12 <- rollmean(train.ts, k = 12, align = "right")



train.ma.trail_2 <- c(rep(NA, length(train.ts) - length(ma.trail_2)), ma.trail_2)
train.ma.trail_6 <- c(rep(NA, length(train.ts) - length(ma.trail_6)), ma.trail_6)
train.ma.trail_12 <- c(rep(NA, length(train.ts) - length(ma.trail_12)), ma.trail_12)



#2. use accuracy() to find out which one is the best with lowest
# MAPE and RMSE
round(accuracy(train.ma.trail_2, valid.ts),3)
round(accuracy(train.ma.trail_6, valid.ts),3)
round(accuracy(train.ma.trail_12, valid.ts),3)## the best!


# Utilize the rollmean() function to develop three trailing MAs with window width of
# 12 for the residuals of regression model with linear trend, regression model with
# linear trend and seasonality, and AR(2) model.k=12 will have highest accuracy
ma.trailing.lin.res_12<-rollmean(train.lin.res, k=12, align="right")
ma.trailing.lin.sea.res_12<-rollmean(train.lin.sea.res, k=12, align="right")
ma.trailing.ar2.res_12 <-rollmean(train.ar2.res, k=12, align="right")


# forecast the residuals:
ma.trailing.lin.res_12.pred <- forecast(ma.trailing.lin.res_12, h=nValid, level = 0)
ma.trailing.lin.sea.res_12.pred <- forecast(ma.trailing.lin.sea.res_12, h=nValid, 
                                            level = 0)
ma.trailing.ar2.res_12.pred <- forecast(ma.trailing.ar2.res_12, h=nValid, level = 0)

# After that, let's see if trailing MA captures all patterns of residuals. We use the
# Acf() function to see the residual of residuals for each model. 

Acf(ma.trailing.lin.res_12.pred$residuals, lag.max=12,
    main='Autocorrelation for 4-bed House Residuals of Residuals for the Training Data Set')


##issuess???????
Acf(ma.trailing.lin.sea.res_12.pred$residuals, lag.max=12,
    main='Autocorrelation for 4-bed House Seasonal Residuals of Residuals for the Training Data Set')



Acf(ma.trailing.ar2.res_12.pred$residuals, lag.max=12,
    main='Autocorrelation for 4-bed House Residuals of Residuals for the Training Data Set')




#Two-level forecasts(six models)
#Two-level models include 6 combinations. The first three are a regression model
# with linear trend plus AR(1) model for its residuals, regression model with linear
# trend and seasonality plus AR(1) model for its residuals, AR(2) model plus AR(1)
# model for its residuals
lin.ar.two.level.pred<-train.lin.pred$mean+lin.res.ar1.pred$mean
lin.sea.ar.two.level.pred<-train.lin.sea.pred$mean+lin.sea.res.ar1.pred$mean
ar2.ar.two.level.pred<-train.ar2.pred$mean+ar2.res.ar1.pred$mean


# trailing MA(12) model for its residuals, and AR(2) model plus trailing MA(12) for
# its residuals.

lin.ma.two.level.pred<-train.lin.pred$mean+ma.trailing.lin.res_12.pred$mean
lin.sea.ma.two.level.pred<-train.lin.sea.pred$mean+ma.trailing.lin.res_12.pred$mean
ar2.ma.two.level.pred<-train.ar2.pred$mean+ma.trailing.ar2.res_12.pred$mean


## performance measure for one-level and two -level models:
round(accuracy(train.lin.pred, valid.ts),3)
round(accuracy(train.lin.sea.pred, valid.ts),3)
round(accuracy(train.ar2.pred, valid.ts),3)
round(accuracy(train.arima.seas.pred, valid.ts),3)
round(accuracy(train.auto.arima.pred, valid.ts),3)
round(accuracy(lin.ar.two.level.pred, valid.ts),3)
round(accuracy(lin.sea.ar.two.level.pred, valid.ts),3)
round(accuracy(ar2.ar.two.level.pred, valid.ts),3)
round(accuracy(lin.ma.two.level.pred, valid.ts),3)
round(accuracy(lin.sea.ma.two.level.pred, valid.ts),3)
round(accuracy(ar2.ma.two.level.pred, valid.ts),3)### The best!!
round(accuracy(train.naive.pred$mean, valid.ts),3)
round(accuracy(train.snaive.pred$mean, valid.ts),3)

## Result:
#  AR(2) model with trailing ma was better. 
#  Therefore, choose 3 models with best accuracy for forecasting:
#  two-level model: AR(2) model+trailing MA residuals
#  one-level model: Seasonal ARIMA, auto ARIMA



## Part 3: implement entire/full data set to predict the housing price 
# for the future twelve months. 


ar2<- arima(price.ts,order=c(2,0,0))
summary(ar2)

arima.seas<- arima(price.ts, order=c(2,1,2),seasonal=c(1,1,2))
summary(arima.seas)

auto.arima<-auto.arima(price.ts)
summary(auto.arima)

Acf(ar2$residuals, lag.max=12,
    main="Autocorrelations of AR(2) Model Residuals")

Acf(arima.seas$residuals, lag.max=12,
    main="Autocorrelations of ARIMA(2,1,2)(1,1,2) Model Residuals")


Acf(auto.arima$residuals, lag.max=12,
    main="Autocorrelations of Auto ARIMA Model Residuals")


#forecast:
ar2.pred <- forecast(ar2, h = 12, level = 0)
arima.seas.pred <- forecast(arima.seas, h = 12, level = 0)
auto.arima.pred <- forecast(auto.arima, h = 12, level = 0)


# performance measure: 
# (trailing MA need to use accuracy to check with window is the best for the dataset)
round(accuracy(ma.trail_2,price.ts), 3)## the best! will choose k=2 for trailing MA residuals
round(accuracy(ma.trail_6,price.ts), 3)
round(accuracy(ma.trail_12,price.ts), 3)



# use k=2 for residuals:
ar2.res<-ar2.pred$residuals
ma.trailing.ar2.res_2<-rollmean(ar2.res, k=2, align="right")
ma.trailing.ar2.res_2.pred <- forecast(ma.trailing.ar2.res_2, h=12, level = 0)



# Combine AR(2) model and trailing MA for residuals to forecast for 12 periods into
# the future. Use accuracy() function to identify common accuracy measures of the
# 6 forecasts and compare their MAPE and RMSE.

naive.pred <- naive(price.ts, h = 12)
snaive.pred <- snaive(price.ts, h = 12)

round(accuracy(ar2.pred$fitted,price.ts), 3)
round(accuracy(arima.seas.pred$fitted,price.ts), 3)
round(accuracy(auto.arima.pred$fitted,price.ts), 3)
round(accuracy(ar2.pred$fitted+ma.trailing.ar2.res_2,price.ts), 3)
round(accuracy(naive.pred$fitted,price.ts), 3)
round(accuracy(snaive.pred$fitted,price.ts), 3)


# Forecast the future 12 months using the two most models.
ts.forecast.arima.seas<-arima.seas.pred$mean
ts.forecast.ar2.ma <- ar2.pred$mean+ma.trailing.ar2.res_2.pred$mean
table.df<- data.frame(ts.forecast.arima.seas, ts.forecast.ar2.ma)
names(table.df)<-c("arima.seas.Forecast", "ar2+ma.Forecast")
table.df


