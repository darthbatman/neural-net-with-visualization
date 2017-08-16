# dependency

library(neuralnet)

# reading training set from file

iris_training <- read.csv("iris_training.csv")

# reading testing set from file

iris_test <- read.csv("iris_test.csv")

# creating neuralnet classifier

model <- neuralnet("Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width", data=iris_training, hidden=c(5, 3), linear.output=TRUE)

# generating visualization for neural network

plot(model)

# using classifier to predict classifications for testing set

predictions <- compute(model, iris_test[, -5])

# rounding predictions for integer classifications
# and calculating accuracy of classifications

accuracy <- 0
	
i <- 1

rounded_predictions <- c()

for (p in predictions$net.result){
	rounded_predictions <- c(rounded_predictions, round(p))
	if (round(p) == iris_test[, 5][[i]]){
		accuracy <- accuracy + (1 / length(predictions$net.result))
	}
	i <- i + 1
}

# showing accuracy of neural network

accuracy

# showing classifier's predicted classifications

rounded_predictions