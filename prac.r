install.packages("ggplot2")
library(ggplot2)
your_data <- read.csv("your_dataset.csv")
your_data <- na.omit(your_data)
ggplot(your_data, aes(x = x, y = y)) +
  geom_point() +
  ggtitle("Your Plot Title") +
  xlab("X-axis Label") +
  ylab("Y-axis Label")
ggplot(your_data, aes(x = x, y = y)) +
  geom_point(aes(color = is.na(y))) +
  ggtitle("Your Plot Title") +
  xlab("X-axis Label") +
  ylab("Y-axis Label") +
  scale_color_manual(values = c("TRUE" = "red", "FALSE" = "blue"), name = "Missing Values")



barplot(blacks,names.arg=year, xlab="Years", ylab="No. of Blacks", main="Car chart")
blacks : numbers to plot on the Y-axis
years: individual bar ka label on the x axis
xlab ylab: self explanatory
main: full chart ka title
black = data %>% pull(no_of_black_cars)
year = data %>% pull(year)


library(ggplot2)
barplot(topdemandcars$total, name.arg=topdemandcars$make, xlab="make", ylab="demand")

data = read.csv('car_sales_data.csv')
summary(data)

library(dplyr)

unique_years = unique(data$year)

#What are the top 5 most common car models in the dataset?
top_models = data %>% group_by(model) %>% summarise(count = n()) %>%
  arrange(desc(count)) %>% head(5) %>% select(model)
 
# How many cars were sold in each state?
cars_sold_per_state = data %>%
  group_by(state) %>%
  summarise(total_cars_sold = n())

write.csv(cars_sold_per_state, 'cars_sold_per_state.csv')

# What is the distribution of car conditions in the dataset?
car_condition_distribution = data %>% group_by(condition) %>%
  summarise(count = n()) %>% arrange(desc(count))


# What is the correlation between odometer reading and selling price?
correlation_by_make_model = data %>%
  group_by(make, model) %>%
  summarise(correlation = cor(odometer, sellingprice))

#What are the top 5 most common car colors?
top_color = data %>% group_by(color) %>% summarise(count = n()) %>%
  arrange(desc(count)) %>% head(5) %>% select(color)

#What is the average selling price of cars for each make and model combination?
  avg_selling_price_by_make_model = data %>%
  group_by(make, model) %>%
  summarize(avg_selling_price = mean(sellingprice))
  
#from a particular year how many cars were sold?
cars_sold = data %>% group_by(model, year) %>% count()

#how many of a particular model are sold in a particular year
model_year_sales = data %>% filter(model == "Optima" & year == 2014) %>%
  summarize(total_sales = n())

#details of cars within a particular selling price
selling_price_range = data %>% filter(sellingprice >= 10000 & sellingprice <= 20000) %>% select(year, make, sellingprice)

#based on colour how many cars were sold in a year
cars_sold_2004 = data %>% filter(year == 2004) %>% count(color)

#based on colour how many cars were sold in a year
cars_sold_2004 = data %>% filter(year == 2004) %>% count(color)
cars_sold_2004$total_sold = cars_sold_2004$n
cars_sold_2004 = cars_sold_2004[-2]

# What is the average odometer reading of cars for each make and transmission combination where the condition is '5'?
avg_odo = data %>% filter(condition == '5') %>% group_by(make, transmission) %>% summarise(avg_odometer = mean(odometer))

# What is the proportion of cars sold in each condition category for cars with mileage less than 50,000 miles?
condition_proportion_50000_miles = data %>%
  filter(odometer < 50000) %>%
  group_by(condition) %>%
  summarize(proportion = n() / nrow(.)) 

# Which state has the highest average selling price of cars for each make?
highest_avg_sp = data %>% group_by(make,state) %>% summarise(avg_sp = mean(sellingprice)) %>% top_n(1, avg_sp)

# What is the average selling price of cars with mileage less than 50,000 miles and condition as '5' or '15' for each make and model combination?
avg_sp_by_mamo_con = data %>% filter(condition %in% c('5', '15') & odometer < 50000) %>%
  group_by(make, model,odometer) %>%
  summarize(avg_sp = mean(sellingprice))

average_selling_price = data %>% group_by(make, model, year) %>% 
  summarise(avg_selling_price = mean(sellingprice))

most_common_vin = data %>% group_by(vin) %>% summarise(count = n()) %>% arrange(desc(count))

#Identify the top 5 most frequently sold colors
tp_5_color = data %>% count(color) %>% arrange(desc(n)) %>% head(5)

#Find the number of cars sold by seller type
cars_seller_type = data %>% count(seller)

#Calculate the average difference between the selling price and MMR (Manheim Market Report) by condition
avd_diff = data %>% group_by(condition) %>% summarise(avg_price_diff = mean(sellingprice - mmr))
