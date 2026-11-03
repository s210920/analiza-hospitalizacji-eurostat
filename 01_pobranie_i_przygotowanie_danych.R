# PROJEKT: Analiza hospitalizacji w Polsce w latach 2010–2021
# Źródło danych: Eurostat
# Zbiór danych: hlth_co_disch2

# 1. Wczytanie bibliotek 

library(eurostat)
library(dplyr)
library(tidyr)
library(readr)


# 2. Pobranie danych z Eurostatu 

# Pobieramy dane dotyczące hospitalizacji w Polsce w latach 2010–2021

dane <- get_eurostat(
  id = "hlth_co_disch2",
  filters = list(
    geo = "PL",
    time = 2010:2021
  )
)


# 3. Wybór analizowanych grup chorób 

# Wybieramy 19 głównych grup rozpoznań

grupy_chorob <- c(
  "A_B", "C00-D48", "D50-D89", "E", "F",
  "G", "H00-H59", "H60-H95", "I", "J",
  "K", "L", "M", "N", "P", "Q", "R", "S_T", "Z"
)


# 4. Wybór grup wiekowych 

# Wybieramy przedziały wieku, które się nie nakładają

grupy_wiekowe <- c(
  "Y_LT1", "Y1-4", "Y5-9", "Y10-14",
  "Y15-19", "Y20-24", "Y25-29", "Y30-34",
  "Y35-39", "Y40-44", "Y45-49", "Y50-54",
  "Y55-59", "Y60-64", "Y65-69", "Y70-74",
  "Y75-79", "Y80-84", "Y85-89", "Y90-94",
  "Y_GE95"
)


# 5. Przygotowanie tabeli analitycznej 

dane_analityczne <- dane %>%
  filter(
    icd10 %in% grupy_chorob,
    age %in% grupy_wiekowe,
    sex %in% c("F", "M")
  ) %>%
  select(
    time,
    age,
    sex,
    icd10,
    values
  ) %>%
  pivot_wider(
    names_from = icd10,
    values_from = values
  ) %>%
  arrange(time, age, sex) %>%
  rename(
    rok = time,
    grupa_wiekowa = age,
    plec = sex
  )


# 6. Podstawowa kontrola danych 

# Sprawdzenie liczby wierszy i kolumn
dim(dane_analityczne)

# Sprawdzenie nazw kolumn
names(dane_analityczne)

# Sprawdzenie brakujących wartości
colSums(is.na(dane_analityczne))

# Sprawdzenie duplikatów.
sum(duplicated(dane_analityczne[c(
  "rok", "grupa_wiekowa", "plec"
)]))


# 7. Zapis danych do pliku CSV 

write_csv(
  dane_analityczne,
  "dane_analityczne.csv"
)
