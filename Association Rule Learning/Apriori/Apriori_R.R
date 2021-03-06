# apriori

# data preporcessing
dataset = read.csv("/home/ahmed/Desktop/MachinLearning-DeepLearning/Association Rule Learning/Apriori/Market_Basket_Optimisation.csv",header= FALSE )

# in the priori algorithme will not use csv data but we will use sparse matrxi that contain a lot of zero 
# binary metrix 

# to create the spase matrix  to do that we have to install the arules library 
library(arules)
# as we will no t use our csv so wi will delete the data set 
dataset = read.transactions("/home/ahmed/Desktop/MachinLearning-DeepLearning/Association Rule Learning/Apriori/Market_Basket_Optimisation.csv",sep = ",",rm.duplicates = TRUE)
dataset
summary(dataset)
# the density tell have the fearfulness(percent) of non zero 
# the element size tell us how many custumer do bu only one product or two or 3 .....
# then we have the min,max,mean produc they buy 

#visaulisation 
# topN product bought by the costumer 

itemFrequencyPlot(dataset,topN = 10)

#trainin the Appriori on the dataset 

#first step choose a minimum for the support it depends on the busnis problem 
# we considere that the product bought 3 time per day or 21 time in a week
sup = 28/7500
# confidence = 0.8 default sup we have done the computation
rules= apriori(data = dataset,parameter = list(support = 0.004 , confidence =0.2))

# lets view the details and conclude 
# th e most important information we will must conclude is the numbe
# of rules with confidence = 0.8 he have 0 rules
# to remember the confidence means that the rule must be at leat 0.8 % correcte 
# with 0.4 we have 304 rules 

# the step2 and three are being executed by the apriori function

# the step for sort the rules bu the decreasing lift 
inspect(sort(rules,by= "lift")[1:10])
# visualisation the result 
























