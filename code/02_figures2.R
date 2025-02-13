## READ IN DATA ####
source("code/01_cleaning.R")

## LOAD PACKAGES ####
library(ggplot2)

## ORGANIZE DATA ####
data_figs = data_clean

## MAKE FIGURES ####
# Histogram of dependent variable (proportion of 'Page's)
name.plot = ggplot(data_figs, aes(x = prop)) +
  geom_histogram()


name.plot

# Histogram with specific binwidth
ggplot(data_figs, aes(x = prop)) +
  geom_histogram(binwidth = 0.0000005)

ggplot(data_figs, aes(x = prop)) +
  geom_histogram(binwidth = 0.000001)

ggsave("figures/name_plot.pdf")

data_clean = data %>%
  filter(name == "Page") %>%
  filter(year > 1900) %>%
  filter(year <= 2000) %>% 
  mutate(prop_log10 = log10(prop))


# Histogram of log transformed dependent variable (proportion of 'Page's)
name_log10.plot = ggplot(data_figs, aes(x = prop_log10)) +
  geom_histogram()

name_log10.plot


# Proportion of 'Page's by year (continuous predictor)
year.plot = ggplot(data_figs, aes(x = year, y = prop_log10)) +
  geom_point() +
  geom_smooth(method="lm")
year.plot

# Proportion of 'Page's by year (continuous predictor)
year.plot <- ggplot(data_figs, aes(x = year, y = prop_log10)) +
  # Make the figure a scatterplot
  geom_point() +
  # Add a regression line, 'lm' call makes it linear regression
  geom_smooth(method="lm")+
  # Add a title
  ggtitle("Proportion of People with\nthe Name 'Page' Over Time")+
  # Customize the x-axis
  xlab("Year") +
  # Customize the y-axis
  ylab("Proportion of People\n(log base 10 transformed)") +
  # Remove dark background
  theme_classic() +
  # Additional paramaters for displaying plot
  theme(text=element_text(size=10), title=element_text(size=12))

# Call plot
year.plot

# save the plot
ggsave('figures/scatterplot_proportion_year.pdf', dpi = 300)


plot.interaction <-  ggplot(data_figs, 
                            aes(x = year, y = prop_log10, colour = sex)) +
  geom_point() +
  geom_smooth(method="lm")
plot.interaction

# Proportion of 'Page's by sex (categorical predictor)
sex.plot = ggplot(data_figs, aes(x = sex, y = prop_log10)) +
  geom_boxplot()

sex.plot

# Proportion of 'Page's by sex (categorical predictor)
sex.plot = ggplot(data_figs, aes(x = sex, y = prop_log10, fill=sex)) +
  geom_boxplot()

sex.plot

# ggsave('figures/boxplot_propotion_by_sex.pdf', dpi = 300)