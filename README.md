# The Airbnb Classification Project

<p align = "center"><img width="700" img height="300" src=https://github.com/siddh30/The-Airbnb-Classification-Project/blob/master/logo.jpg> </p>

In this kaggle challenge by Airbnb, we are provided with  a list of users along with their demographics, web session records, and some summary statistics. We were asked to predict which country a new user's first booking destination will be. 

There are 12 possible outcomes of the destination country: 'US', 'FR', 'CA', 'GB', 'ES', 'IT', 'PT', 'NL','DE', 'AU', 'NDF' (no destination found), and 'other'. Please note that 'NDF' is different from 'other' because 'other' means there was a booking, but is to a country not included in the list, while 'NDF' means there wasn't a booking.

The training and test sets are split by dates. In the test set, you will predict all the new users with first activities after 7/1/2014 (note: this is updated on 12/5/15 when the competition restarted). In the sessions dataset, the data only dates back to 1/1/2014, while the users dataset dates back to 2010. 

## File descriptions

* train_users.csv - the training set of users
* test_users.csv - the test set of users
  * id: user id
  * date_account_created: the date of account creation
  * timestamp_first_active: timestamp of the first activity, note that it can be earlier than date_account_created or date_first_booking because a user can search before signing up
  * date_first_booking: date of first booking
  * gender
  * age
  * signup_method
  * signup_flow: the page a user came to signup up from
  * language: international language preference
  * affiliate_channel: what kind of paid marketing
  * affiliate_provider: where the marketing is e.g. google, craigslist, other
  * first_affiliate_tracked: whats the first marketing the user interacted with before the signing up
  * signup_app
  * first_device_type
  * first_browser
  * country_destination: this is the target variable you are to predict
* sessions.csv - web sessions log for users
  * user_id: to be joined with the column 'id' in users table
  * action
  * action_type
  * action_detail
  * device_type
  * secs_elapsed
* countries.csv - summary statistics of destination countries in this dataset and their locations
* age_gender_bkts.csv - summary statistics of users' age group, gender, country of destination
* sample_submission.csv - correct format for submitting your predictions.

## Our Approach to this project
We have performed binary as well multi-classifictaion on this project in R.
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
