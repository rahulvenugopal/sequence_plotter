# A simple visualization for sequence
# Author: Rahul Venugopal

# TODO
# Add texts explaining the idea conveyed via viz using ggtext
# Add pops highlighting important aspects
# Modify and write another Viz for hypnograms
# Scout better color palette!
# Find streaks of sequence

# Loading libraries required
library(ggplot2)
library(dplyr)

# Generate a demo sequence
data <- data.frame(sample(c("A", "B", "C","D"), 50, replace = TRUE))
colnames(data) <- 'sequence'
data$xaxis <- rownames(data)
data$xaxis <- strtoi(data$xaxis)

# Assigning one color to each unique sequence
# This part has to be automated by finding unique symbols and assigning color
ELSE <- TRUE
data <- data %>% mutate(.,col = with(.,case_when(
  (sequence == "A") ~ '#d7191c',
  (sequence == "B") ~ '#fdae61',
  (sequence == "C") ~ '#abd9e9',
  ELSE ~ '#2c7bb6'
)))

# Visualization
ggplot(data,aes(x = xaxis,
                y = 1,
                group = 1,
                colour = col
                ))+
  geom_line( size = 10, linetype = "solid", show.legend = FALSE) +
  theme_void() 