# Natural Language Processing

# Importing the dataset
# stringFactor just to not set the view as factors 
dataset_original = read.delim('Restaurant_Reviews.tsv', quote = '', stringsAsFactors = FALSE)

# Cleaning the texts
#install.packages('tm')
# install.packages('SnowballC')
library(tm)
library(SnowballC)
corpus = VCorpus(VectorSource(dataset_original$Review))
# lowercase 
corpus = tm_map(corpus, content_transformer(tolower))
# remove number 
corpus = tm_map(corpus, removeNumbers)
#remove punctuation 
corpus = tm_map(corpus, removePunctuation)
# remove stop words to use this function is SNOWBALLC
corpus = tm_map(corpus, removeWords, stopwords())

# the stemming step the root of the words example loved ==> love 
corpus = tm_map(corpus, stemDocument)
# removing the extra spaces 
corpus = tm_map(corpus, stripWhitespace)


# the whole cleaning text process is completed  just to reduce our sparse matrix 

# Creating the Bag of Words model
#Creating the sparse matrix 
dtm = DocumentTermMatrix(corpus)
# filter again the dtm by considering by  only the  most frequent 
# the portion of frequent word we will take 
dtm = removeSparseTerms(dtm, 0.999)
#convert our matrix to a dataframe to launch our machine learning model with 
dataset = as.data.frame(as.matrix(dtm))

# add the dependante varialbe to the independent variable 

dataset$Liked = dataset_original$Liked

#############################################################

                # bouild our machine learning model         

############################################################




# Importing the dataset
dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[3:5]

# Encoding the target feature as factor
dataset$Liked = factor(dataset$Liked, levels = c(0, 1))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Liked, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting Random Forest Classification to the Training set
# install.packages('randomForest')
library(randomForest)
classifier = randomForest(x = training_set[-692],
                          y = training_set$Liked,
                          ntree = 10)

# Predicting the Test set results
y_pred = predict(classifier, newdata = test_set[-692])

# Making the Confusion Matrix
cm = table(test_set[, 692], y_pred)