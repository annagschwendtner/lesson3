## LOAD PACKAGES ####
library(dplyr)
library(readr)

data = readr::read_tsv("data/lesson2_data_babynames.txt")

head(data)

summary(data)
glimpse(data)

data = readr::read_tsv("data/lesson2_data_babynames.txt", col_types = 'iffin')

summary(data)
glimpse(data)

data_clean = dplyr::filter(data, name == "Page")

head(data_clean)


## CLEAN DATA ####
data_clean = data %>%
  filter(name == "Page")


xtabs(~name, data_clean)

xtabs(~name, data)

data_clean = data %>%
  filter(name == "Page") %>%
  filter(year > 1900) %>%
  filter(year <= 2000)

xtabs(~name, data)
head(data_clean)

summary (data_clean)

min(data_clean$year)

max(data_clean$year)
