# decision Tree 

dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Regression Probleme/DecisionTree/Position_Salaries.csv")
dataset = dataset[2:3]



#fitting the Decision Tree 

library(rpart)
regressor = rpart(formula= Salary~.,dataset,control = rpart.control(minsplit = 1))
summary(regressor)
y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred
# Visualising the Regression Model results
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')
# to improve we will do the same thing as python 
#cause here as we dont have all variable so the model will mathc each point so we will not get 
# a good graph cause we will use average  of each interval 
# so we will do as the follow 

# Visualising the Regression Model results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')