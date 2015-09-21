library(rio)
library(lubridate)
library(dplyr)

leeds <-  import("leeds_accidents.csv", setclass = "tbl_df")
leeds # tbl_df nicer to work with

# "Average number of vehicles per accident involving cars only in 2012"

# Temporary structures
leeds_ref <- distinct(leeds, ref_number)
leeds_ref_cars <- filter(leeds_ref, vehicle_type == 9,
                         year == 2012)
mean(leeds_ref_cars$num_vehicles)

# Nested function calls

# "...and then..." thinking using the %>% CTRL-SHIFT-M 

leeds %>%
  distinct(ref_number) %>% 
  filter(vehicle_type == 9, year == 2012) %>% 
  summarise(Aveage=mean(num_vehicles), Blah=sd(num_vehicles))
  
# group_by

