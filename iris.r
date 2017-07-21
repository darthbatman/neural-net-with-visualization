library(neuralnet)

iris_training <- read.csv("iris_training.csv")
iris_test <- read.csv("iris_test.csv")

model <- neuralnet("Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width", data=iris_training, hidden=c(5, 3), linear.output=TRUE)

plot(model)

predictions <- compute(model, iris_test[, -5])

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

accuracy

rounded_predictions