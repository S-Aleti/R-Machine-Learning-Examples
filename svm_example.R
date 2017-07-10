library(e1071)
library(rpart)

data(Glass,package="mlbench")

index     <- 1:nrow(Glass)
testindex <- sample(index, trunc(length(index)/3)) 
testset   <- Glass[testindex,]
trainset  <- Glass[-testindex,]

## svm
svm.model <- svm(Type ~ ., data = trainset, 
                 cost = 100, gamma = 1)
svm.pred  <- predict(svm.model, testset[,-10])

## svm confusion matrix
table(pred = svm.pred,true = testset[,10])

