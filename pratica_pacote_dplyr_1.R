
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
            n())
