# SVR 

#importing the data 

dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Regression Probleme/SVR/Position_Salaries.csv")
dataset = dataset[2:3]
# we need to do preprocessing only for scalling 

# create our regressor 
library(e1071)
regressor = svm(formula= Salary~. ,data = dataset,
                type = "eps-regression")
# predicting the result 

summary(regressor)


y_predic = predict(regressor, newdata = data.frame(Level = 6.5))
y_predic