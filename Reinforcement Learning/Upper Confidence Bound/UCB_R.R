# upper Confidence Bound 

dataset = read.csv("/home/ahmed/Desktop/MachinLearning-DeepLearning/Reinforcement Learning/Upper Confidence Bound/Ads_CTR_Optimisation.csv")

#importing the data set 
d = 10
N= 10000
total_rewards= 0
# the number times  of ad i is selected in round n
n_selected_ads = integer(d)
# the number  of reward of ad i in the round n 
sum_of_rewards = integer(d)

ads_selected= integer()


for(n in 1:N){
  max_upperBound = 0
  ad = 0
  for (i in 1:d){
    if (n_selected_ads[i]>0){
      # calculate the average reward at each round n 
      average_reward = sum_of_rewards[i] / n_selected_ads[i]
      # calculate the confidence interval 
      # we only need the upper confidence bound cause in the step three we take only ht max 
      delta_i = sqrt(3/2*log(n)/n_selected_ads[i])
      upperbound = delta_i + average_reward
      
  
    }else{
      upperbound = 1e400
    }
    
    if (upperbound > max_upperBound){
      max_upperBound = upperbound
      ad = i 
    }
  }
  ads_selected = append(ads_selected,ad)
  n_selected_ads[ad]=n_selected_ads[ad]+ 1
  reward = dataset[n,ad]
  sum_of_rewards[ad] = sum_of_rewards[ad] + reward
  total_rewards = total_rewards + reward
}

print(total_rewards)


# visualisation 
hist(ads_selected,col = "blue",)










