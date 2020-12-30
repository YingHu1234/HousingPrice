
<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.pinimg.com/564x/ca/20/27/ca2027c1708162d1027ade48b7e92505.jpg"></a>
</p>


<h3 align="center">:melon: :sunny:  Housing Price :seedling:</h3>


<p align="center">🌺 The real estate agents or companies help their clients with buying or selling homes. The clients or end consumers may want to buy a house for living or as an investment. For consumers who are buying their first house or a retirement house, one wants to know how much to money to earn or save for the house? For home owner interested in selling, one wants know how much money will a home go for? For a real estate agent or agency, one wants to know how much commission to expect. Therefore predicting housing prices is beneficial to the above stakeholders. 
    <br> 
</p>

## 📝 Table of Contents

+ [Summary](#Summary)
+ [Visualization](#PowerBI)
+ [Web Scraping and SQL](#webScraping_SQL)
+ [Time Series Analysis ](#TimeSeries)
+ [TS: ](#about)
+ [Conclusion](#conclusion)


## 🧐 Summary <a name = "Summary"></a>
This summary summarizes the steps of getting the forecast by utilizing time series analysis. The first step was to apply the predictability test for the data set. The second step was to process the partition and apply it into one-level forecast models to test which model has the best fit and less overfitting. The third step was to check the performance. The last step was to choose the top two models with the highest accuracy and apply these models to the entire dataset to predict the numbers for the next periods. 

<img src="https://media.giphy.com/media/xULW8JcEC9HUrJjHB6/giphy.gif" width="400" />

### Prerequisites

Power BI, SQL, Python or Jupyter Notebook, R


## 💭 Visualization <a name = "PowerBI"></a>

Used Power BI to visualize the overall housing prices from 2007 to 2019:

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/PB_1.PNG)


## 🎈 Web Scraping and SQL <a name = "webScraping_SQL"></a>

Used Python and SQL for web scraping：

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_1.PNG)

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_2.PNG)

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_3.PNG)

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_4.PNG)
![test image size](https://github.com/YingHu1234/HousingPrice/blob/main/img/Py_4.PNG){:height="700px" width="400px"}

Used SQL to restructure a table for time series analysis

![image](https://github.com/YingHu1234/HousingPrice/blob/main/img/SQL_1.PNG)


## ✨ Time Series Analysis <a name = "TimeSeries"></a>

Read document from SQL table and checked the category:


![image](https://github.com/YingHu1234/store_products/blob/master/img/1.PNG)


![image](https://github.com/YingHu1234/store_products/blob/master/img/2.PNG)


![image](https://github.com/YingHu1234/store_products/blob/master/img/3.PNG)


Used 6 Classification models for accuracy test, and DT had the highest accuracy since there were 71 mistakes. 

1. Logistic Regression
2. Decision Tree(DT)
3. K neighbors classifier (KNN)
4. Linear Discrininant Analysis (LDA)
5. Gaussian Naive Bayes(GNB)
6. SVC

![image](https://github.com/YingHu1234/store_products/blob/master/img/4.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/5.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/6.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/7.PNG)

<img src="https://github.com/YingHu1234/store_products/blob/master/img/7.PNG" width="200" />

## 🚀 Decision Tree Regression <a name = "dt_regression"></a>

Used DT Regression for revenue prediction:

a. Tested accuracy: the errors were very low, which meant the model was good.
b. For model categores: 
    1--> Bikes
    2--> Components (No sales in 2017）
    3--> Clothing
    4--> Accessories
c. for example: if category is 3, qty is 2, cost is 4.5, price is 6.00, revenue would be 6.25 . shape(1,4)--> 1 observation and 4 features you need to input. 

![image](https://github.com/YingHu1234/store_products/blob/master/img/DTR2.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/DTR3.PNG)




## 🎉 Conclusion <a name = "Conclusion"></a>

In conclusion,  it is very important to figure out the label and features in classification. Also, testing a model's accuracy is necessary before applying it to a model for prediction. This prediction can help set up the selling price for increasing revenue. 
