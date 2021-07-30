## this script takes info from the project tracking sheet and 
## summarizes it with PI last name and project title

## load libraries
library(tidyverse)


## read raw data
dat <- read_csv("pi_project.csv")

## extract PI's last name & project title
dat %>%
  separate(PI, into = c("last_name", "first_name")) %>%
  select(-c(first_name, short_title)) %>%
  arrange(last_name) %>%
  unite(col = "pi_project", sep = "  |  ") %>%
  distinct() %>%
  write_csv("fy21_pi_project_info.csv", quote_escape = "none")
