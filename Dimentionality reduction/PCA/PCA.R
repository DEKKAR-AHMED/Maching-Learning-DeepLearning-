# PCA 
dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Dimentionality reduction/PCA/Wine.csv")
dataset
#splitting the data 
library(caTools)
set.seed(123)
split = sample.split(dataset$Customer_Segment,SplitRatio = 0.80)
training_set = subset(dataset,split=TRUE)
test_set = subset(dataset,split=FALSE)

# feature Scalling 
training_set[-14] = scale(training_set[-14])
test_set[-14] = scale(test_set[-14])


# applying  PCA 
library(caret)
library(e1071)

pca = preProcess(x = training_set[-14],method = "pca",pcaComp = 2)
training_set = predict(pca,training_set)
training_set = training_set[c(2,3,1)]

test_set = predict(pca,test_set)
test_set = test_set[c(2,3,1)]

# fitting logistic regression to training set 
# to be completed 

