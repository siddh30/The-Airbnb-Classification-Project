#install.packages('tidyverse')
library(ggplot2)
library(data.table)
library(tidyverse)
data <- fread("/Users/tianchenyu/Desktop/airbnb-recruiting-new-user-bookings/train_users_2.csv")
data <- as.data.frame(data)
boxplot(data$age)
#outlier
remove_outliers <- function(x, na.rm = TRUE, ...) {
  qnt <- quantile(x, probs=c(.25, .75), na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
}
data$age <- remove_outliers(data$age)
# age
ggplot(data,aes(age))+
  geom_histogram(bins=50)+
  theme_bw()

# app
signup_app <- table(data$signup_app) %>%
  as.data.frame()
ggplot(signup_app,aes(Var1,Freq,fill=Var1))+
  geom_bar(stat="identity")+
  theme_bw()+
  theme(legend.position = "none")+
  xlab("signup app")
#
ggplot(data,aes(age,signup_flow))+
  geom_point()
gender <- table(data$country_destination,data$gender) %>%
  as.data.frame()

ggplot(gender,aes(Var2,Freq))+
  geom_bar(stat="identity")+
  facet_wrap(~Var1)+
  theme_bw()+
  theme(axis.text.x = element_text(angle=90))+
  xlab("Gender")

