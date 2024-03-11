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



#total runs scored by each batsman in ipl series
data = read.csv('ipl deliveries.csv')
summary(data)
library(dplyr)

#total runs scored by each batsman in ipl series
BATSMAN_TOTAL_RUNS = data %>% group_by(batsman) %>% summarise(total_runs = sum(batsman_runs)) %>% arrange(desc(total_runs))
BATSMAN_TOTAL_RUNS

#DETAILS OF BATSMAN WHO HAVE SCORED MORE THAN 4000 RUNS IN IPL
BATSMAN_TOTAL_RUNS %>% filter(total_runs>4000)

#find the total wickets taken by each bowler
TOTAL_WICKETS = data %>% filter(player_dismissed != "") %>% group_by(bowler) %>% count() %>% arrange(desc(n))
#or try this
TOTAL_WICKETS = data %>% filter(player_dismissed != "") %>% group_by(bowler) %>% summarise(no_of_wickets=n()) %>% arrange(desc(no_of_wickets))
#bowlers have taken more than 150wickets
TOTAL_WICKETS %>% filter(no_of_wickets>150) %>% arrange(desc(no_of_wickets))

#display columns Player Name, Total_runs, Average_runs, Total_wickets
TOTAL_WICKETS$player_name = TOTAL_WICKETS$bowler
BATSMAN_TOTAL_RUNS$player_name = BATSMAN_TOTAL_RUNS$batsman
player_info = merge(BATSMAN_TOTAL_RUNS, TOTAL_WICKETS, by="player_name")
player_info = player_info[,-3]


library(dplyr)
ipl_del = read.csv('IPL1.csv')
ipl_mat = read.csv('IPL2.csv')
ipl_data = merge( ipl_del,ipl_mat,by.x ='id',by.y ='match_id')
summary(ipl_data)
//find total runs scored by each batsman in season 2010
batsman_run_2010 = ipl_data %>% filter(season == 2010) %>% group_by(batsman) %>% summarise(totalrun_scored = sum(batsman_runs)) %>% arrange(desc(totalrun_scored))
batsman_run_2010
//OUTPUT
batsman          totalrun_scored
<chr>                      <int>
1 SR Tendulkar                 618
2 JH Kallis                    572
3 SK Raina                     528
4 SC Ganguly                   493
5 M Vijay                      458
6 DPMD Jayawardene             445
7 A Symonds                    429
8 SS Tiwary                    419
9 RG Sharma                    404
10 NV Ojha                      377
//Ends
// in the season 2010 what was the top score of each batsman
batsman_run_2010 = ipl_data %>% filter(season == 2010) %>% group_by(batsman,id) %>% summarise(total_runs_scored = sum(batsman_runs))
batsman_run_2010
//OUTPUT
batsman     id total_runs_scored
<chr>    <int>             <int>
  1 A Kumble   197                 1
2 A Kumble   209                 1
3 A Kumble   220                 2
4 A Kumble   226                 1
5 A Kumble   231                 1
6 A Mishra   183                 3
7 A Mishra   185                 6
8 A Mishra   189                 0
9 A Mishra   213                 4
10 A Mishra   218                10
//ends
top_score_2010 = batsman_run_2010 %>% group_by(batsman) %>% summarise(max_runs = max(total_runs_scored)) %>% arrange(desc(max_runs))
top_score_2010
//OUTPUT
batsman          max_runs
<chr>               <int>
  1 M Vijay               127
2 DPMD Jayawardene      110
3 DA Warner             107
4 YK Pathan             100
5 NV Ojha                94
6 ML Hayden              93
7 JH Kallis              89
8 SR Tendulkar           89
9 CH Gayle               88
10 SC Ganguly             88
//ends 
// number of matches that took place in wankhede stadium
number_of_matches = ipl_del %>% filter(venue == 'Wankhede Stadium')%>% summarise(count_matches = n()) %>% arrange(desc(count_matches))
number_of_matches
//output
count_matches
1            73
//ends 
//which team scored maximum runs in wankhede stadium
number_of_matches = ipl_data %>% filter(venue == 'Wankhede Stadium')%>% group_by(batting_team)%>% summarise(top_team = sum(total_runs)) %>% arrange(desc(top_team))
number_of_matches
//output
batting_team                top_team
<chr>                          <int>
  1 Mumbai Indians                 11031
2 Chennai Super Kings             2225
3 Kings XI Punjab                 1968
4 Royal Challengers Bangalore     1706
5 Rajasthan Royals                1389
6 Kolkata Knight Riders           1297
7 Delhi Daredevils                1126
8 Sunrisers Hyderabad             1109
9 Pune Warriors                    389
10 Gujarat Lions                    323
11 Rising Pune Supergiant           322
12 Deccan Chargers                  235
13 Delhi Capitals                   219
14 Kochi Tuskers Kerala             184
15 Rising Pune Supergiants          126

//ends

# displays current working directory
getwd()


# delete the first 2 rows, store the file in the same directory
data=read.csv('Constituency_Wise_Detailed_Result.csv')

# print variable data
# data

summary(data)

# install package dplyr from bottom right side

library(dplyr)


# each constituency total votes
con_tot_vot = data %>% group_by(PC.NAME) %>% summarise(total_votes=sum(TOTAL)) %>%  select(PC.NAME, total_votes)
# con_tot_vot

con_tot_vot_df = data.frame(con_tot_vot)
con_tot_vot_df

write.csv(con_tot_vot_df, 'con_total.csv')

# constituency wise name of winning candidate
winning_can = data %>% group_by(PC.NAME) %>% filter(TOTAL==max(TOTAL)) %>% select(PC.NAME, CANDIDATES.NAME, TOTAL)
# winning_can
winning_can_df = data.frame(winning_can)
winning_can_df

# find the 2nd position in each constituency
second_place = data %>% group_by(PC.NAME) %>% arrange(desc(TOTAL)) %>% slice(2) %>% select (PC.NAME, CANDIDATES.NAME, TOTAL)
second_place
second_place_df = data.frame(second_place)
second_place_df

# find the margin - winning candidates votes - 2nd position votes
com_data = merge(winning_can_df, second_place_df, by='PC.NAME')
# com_data
com_data$margin = com_data$TOTAL.x - com_data$TOTAL.y
com_data
summary(com_data)

margin_data = com_data %>% group_by(PC.NAME) %>% summarise(margin=TOTAL.x - TOTAL.y) %>% select(PC.NAME, margin)
margin_data

# find the margin more than 10000
margin_data2 = margin_data %>% filter(margin > 10000) %>% select(PC.NAME, margin)
margin_data2

margin_data3 = com_data %>% group_by(PC.NAME) %>% summarise(margin=TOTAL.x - TOTAL.y) %>% filter(margin > 10000) %>% select(PC.NAME, margin)
margin_data3

# find the margin less than 10000
margin_data4 = margin_data %>% filter(margin < 20000) %>% select(PC.NAME, margin)
margin_data4

margin_data5 = com_data %>% group_by(PC.NAME) %>% summarise(margin=TOTAL.x - TOTAL.y) %>% filter(margin < 20000) %>% select(PC.NAME, margin)
margin_data5

#load data
data = read.csv("storDataSet.csv")
#load library dplyr
library(dplyr)

# candidates who won from each cons with the party name
candidate_won = data %>% group_by(PC.NAME) %>% filter(TOTAL==max(TOTAL)) %>% select(PC.NAME,CANDIDATES.NAME,TOTAL,PARTY.NAME)

#no of seats secured by each party
partwiseCount = candidate_won %>% group_by(PARTY.NAME) %>% count()

#total number of seats secured by each political party from maharashtra
#filter - where clause
totalCount = data %>% filter(State.Name=='Maharashtra') %>% group_by(PC.NAME)%>% filter(TOTAL== max(TOTAL))%>% select(PC.NAME,CANDIDATES.NAME,TOTAL,PARTY.NAME)
totalCount %>% group_by(PARTY.NAME)  %>% count()


#total votes secured by each political party in maharshtra
result = data %>% filter(State.Name=='Maharashtra') %>% group_by(PARTY.NAME) %>% summarise(total_votes_share=sum(TOTAL))
