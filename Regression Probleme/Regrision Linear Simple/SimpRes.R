# simple linear Regresion 
dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Regression Probleme/Regrision Linear Simple/Salary_Data.csv")

#we dont need to dummy the features cause we dont have any catergorielle 
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary,SplitRatio = 2/3)
trainingset = subset(dataset,split==TRUE)
testset = subset(dataset,split==FALSE)

# we dont need to scalle the data 

regressor = lm(formula = Salary~YearsExperience,dataset)
summary(regressor)
#the 3 star means that the years experience independet variable 
#highly statistically significant because you can either have no star one star 
#3 three star 
#no star means that there is no statistical sigh ifaicane 
#and three stars mean there is a high significant 

#the other thing the p value 

 #the lower pvalue is the more significant you independent variable 
 #is going to be the more impart that have in dependente value 
 #when we are over 5% means that it s less signficant 
 #when it s above 95 % means it s significant '''


# predictioon of the test set 

predict_set = predict(regressor,newdata = testset)

predict_set

# visualisation the training set 

ggplot()+
  geom_point(aes(x=trainingset$YearsExperience,y=trainingset$Salary),
             colour = "red")+
  geom_line(aes(x=trainingset$YearsExperience,y=predict(regressor,newdata = trainingset)),
            colour="blue")+
  ggtitle("Simple regresion linear(Training set )")+
  xlab("years of experience ")+
  ylab("Salary ")
  
# visualisation the testset 

ggplot()+
  geom_point(aes(x=testset$YearsExperience,y=testset$Salary),
             colour = "red")+
  geom_line(aes(x=trainingset$YearsExperience,y=predict(regressor,newdata = trainingset)),
            colour="blue")+
  ggtitle("Simple regresion linear(test set )")+
  xlab("years of experience ")+
  ylab("Salary ")
















