rm(list=ls())

Airbnb <- read.csv("/Users/tianchenyu/Desktop/df_final.csv",
                  colClasses=c("id"="factor","gender"="factor","age"="factor",
                               "signup_method"="factor","signup_flow"="factor","language"="factor",
                               "affiliate_channel"="factor","affiliate_provider"="factor","first_affiliate_tracked"="factor",
                               "signup_app"="factor","first_device_type"="factor","first_browser"="factor",
                               "dac_year"="factor","dac_month"="factor","dac_day"="factor",
                               "tfa_year"="factor","tfa_month"="factor","tfa_day"="factor","US"="factor"))

index <-seq(1, nrow(Airbnb), by = 5)
test <- Airbnb[index,]
train <- Airbnb[-index,]

library(class) 
library(e1071)

nBayes <- naiveBayes(factor(US)~ gender+age+language+dac_year+tfa_year, data =train)
category<-predict(nBayes,test)
table(NBayes=category,US=test$US)
NB_wrong<-sum(category!=test$US )
NB_error_rate<-NB_wrong/length(category)
NB_error_rate

