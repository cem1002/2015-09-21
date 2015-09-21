library(rio)    
library(lubridate)

leeds <- import("leeds_accidents.csv")

## mdy is from the lubridate package
leeds$accident_date <- mdy(leeds$accident_date)
