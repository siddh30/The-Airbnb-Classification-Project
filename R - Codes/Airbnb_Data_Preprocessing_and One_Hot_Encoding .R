remove(list=ls())

library(readr)
library(stringr)

set.seed(1)

# load data
df = read.csv("~/Desktop/airbnb-recruiting-new-user-bookings/train_users_2.csv")
labels = df['country_destination']

#remove date_first_booking
df = df[-c(which(colnames(df) %in% c('date_first_booking')))]
# replace missing values
for(i in 1:ncol(df)){
  df[is.na(df[,i]), i] <- mean(df[,i], na.rm = TRUE)
}

df$age <- as.integer(df$age) 

# split date_account_created in year, month and day
dac = as.data.frame(str_split_fixed(df$date_account_created, '-', 3))
df['dac_year'] = dac[,1]
df['dac_month'] = dac[,2]
df['dac_day'] = dac[,3]
df = df[,-c(which(colnames(df) %in% c('date_account_created')))]

# split timestamp_first_active in year, month and day
df[,'tfa_year'] = substring(as.character(df[,'timestamp_first_active']), 1, 4)
df['tfa_month'] = substring(as.character(df['timestamp_first_active']), 5, 6)
df['tfa_day'] = substring(as.character(df['timestamp_first_active']), 7, 8)
df = df[,-c(which(colnames(df) %in% c('timestamp_first_active')))]





# one-hot-encoding features
ohe_feats = c('country_destination')
dummies <- dummyVars(~ country_destination, data = df)
df_all_ohe <- as.data.frame(predict(dummies, newdata = df))
df_combined <- cbind(df[,-c(which(colnames(df) %in% ohe_feats))],df_all_ohe)

colnames(df_combined)

names(df_combined)[30]<-"US"
names(df_combined)[29]<-"PT"
names(df_combined)[28]<-"Other"
names(df_combined)[27]<-"NL"
names(df_combined)[26]<-"NDF"
names(df_combined)[25]<-"IT"
names(df_combined)[24]<-"GB"
names(df_combined)[23]<-"FR"
names(df_combined)[22]<-"ES"
names(df_combined)[21]<-"DE"
names(df_combined)[20]<-"CA"
names(df_combined)[19]<-"AU"

#Given below is the final dataset
df_final <- df_combined[-c(19:29)]

