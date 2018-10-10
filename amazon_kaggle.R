setwd("E:/College stuff/SEM 2/Machine Learning/Kaggle/Amazon employee access")
train_a<-read.csv("train.csv")
test_a<-read.csv("test.csv")

library(rpart)
library(rattle)
library(BBmisc)
library(e1071)
library(class)
library(randomForest)
library(adabag)

names(train_a)
str(train_a)
train_a$ACTION<-as.factor(train_a$ACTION)

# Decision tree

model_a<-rpart(ACTION~.,data=train_a)
test_a$action_dt<-predict(model_a,test_a,type="class")  

#####################################################################

# Random Forest

mtry<-round(sqrt(length(colnames(train_a))-1))
model_rf<-randomForest(ACTION~.,data=train_a,mtry=mtry)
test_a$action_rf<-predict(model_rf,test_a)
head(test_a$action_rf)

df_a<-data.frame(test_a$id)
df_a<-cbind(df_a,test_a$action_rf)
head(df_a)
colnames(df_a)<-c("Id","Action")
View(df_a)
write.csv(df_a,file="E:/College stuff/SEM 2/Machine Learning/Kaggle/Amazon employee access/subm1.csv",row.names = FALSE)


##########################################################
