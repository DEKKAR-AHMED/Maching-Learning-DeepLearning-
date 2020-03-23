

# RAndom Forest 

dataset = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Regression Probleme/RandomForest/Position_Salaries.csv")
dataset

dataset = dataset[2:3]

# fittin the random forest model 
library(randomForest)
set.seed(1234)
randomfor = randomForest(x = dataset[1] # give a dataframe
                         ,y = dataset$Salary, # give me an array 
                         ntree = 600)

y_pred = predict(randomfor, data.frame(Level = 6.5))
y_pred


# Visualising the Regression Model results (for higher resolution and smoother curve)
# install.packages('ggplot2')
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.001)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(randomfor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Regression Model)') +
  xlab('Level') +
  ylab('Salary')