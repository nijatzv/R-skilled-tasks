              # TASK 15

library(tidyverse)

# 1. ----
# "data <- ggplot2::midwest" kodunu icra et. "poptotal" və
# "popdensity" dəyişənlərinin "scatterplot"unu qur. 
# "category" dəyişəninə görə rənglə, "area" dəyişəninə görə ölçüləndir. 
# "labs" və "scale" əlavə et. "state" dəyişəninə görə plotları ayır.
# Plotları ayırarkən x və y oxlarını ayarla.

data <- ggplot2::midwest

data$poptotal %>% max() ; data$poptotal %>% min() ; data$poptotal %>% mean()
data$popdensity %>% max() ; data$popdensity %>% min()

t1_scattle <- data %>% 
  ggplot(aes(poptotal, popdensity)) + 
  geom_point(aes(color = category,
                 size = area)) + 
  labs(x = 'Ümumi Əhali',
       y = 'Əhalinin sıxlığı',
       title = 'Əhalilərin dağılma sıxlığı haqqında məlumat',
       subtitle = 'Scatterplot') + 
  scale_x_continuous(breaks = waiver()) + 
  scale_y_continuous(breaks = seq(0, 100000, 25000)) + 
  facet_grid(state ~ .)

t1_scattle %>% ggplotly()
  

# 2. ----
# "percollege" dəyişəninin "histogram"ını qur. "category" dəyişəninə görə rənglə. 
# "labs" və "scale" əlavə et. "ggplotly" ilə vizuallaşdır.

t2_hist <- data %>% 
  ggplot(aes(percollege)) +
  geom_histogram(aes(fill = category), 
                 color = 'black') +
  labs(x = 'Percollege',
       y = 'Say',
       title = 'Say ve Percollege asililigi') + 
  scale_x_continuous(breaks = waiver()) +
  scale_y_continuous(breaks = waiver())
  
t2_hist %>% ggplotly()


# 3. ----
# "poptotal" dəyişəninin "boxplot"unu qur. "state" dəyişəninə görə rənglə. "labs" əlavə et.
# "ggplotly" ilə vizuallaşdır.

t3_box <- data %>% 
  ggplot(aes(y = poptotal, color = state)) +
  geom_boxplot(size = 1)

t3_box %>% ggplotly()


# 4. ----
# Yuxarıdakı plotları "dashboard"a səliqəli şəkildə yığ. (Yəni bir qrafikə yığ).

new_graph <- (t1_scattle + t2_hist + t3_box) +
  plot_layout(nrow = 3, byrow = T) 


# 5. ----
# "poptotal" və "popdensity" dəyişənlərinin "scatterplot"unu "highcharter" ilə qur. 
# "category" dəyişəninə görə qruplaşdır. 

library(highcharter)

data %>% 
  group_by(category) %>% 
  hchart('scatter', hcaes(x = poptotal, y = popdensity)) %>% 
  hc_colors(color = 'green') %>% 
  hc_xAxis(visible = T) %>% 
  hc_yAxis(visible = T) %>% 
  hc_title(text = 'Ehalilerin sixliqlarinin qrafiki')

