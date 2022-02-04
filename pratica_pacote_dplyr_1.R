
# Prática com o pacote dplyr ---------------------------------------------------------------------------------------------------------------

# Autora: Jeanne Franco --------------------------------------------------------------------------------------------------------------------

# Data: 03/02/2022 -------------------------------------------------------------------------------------------------------------------------

dados <- datasets::ChickWeight
dados
View(dados)

library(dplyr)

# Peso médio por tipo de dieta -------------------------------------------------------------------------------------------------------------

dados %>%
  select(weight, Diet) %>% #
  group_by(Diet) %>% # Sem o group_by é retornado a média total dos pesos
  summarise(mean(weight),
            sd(weight),
            n()) %>%
  arrange() # Agrupa do maior para o menor peso

# Peso médio para cada tempo --------------------------------------------------------------------------------------------------------------------

dados %>%
  select(weight, Time) %>%
  group_by(Time) %>% 
  summarise(mean(weight),
            sd(weight),
            n()) %>%
  arrange()

# Peso médio por indivíduo -----------------------------------------------------------------------------------------------------------------

dados %>%
  select(weight, Chick) %>%
  group_by(Chick) %>% 
  summarise(mean(weight),
            sd(weight),
            n()) %>%
  arrange()

# Gráfico ----------------------------------------------------------------------------------------------------------------------------------

library(ggplot2)

d1 <- dados %>%
  select(weight, Diet) %>% #
  group_by(Diet) %>% # Sem o group_by é retornado a média total dos pesos
  summarise(media = mean(weight),
            desvio = sd(weight),
            n = n()) %>%
  arrange() # Agrupa do maior para o menor peso
d1

ggplot(d1, aes(x = Diet, y = media)) +
  geom_col()

d2 <- dados %>%
  select(weight, Time) %>% #
  group_by(Time) %>% # Sem o group_by é retornado a média total dos pesos
  summarise(media = mean(weight),
            desvio = sd(weight),
            n = n()) %>%
  arrange() # Agrupa do maior para o menor peso
d2

d2$Time <- as.factor(d2$Time)

ggplot(d2, aes(x = Time, y = media)) +
  geom_col()
