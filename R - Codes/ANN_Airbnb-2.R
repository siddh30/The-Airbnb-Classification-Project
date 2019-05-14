remove(list=ls())
Airbnb <- read.csv("~/Desktop/Airbnb/nb/df_final.csv")
Airbnb<- data.frame(lapply(na.omit(Airbnb),as.numeric))


# Split into training and testing data
index <- seq(1,nrow(Airbnb),by=5)
test <- Airbnb[index,]
training <- Airbnb[-index,]

library("neuralnet")
?neuralnet()
class(training$US)
net_x<- neuralnet((US)~.,training, hidden=10, threshold=0.01)

#Plot neural network
plot(net_x)

ann <-compute(net_x , test[,-19])
ann$net.result 
ann_cat<-ifelse(ann$net.result <1.5,1,2)
length(ann_cat)

#Confusion Matrix
table(Actual=test$US,predition=ann_cat)
wrong<- (test$US!=ann_cat)
error_rate<-sum(wrong)/length(wrong)
error_rate
accuracy <- (1-error_rate)*100
accuracy 


