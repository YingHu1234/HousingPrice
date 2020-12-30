
<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="https://i.pinimg.com/564x/ca/20/27/ca2027c1708162d1027ade48b7e92505.jpg"></a>
</p>


<h3 align="center">:melon: :sunny:  Housing Price :seedling:</h3>


<p align="center">🌺 The real estate agents or companies help their clients with buying or selling homes. The clients or end consumers may want to buy a house for living or as an investment. For consumers who are buying their first house or a retirement house, one wants to know how much to money to earn or save for the house? For home owner interested in selling, one wants know how much money will a home go for? For a real estate agent or agency, one wants to know how much commission to expect. Therefore predicting housing prices is beneficial to the above stakeholders. 
    <br> 
</p>

## 📝 Table of Contents
+ [About](#about)
+ [Product Details](#product_details)
+ [SQL_Join](#join)
+ [Accuracy for Classification model](#classification_model)
+ [Decision Tree Regression ](#dt_regression)
+ [Conclusion](#conclusion)


## 🧐 About <a name = "about"></a>
To check how the sales and revenue of each product, Power BI would be used for drilling down the specific tables of products for monthly insights details inspection. 
Also, SQL joined some of the tables and got the cost and profit for classification and regression modeling purposes. 
Lastly, processed accuracy testing and prediction by using Python scripts.

![Working](https://media.giphy.com/media/20NLMBm0BkUOwNljwv/giphy.gif)


### Prerequisites

Power BI, SQL, Python or Jupyter Notebook, R


## 💭 Product Details <a name = "product_details"></a>

Used Power BI to connect each table for monthly details:

![image](https://github.com/YingHu1234/store_products/blob/master/img/BI1.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/BI2.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/BI3.PNG)

## 🎈 SQL-->Join tables <a name = "join"></a>

Used SQL to join tables and get the cost and revenue by aggregation for 2017 sales:

![image](https://github.com/YingHu1234/store_products/blob/master/img/SQL1.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/SQL2.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/SQL3.PNG)

![image](https://github.com/YingHu1234/store_products/blob/master/img/SQL4.PNG)


## ✨ Accuracy for Classification model <a name = "classification_model"></a>

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
