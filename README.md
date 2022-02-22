# <div align="center">The Airbnb Classification Project</div>

<p align = "center"><img width="800" img height="350" src=https://github.com/siddh30/The-Airbnb-Classification-Project/blob/master/logo.jpg> </p>

In this kaggle challenge by Airbnb, we are provided with  a list of users along with their demographics, web session records, and some summary statistics. We were asked to predict which country a new user's first booking destination will be. 

There are 12 possible outcomes of the destination country: 'US', 'FR', 'CA', 'GB', 'ES', 'IT', 'PT', 'NL','DE', 'AU', 'NDF' (no destination found), and 'other'. Please note that 'NDF' is different from 'other' because 'other' means there was a booking, but is to a country not included in the list, while 'NDF' means there wasn't a booking.

The training and test sets are split by dates. In the test set, you will predict all the new users with first activities after 7/1/2014 (note: this is updated on 12/5/15 when the competition restarted). In the sessions dataset, the data only dates back to 1/1/2014, while the users dataset dates back to 2010. 


### We have implemented this project in four Stages.
1. Data Visulalisation and Anlaysis of the entire dataset
2. Data preprocessing, which includes using One Hot Encoding to create binary labels for different countries present in the country_destination column.
Out of these newly created variables we have used USA for our binary classification.
3. Implemetation of different models, These include: -
   1) Naive Bayes
   2) K - Nearest Neighbours (KNN)
   3) Artificial Neural Network (ANN)
   4) C50
   5) Random Forest
   6) Xgboost (Extreme Gradient Descent) for multi-classifictaion.
