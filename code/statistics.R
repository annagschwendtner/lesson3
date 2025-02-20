## READ IN DATA ####
source("code/01_cleaning.R")

## LOAD PACKAGES #####
# [none currently needed]

## ORGANIZE DATA ####
data_stats = data_clean

head(data_stats)

## BUILD MODEL - PROPORTION OF 'PAGE'S BY YEAR (CONTINUOUS PREDICTOR) ####
year.lm = lm(prop_log10 ~ year, data = data_stats)

year.lm_sum <- summary(year.lm)
year.lm_sum = summary(year.lm)

#residual
year.lm_resid <- resid(year.lm_sum)

#build model
lm(prop_log10 ~ sex, data = data_stats)

#save
sex.lm = lm(prop_log10 ~ sex, data = data_stats)

## BUILD MODEL - PROPORTION OF 'PAGE'S BY SEX (CATEGORICAL PREDICTOR) ####
sex.lm = lm(prop_log10 ~ sex, data = data_stats)

sex.lm_sum = summary(sex.lm)
sex.lm_sum