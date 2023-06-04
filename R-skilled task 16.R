        # TASK 16

library(tidyverse)

# 1. "data <- ggplot2::msleep" kodunu icra et. datanın "NA" faizlərini plotla göstər. ----
library(plotly)
library(inspectdf)

data <- ggplot2::msleep
data %>% inspect_na() %>% show_plot()


# 2. datada correlasiyaları plotla göstər. ----
library(corrmorant)

data %>% 
  ggcorrm() +
  lotri(geom_point(alpha = 0.5, colour = 'cyan')) + 
  lotri(geom_smooth()) +
  utri_heatmap() +
  utri_corrtext() + 
  dia_names() +
  dia_histogram(colour = 'blue') +
  scale_fill_corr() +
  labs(title = 'Plots of Correlation')


# 3. datada ortaq "NA"ləri plotla göstər. ----
library(naniar)

data %>% gg_miss_upset()


# 4. "data <- "correlationfunnel::marketing_campaign_tbl" kodunu icra et. ----
# datada dəyişənlərin "TERM_DEPOSIT" dəyişəninin"yes" dəyəri ilə olan korrelasiyalarını interaktiv plotla göstər.

library(correlationfunnel)

data2 <- correlationfunnel::marketing_campaign_tbl

df <- data2 %>% binarize(one_hot = T)

corr_df <- df %>% 
  correlate(target = TERM_DEPOSIT__yes)

corr_df %>% 
  plot_correlation_funnel(interactive = T)
