
library(randomForest)
Airbnb <- read.csv("~/Desktop/Airbnb/nb/df_final.csv")
set.seed(123)
#dsn2<-na.omit(dsn)
#set.seed(123)

index <-seq(1, nrow(Airbnb), by = 3)
Airbnb <- Airbnb[index,]

index <-seq(1, nrow(Airbnb), by = 5)
test <- Airbnb[index,]
train <- Airbnb[-index,]
train<- train[c(2,3,13,16,19)]
test<-test[c(2,3,13,16,19)]

#train$Reverse <- as.character(train$Reverse)
#train$US <- as.factor(train$US)

x<-randomForest(factor(US)~.,data=test, importance=TRUE, ntree=1000)
importance(x)
varImpPlot(x)
Prediction<-predict(x,test)
table(actual=test[,5],Prediction)

wrong<-(test[,5]!=Prediction)
error_rate<-sum(wrong)/length(wrong)
error_rate
accuracy <- (1-error_rate)*100
accuracy
