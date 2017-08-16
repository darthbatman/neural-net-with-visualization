# dependency

library(neuralnet)

# reading training set from file

vehicle_training <- read.csv("vehicles_training.csv")

# reading testing set from file

vehicle_test <- read.csv("vehicles_test.csv")

# creating neuralnet classifier

model <- neuralnet("Vehicle ~ Wheels + Length + Width + Height", data=vehicle_training, hidden=c(5, 3), linear.output=TRUE, startweights=c(10000, 0, 0, 0))

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