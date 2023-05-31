library(tidyquant)
library(dplyr)

# prices_crypto <- tq_get(c(
#   "BTC-USD", "ETH-USD", "USDT-USD", "BNB-USD", "USDC-USD",
#   "XRP-USD", "ADA-USD", "DOGE-USD", "LTC-USD", "MATIC-USD",
#   "SHIB-USD"
# ), from = "2011-12-15",
# to = "2023-05-28") %>%
#   select(date, symbol, close) %>%
#   mutate(symbol = sub("-USD", "", symbol))
#
# write.table(prices_crypto, "crypto.csv", sep = ",", row.names = FALSE)
#
# prices_crypto <- read.csv("C:/Users/netop/r_project/dashboard/crypto.csv") %>%
#   mutate(date = as.Date(date))
#
# tabela_periodo <- data.frame(
#   periodo = c("1M", "6M", "1A", "10A"),
#   dias = c(30, 180, 365, 3650)
# )

prices_crypto <- c(
  "BTC", "ETH", "USDT", "BNB", "USDC",
  "XRP", "ADA", "DOGE", "LTC", "MATIC",
  "SHIB"
) %>%
  paste0("-USD") %>%
  tq_get(get = "stock.prices", from = "2010-01-01") %>%
  mutate(symbol = sub("-USD","", symbol))

write.table(prices_crypto, "prices_crypto.csv", sep = ",", row.names = FALSE)

prices_crypto <- read.csv("C:/Users/netop/r_project/dashboard/prices_crypto.csv") %>%
  mutate(date = as.Date(date))

tabela_periodo <- data.frame(
  periodo = c("1M", "6M", "1A", "10A"),
  dias = c(30, 180, 365, 3650)
)
