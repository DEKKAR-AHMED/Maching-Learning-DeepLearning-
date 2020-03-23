# PCA 
dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Dimentionality reduction/K-PCA/Social_Network_Ads.csv")
dataset= dataset[,3:5]
#splitting the data 
library(caTools)
set.seed(123)
split = sample.split(dataset$Purchased,SplitRatio = 0.80)
training_set = subset(dataset,split=TRUE)
test_set = subset(dataset,split=FALSE)

# feature Scalling 
training_set[,1:2] = scale(training_set[,1:2])
test_set[,1:2] = scale(test_set[,1:2])


# Appliying Kernel PCA
library(kernlab)

# delete the target variable cause we work in unsupervised model 
kernel_oca = kpca(~.,training_set[-3],kernel="rbfdot",features=2)

training_set_pca = as.data.frame(predict(kernel_oca,training_set))
training_set_pca$Purchased = training_set$Purchased

test_set_pca = as.data.frame(predict(kernel_oca,test_set))
test_set_pca$Purchased = test_set$Purchased


# fitting logistic regression to training set 
# to be completed 

