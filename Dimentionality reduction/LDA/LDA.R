# LDA 
dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Dimentionality reduction/LDA/Wine.csv")
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

# applaying LDA
library(MASS)
lda = lda(formula = Customer_Segment ~ . ,data=training_set)
training_set = as.data.frame(predict(lda,training_set))
training_set
  
training_set = training_set[c(5,6,1)]

test_set = as.data.frame(predict(lda,test_set))
test_set

test_set = test_set[c(5,6,1)]


# fitting logistic regression to training set 
# to be completed  or use any ndel you want 

