library(neuralnet)

vehicle_training <- read.csv("vehicles_training.csv")
vehicle_test <- read.csv("vehicles_test.csv")

model <- neuralnet("Vehicle ~ Wheels + Length + Width + Height", data=vehicle_training, hidden=c(5, 3), linear.output=TRUE, startweights=c(10000, 0, 0, 0))

plot(model)

predictions <- compute(model, vehicle_test[, -5])

accuracy <- 0

i <- 1

rounded_predictions <- c()

for (p in predictions$net.result){
	rounded_predictions <- c(rounded_predictions, round(p))
	if (round(p) == vehicle_test[, 5][[i]]){
		accuracy <- accuracy + (1 / length(predictions$net.result))
	}
	i <- i + 1
}

accuracy

rounded_predictions