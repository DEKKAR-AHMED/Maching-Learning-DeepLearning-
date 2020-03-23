# polynomail regression
dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Regression Probleme/PolynomialeLinearRegression/Position_Salaries.csv")
dataset
# retake the only features we want 
dataset = dataset[2:3]

# preprocessing the data 
# take a care of a missing value 
# take a care a dummy variable 
# split the data 
# scaling  the data 

# fitting our the linear Regression 
regressor = lm(formula = Salary~Level,data = dataset)
summary(regressor)

#fitting the poly regression linear 

dataset$level2 = dataset$Level^2
dataset$level3 = dataset$Level^3
dataset$level4 = dataset$Level^4
poly_reg = lm(formula =  Salary~. , data = dataset)
summary(poly_reg)


# visualation linear regression 
library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary ),colour ="red")+
  geom_line(aes(x = dataset$Level, y = predict(regressor,newdata = dataset)),,colour ="blue")+
  ggtitle("linear REgression  Truth or bluff")+
  xlab("level")+
  ylab("salary")


# visualisation poly regression 

library(ggplot2)
ggplot()+
  geom_point(aes(x = dataset$Level, y = dataset$Salary ),colour ="red")+
  geom_line(aes(x = dataset$Level, y = predict(poly_reg,newdata = dataset)),colour ="blue")+
  ggtitle("Poly Regression  Truth or bluff")+
  xlab("level")+
  ylab("salary")



# predicting the result Linear Regression 
linear_predic = predict(regressor, newdata =data.frame(Level=6.5) )

#predicting The Poly Regression 

Poly_predi = predict(poly_reg, newdata =data.frame(Level=6.5,
                                                   level2=6.5^2,
                                                   level3= 6.5^3,
                                                   level4=6.5^4 ))

Poly_predi



















