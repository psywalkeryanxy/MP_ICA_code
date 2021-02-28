#xinyuanyan
#bnu
#xinyuanyan2016@gmail.com

library("e1071")


#now,xinyuan would begin her own data classification
setwd('E:/19_MP/19_WRITING/2_RESULTS_FOR_PAPER_ICA/4_svm_dyFNCk4_subcor/batch_svm_r')


#load data
alldata <- read.csv("MP_data_class.csv",stringsAsFactors = TRUE)

attach(alldata)
x<-subset(alldata,select = -group)
y<-group

svm_model1<-svm(group ~ ., data=x, type ='C-classification', kernel='radial',gamma=0.01, cost=5000,cross=10)
summary(svm_model1)

#get the accuracy for each group
testmp<-x
mp_pred <- predict(object = svm_model1, newdata = testmp)
mp_Freq <- table(y, mp_pred)

#write the classified label into new csv and save it as classlabel.csv, for venn diagram further
write.csv(mp_pred,"classlabel.csv")