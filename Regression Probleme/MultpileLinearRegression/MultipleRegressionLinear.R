# multiple regression linear 

dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Regression Probleme/MultpileLinearRegression/50_Startups.csv")
dataset


# take care about categoriel variable 


# encode the categoriel variable 
dataset$State = factor(dataset$State,
                       levels =c("New York","California","Florida"),
                       labels = c(0,1,2))

# split the data set 
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit,SplitRatio = 0.8)
trainingset = subset(dataset,split== TRUE)
testset = subset(dataset,split == FALSE)

# fiit our linear regression 

regressor = lm(formula = Profit~.,data = trainingset)
summary(regressor)

# the R.D.spend in the most significative indep vaialbe 
# for the p value the lower is the most significant the variable is too the dependent varaible 

# the significant code represent for example 
# when the pvalue is between 0 ans 0.001 is the most high significatant *** start 
# and when it s between 0.001 and 0.01 is ** stars .....

# that mean we can rewrite  our lm and make more simple 

#regressor = lm(formula = Profit~R.D.Spend= trainingset)
#summary(regressor)


# predicting the Test result
ypredict = predict(regressor,newdata = testset)
ypredict


# building the optimal model using Backward Elimination 


# the first step we will fit the model on whole indep variab
regressor = lm(formula = Profit~R.D.Spend +Administration +Marketing.Spend +State,data = dataset)
summary(regressor)

# we will delete the hight pvalue state 

regressor = lm(formula = Profit~R.D.Spend +Administration +Marketing.Spend,data = dataset)
summary(regressor)

# the second is administration 
regressor = lm(formula = Profit~R.D.Spend +Marketing.Spend,data = dataset)
summary(regressor)

# the third one is marketing spend 
regressor = lm(formula = Profit~R.D.Spend ,data = dataset)
summary(regressor)

# we will stop cause we don t have any higher p value than 0.05 





















