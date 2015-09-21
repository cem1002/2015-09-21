library(rio)
library(dplyr)
library(ggplot2)

nations <- import("nations.xlsx", setclass = "tbl_df")

p <- ggplot(data = nations, aes(x = GDP, y = TFR)) # Choose what I want to plot

p + geom_point() # And then make a scatterplot

p +                   # Choose what
  scale_x_log10() +   # ...and then say to use log scales...
  scale_y_log10() +
    geom_point()      # ...and then make a scatterplot


# With a third categorical variable
p_log <- ggplot(data = nations, aes(x = log(GDP), y = log(TFR), color = region))

p_log +
  geom_point()

# "Small multiples" via "faceting"
p_log + 
  facet_wrap(~ region) +
  geom_point()

# Better
ggplot(data = nations, aes(x = log(GDP), y = log(TFR))) + 
  facet_wrap(~ region) +
  geom_point()

# Leeds data..."The the data, look at the unique accidents with cars only, and
# then make barplots of the number of casualties for each weather condition."

leeds <- import("leeds_accidents.csv")

leeds %>% distinct(ref_number) %>% 
  ggplot(aes(x = num_casualties)) + 
  facet_wrap(~ weather_conditions) + 
  geom_bar()


  
