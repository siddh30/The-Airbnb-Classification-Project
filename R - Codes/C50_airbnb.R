
rm(list=ls())

Airbnb <- read.csv("~/Desktop/Airbnb/nb/df_final.csv")
set.seed(123)
#dsn2<-na.omit(dsn)
#set.seed(123)

index <-seq(1, nrow(Airbnb), by = 5)
Airbnb <- Airbnb[index,]

index <-seq(1, nrow(Airbnb), by = 3)
test <- Airbnb[index,]
train <- Airbnb[-index,]
train<- train[c(2,3,13,16,19)]
test<-test[c(2,3,13,16,19)]

#install.packages("C50", repos="http://R-Forge.R-project.org")
#install.packages("C50")
library('C50')

C50_class <- C5.0( factor(US)~.,data=test )

summary(C50_class )
plot(C50_class)
C50_predict<-predict( C50_class ,test , type="class" )
table(actual=test[,5],C50=C50_predict)
wrong<- (test[,5]!=C50_predict)
c50_rate<-sum(wrong)/length(test[,4])
c50_rate
accuracy <- (1-c50_rate)*100
accuracy



