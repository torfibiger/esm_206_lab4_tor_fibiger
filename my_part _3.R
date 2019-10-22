#no chunks boi
# Tor Fibiger
# 

library(tidyverse)
library(here)
library(janitor)

db <- read_csv("disease_burden.csv")

db_clean <- db %>% 
  clean_names() 
 
  
db_sub <- db_clean %>% 
  filter(country_name %in% c("United States", "Japan", "Afghanistan", "Somalia")) %>% 
  filter(age_group == "0-6 days", sex == "Both")

#Graph

ggplot(data = db_sub, aes(x = year, y = death_rate_per_100_000)) +
  geom_line(aes(color = country_name))

ggsave(here::here("final_graphs", "disease_graph.png"))
