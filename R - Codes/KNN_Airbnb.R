install.packages("kknn")
rm(list=ls())

Airbnb <- read.csv("~/Desktop/Airbnb/nb/df_final.csv",
                   colClasses=c("id"="factor","gender"="factor","age"="factor",
                                "signup_method"="factor","signup_flow"="factor","language"="factor",
                                "affiliate_channel"="factor","affiliate_provider"="factor","first_affiliate_tracked"="factor",
                                "signup_app"="factor","first_device_type"="factor","first_browser"="factor",
                                "dac_year"="factor","dac_month"="factor","dac_day"="factor",
                                "tfa_year"="factor","tfa_month"="factor","tfa_day"="factor","US"="factor"))

index <-seq(1, nrow(Airbnb), by = 3)
Airbnb <- Airbnb[index,]

index <-seq(1, nrow(Airbnb), by = 5)
test <- Airbnb[index,]
train <- Airbnb[-index,]


library(kknn)
predict <- kknn(factor(US)~ gender+age+signup_method+signup_flow+affiliate_channel+affiliate_provider+first_device_type+first_browser+dac_year+tfa_year+dac_month,train,test,kernel="rectangular", k=10)
fit <- fitted(predict)
table(kknn=fit,test$US)
knn_error_rate=sum(fit!=test$US)/length(test$US)
print(knn_error_rate)
accuracy <- (1-knn_error_rate)*100
accuracy 