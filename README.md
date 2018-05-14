# Final Project

## Project Description
The data that we will use is The Food Balance Sheet csv file that is available to download from kaggle.com. According to the Kaggle summary:
“This dataset provides an insight on our worldwide food production - focusing on a comparison between food produced for human consumption and feed produced for animals. The Food and Agriculture Organization of the United Nations provides free access to food and agriculture data for over 245 countries and territories, from the year 1961 to the most recent update (depends on the dataset). One dataset from the FAO's database is the Food Balance Sheets. It presents a comprehensive picture of the pattern of a country's food supply during a specified reference period, the last time an update was loaded to the FAO database was in 2013. The food balance sheet shows for each food item the sources of supply and its utilization. This chunk of the dataset is focused on two utilizations of each food item available:
Food - refers to the total amount of the food item available as human food during the reference period.
Feed - refers to the quantity of the food item available for feeding to the livestock and poultry during the reference period.”
Our data set was gathered and prepared by the Food and Agriculture Organization of the United Nations.
Our target audience is the anyone who may have interest in factory farming and/or animal agricultural from the general public. We will be writing our report at a level that the average person can understand. However, within the general public, there are specific groups that may find particular interest in our data, such as farmers, nutritionists, food and feed purchasers, agricultural scientists, and more.
There are three specific questions our audience will learn from our data:
Interesting outliers and potential explanations for causes to those outliers
What are the fastest growing countries in terms of food production/consumption?
What is the difference between food and feed consumption?


## Technical Description

3) We will be using several libraries to wrangle the data and make sure we can present our findings in a presentable manner. The first library we will be using is **dplyr**.  Also, we will use **ggplot2** to plot our data and have it be interactive. Furthermore, we will use **shiny** to let users interact with our findings.  

4) I believe it will be hard to find the *features that we will let users filter on*. This will entirely depend on what kinds of information we are trying to convey. Since we can derive many different insights from this large dataset, we will have to spend some time agreeing upon the **best approach**. Another aspect that could cause some problems is how exactly we want to present each insight. Since our dataset has a lot of location specific data, displaying an interactive map could make sense, but if we cannot derive much information from it then it would be pointless.  
