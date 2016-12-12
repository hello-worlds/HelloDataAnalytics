# The R interface to libsvm is in package e1071: svm()
# As usual, both the vector/matrix and the formula interface are supported

# In this first example, we generate 1-D artificial data

data = seq(1,10)
classes = c('b','b','b','b','a','a','a','a','b','b')
mysvm = svm (data, classes, type='C', kernel='linear')

pred1 = predict (mysvm, data)
table(pred1, classes)

mysvm = svm (data, classes, type='C', kernel='polynomial', degree=2)
pred2 = predict (mysvm, data)
table(pred2, classes)

mysvm = svm (data, classes, type='C', kernel='radial', gamma=0.1)
pred3 = predict (mysvm, data)
table(pred3, classes)

mysvm = svm (data, classes, type='C', kernel='radial', gamma=0.1, cost=10)
pred4 = predict (mysvm, data)
table(pred4, classes)

# In a second example, we use the glass data (available in package mlbench) for classification
# The task is to predict the type of a glass on basis of its chemical analysis

library(e1071)
library(rpart)
library(mlbench)
data(Glass)

## split data into a training (2/3) and test set (1/3)

index <- 1:nrow(Glass)
testindex <- sample(index, trunc(length(index)/3))
testset <- Glass[testindex,]
trainset <- Glass[-testindex,]

# fit the model

svm.model <- svm(Type ~ ., data = trainset, cost = 100, gamma = 1)

# make the prediction (the dependent variable, Type, has column number 10)

svm.pred <- predict(svm.model, testset[,-10])

table(pred = svm.pred, true = testset[,10])

# The function svm() returns an object of class “svm”, which partly includes the following components:
#	SV: matrix of support vectors found;
#	labels: their labels in classification mode;
#	index: index of the support vectors in the input data (could be used e.g., for visualization)

# Other important parameters:
# 	class.weights: allows to introduce class weighing, useful for very asymmetric classes 
#	cross: (default 0) for k-fold CV

# A nice tool in package e1071 is the possibility of tuning the parameters by 10-CV grid search:

mytunedsvm <- tune.svm(Type ~ ., data = trainset, gamma = 2^(-1:1), cost = 2^(2:4)) 
summary(mytunedsvm)
plot (mytunedsvm, transform.x=log10, xlab=expression(log[10](gamma)), ylab="C")

