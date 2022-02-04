
# Prática com o pacote dplyr ---------------------------------------------------------------------------------------------------------------

# Autora: Jeanne Franco --------------------------------------------------------------------------------------------------------------------

# Data: 03/02/2022 -------------------------------------------------------------------------------------------------------------------------

dados <- datasets::ChickWeight
dados
View(dados)

library(dplyr)

dados %>%
  select(weight, Diet) %>%
  group_by(Diet) %>% # Sem o group_by é retornado a média total dos pesos
  summarise(mean(weight),
            sd(weight),
            n())

dados %>%
  select(weight, Time) %>%
  group_by(Time) %>% 
  summarise(mean(weight),
            sd(weight),
            n())

dados %>%
  select(weight, Chick) %>%
  group_by(Chick) %>% 
  summarise(mean(weight),
            sd(weight),
            n())
