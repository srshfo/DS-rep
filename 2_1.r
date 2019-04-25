library(dslabs)
library(dplyr)
library(lubridate)
library(caret)
data("reported_heights")
dat <- mutate(reported_heights, date_time = ymd_hms(time_stamp)) %>%
  filter(date_time >= make_date(2016, 01, 25) & date_time < make_date(2016, 02, 1)) %>%
  mutate(type = ifelse(day(date_time) == 25 & hour(date_time) == 8 & between(minute(date_time), 15, 30), "inclass","online")) %>%
  select(sex, type)
dat %>% group_by(type) %>% summarize(prop_female = mean(sex == "Female"))
y <- as.factor(dat$sex)
x <- as.factor(dat$type)
set.seed(2) 
accuracy <- function(){ 
  y_hat <- ifelse(x == "online", "Male", "Female") %>% factor(levels = levels(y))
  mean(y_hat==y)
}
accuracy()
table(y_hat,y)
sensitivity(y_hat,y)
specificity(y_hat,y)
confusionMatrix(data = y_hat, reference = y)
