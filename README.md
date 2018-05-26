# Final Project

The link to the hosted shiny application can be found **[here](https://namanzam.shinyapps.io/Food-By-Country/)**.

## Project Description
The data that we will use is [The Food Balance Sheet](https://www.kaggle.com/dorbicycle/world-foodfeed-production) csv file that is available to download from Kaggle.com. According to the Kaggle summary:

“This dataset provides an insight on our worldwide food production - focusing on a comparison between food produced for human consumption and feed produced for animals. The Food and Agriculture Organization of the United Nations provides free access to food and agriculture data for over 245 countries and territories, from the year 1961 to the most recent update (depends on the dataset). One dataset from the FAO's database is the Food Balance Sheets. It presents a comprehensive picture of the pattern of a country's food supply during a specified reference period, the last time an update was loaded to the FAO database was in 2013. The food balance sheet shows for each food item the sources of supply and its utilization. This chunk of the dataset is focused on two utilizations of each food item available:

  * **Food** - refers to the total amount of the food item available as human food during the reference period.
  * **Feed** - refers to the quantity of the food item available for feeding to the livestock and poultry during the reference period.”

Our data set was gathered and prepared by the Food and Agriculture Organization of the United Nations.

Our target audience is anyone from the general public who may have interest in factory farming and/or animal agriculture. We will be writing our report at a level that the average person can understand. However, within the general public, there are specific groups that may find particular interest in our data, such as farmers, nutritionists, food and feed purchasers, agricultural scientists, and more. We will also track trends that may be helpful for government organizations.

There are three specific questions our audience will learn from our data:
1. Interesting outliers and potential causes
2. What are the fastest growing countries in terms of food production/consumption?
3. What is the difference between food and feed consumption?


## Technical Description

We will be using a static **.csv** file that we sourced from Kaggle.com. We will read the FAO.csv file into our analysis.R file to clean and prepare the data for analysis.

As the purpose of this project is to be able to demonstrate and give a perspective onto the amount of food and feed production comparatively by country, much of the data wrangling required includes selecting and comparing two or more options. When *two countries are selected by the user, we need to be able to take those two selections and subtract the amount of feed or food produced to show the difference in production*. That being said, the two types of product types require us to take the initial data set and create two data sets with their respective product types for easier and more coherent data wrangling.  From there we can also sift through and combine like product items such as wheat, alcohol, dairy, etc. with the group_by function. This is used to then create graphs such as maps and data trends over the course of a decade. We will most likely have to reformat the csv file to clear out unnecessary data and add or remove columns to help smooth out our coding.

In summary we need to be able to *group and select different inputs that are made available to the user* and input those selected values into functions that produce the outcomes we want to display. Examples: amounts of food shared, shift in produce across time series, locations with most product type, etc. Outliers are also used to show the significance and extremities of this data set. Our team will create functions and applications that analyze inputted and existing data to show trends, visualizations, and differences in international food and feed balances.  

We will be using several libraries to wrangle the data and make sure we can present our findings in an interactive and understandable manner. Among common libraries, we will also use **ggplot2** to plot our data and **shiny** to let users interact with our findings.  

One challenge we anticipate includes defining the *features that we will let users filter*. This will entirely depend on what kind of information we are trying to convey. Since we can derive many different insights from this large dataset, we will have to spend time agreeing upon the **best approach**. Another aspect that could cause some problems is how exactly we want to present each insight. Since our dataset has a lot of location specific data (using longitude and latitude), displaying an interactive map could make sense, but if it does not convey the information as clearly as a bar chart, scatter plot, or some other sort of visualization, then we will have to consider the potential sacrifice between aesthetics and functionality. As with any project there is the risk of team dynamic challenges or running into general R problems, but we are prepared to communicate clearly with each other and use all of the resources available to us like Stack Overflow, our R textbook, skills from previous assignments, TA/professor help, and the internet in general to solve programming blocks we may encounter.   
