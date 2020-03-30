# CAH 
# import the dataset 
dataset = read.csv("/home/ahmed/Desktop/MachinLearning-DeepLearning/Clustering/K-Means Clustering/Mall_Customers.csv")

x = dataset[4:5]

# create our dendogram to find the optimal cluster number 
dendogram = hclust(dist(x,method = "euclidean"),method = "ward.D")
# plot the dendogram 
plot(dendogram,main="Dendogram",xlab = "customurs",ylab = "Euclidean distances")

# fit out CAH to our data set 
cah = hclust(dist(x,method = "euclidean"),method = "ward.D")
# cutting the tree we had with cah to number 5 cluster 
y_cah = cutree(cah,5)
y_cah
# visualisation cluset 
#library(cluster)
library(cluster)
clusplot(x,y_cah,lines=0,shade = TRUE,labels = 2,plotchar = FALSE,color = TRUE ,span = TRUE,main = paste("cluster of client"),xlab = "annual income",ylab = "spending score")