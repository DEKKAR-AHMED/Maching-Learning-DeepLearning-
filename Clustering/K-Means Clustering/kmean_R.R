# k means 
# import the dataset 
dataset = read.csv("/home/ahmed/Desktop/MachinLearning-DeepLearning/Clustering/K-Means Clustering/Mall_Customers.csv")

x = dataset[4:5]

# identify the number of cluster the elbow model 
set.seed(6) # to fix the number of random for all user 
wcss = vector()

for(i in 1:10){
wcss[i]= sum(kmeans(x,i)$withinss)
}
plot(1:10,wcss,type="b",main=paste("cluster of Client"),xlab = "number of cluster",ylab = "WCSS")

# the optimal cluster is 5 
# applaying kmeans 
set.seed(29)
kmeans = kmeans(x,5,iter.max = 300,nstart = 10)
y_kmean = kmeans$cluster


# visualisation cluset 
library(cluster)
clusplot(x,kmeans$cluster,lines=0,shade = TRUE,labels = 2,plotchar = FALSE,color = TRUE ,span = TRUE,main = paste("cluster of client"),xlab = "annual income",ylab = "spending score")