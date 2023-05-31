library(tidyquant)
library(dplyr)

prices <- c(
  "VALE3", "BRAP4", "BBAS3", "RENT3", "GGBR4",
  "NTCO3", "CIEL3", "SANB11", "TOTS3", "PETR4",
  "ENBR3"
) %>%
  paste0(".SA") %>%
  tq_get(get = "stock.prices", from = "2010-01-01") %>%
  mutate(symbol = sub(".SA","", symbol))

write.table(prices, "prices.csv", sep = ",", row.names = FALSE)

prices <- read.csv("C:/Users/netop/r_project/dashboard/prices.csv") %>%
  mutate(date = as.Date(date))

tabela_periodo <- data.frame(
  periodo = c("1M", "6M", "1A", "10A"),
  dias = c(30, 180, 365, 3650)
)
