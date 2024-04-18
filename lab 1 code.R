library(dplyr)
library(caret)

data <- read.csv("/Users/studentinfo2.csv") 
# Data prrocessing - nothi
#categorical yo variables to factors zeros and ones
data$code_module <- as.factor(data$code_module)
data$code_presentation <- as.factor(data$code_presentation)
data$gender <- as.factor(data$gender)
data$region <- as.factor(data$region)
data$highest_education <- as.factor(data$highest_education)
data$imd_band <- as.factor(data$imd_band)
data$age_band <- as.factor(data$age_band)
data$num_of_prev_attempts <- as.factor(data$num_of_prev_attempts)
data$disability <- as.factor(data$disability)
data$final_result <- as.factor(data$final_result)

# Splting the data into training and testing sets (70% training, 30% testing)
set.seed(123) # For reproducibility
train_index <- createDataPartition(data$final_result, p = 0.7, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Training the classificfkldgjkldfjglkation model (logistic regression) since there are only two outcomes withdrawn and not withdrawn
model <- train(final_result ~ ., data = train_data, method = "glm", family = "binomial")

# Makeing predictions on the test data for this databse
predictions <- predict(model, newdata = test_data)

# Evaluate the modelj createdlfjglkdfj
confusionMatrix(predictions, test_data$final_result)
model
