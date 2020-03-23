# processing data 
data_set = read.csv("/home/ahmed/Desktop/machine-learning-A-Z/Part 1 - Data Preprocessing/Data.csv")
data_set
# taking of the missing value 
data_set$Age = ifelse(is.na(data_set$Age),yes =ave(data_set$Age,FUN = function(x)mean(x,na.rm = TRUE)),data_set$Age)
data_set
data_set$Salary = ifelse(is.na(data_set$Salary),yes = ave(data_set$Salary,FUN = function(x)mean(x,na.rm = TRUE)),data_set$Salary)
data_set
# Encoding categorial data 
data_set$Country = factor(x = data_set$Country,
                          levels = c("France","Spain","Germany"),
                          labels = c(1,2,3))
data_set

data_set$Purchased = factor(x = data_set$Purchased,
                          levels = c("Yes","No"),
                          labels = c(1,0))
data_set