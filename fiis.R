library(rvest)

site <- "https://fundamentus.com.br/fii_resultado.php"

fii <- read_html(site) %>%
  html_table()

fii <- fii[[1]] %>%
  select(
    Papel, Segmento, Cotação, 'Dividend Yield', 'P/VP',
    'Valor de Mercado', Liquidez, 'Vacância Média'
  ) %>%
  mutate(
    across(Cotação: 'Vacância Média', gsub, pattern = "\\.|%", replacement = ""),
    across(Cotação: 'Vacância Média', gsub, pattern = ",", replacement = "."),
    across(Cotação: 'Vacância Média', as.numeric)
  )
