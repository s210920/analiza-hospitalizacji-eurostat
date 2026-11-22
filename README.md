Analiza hospitalizacji w Polsce w latach 2010–2021

1. Temat projektu

Celem projektu jest analiza hospitalizacji w Polsce w latach 2010–2021 z uwzględnieniem wieku, płci oraz głównego rozpoznania chorobowego.

2. Źródło danych

Dane pochodzą z publicznej bazy statystycznej Eurostat.

- Zbiór danych: `hlth_co_disch2`
- Nazwa zbioru: Hospital discharges by diagnosis, in-patients, per 100 000 inhabitants
- Kraj: Polska
- Zakres lat: 2010–2021
- Jednostka miary: liczba wypisów ze szpitala na 100 000 mieszkańców

Źródło: https://ec.europa.eu/eurostat/databrowser/view/hlth_co_disch2/default/table

3. Zakres analizy

Analiza obejmuje:
- 19 wybranych grup chorób według klasyfikacji ICD-10,
- 21 grup wiekowych,
- dwie kategorie płci: kobiety i mężczyźni,
- okres 2010–2021.

Z analizy wyłączono kategorię dotyczącą ciąży, porodu i połogu, ponieważ nie dotyczy ona obu płci.

4. Opis grup chorób

W analizie wykorzystano 19 grup chorób i problemów zdrowotnych opartych na klasyfikacji ICD-10:

Kod

Opis grupy chorób

A_B Niektóre choroby zakaźne i pasożytnicze

C00-D48 Nowotwory

D50-D89 Choroby krwi i narządów krwiotwórczych oraz niektóre zaburzenia dotyczące mechanizmów odpornościowych

E Choroby układu hormonalnego, zaburzenia odżywiania i przemiany metabolicznej

F Zaburzenia psychiczne i zaburzenia zachowania

G Choroby układu nerwowego

H00-H59 Choroby oka i przydatków oka

H60-H95 Choroby ucha i wyrostka sutkowatego

I Choroby układu krążenia

J Choroby układu oddechowego

K Choroby układu pokarmowego

L Choroby skóry i tkanki podskórnej

M Choroby układu mięśniowo-szkieletowego i tkanki łącznej

N Choroby układu moczowo-płciowego

P Niektóre stany rozpoczynające się w okresie okołoporodowym

Q Wady rozwojowe wrodzone, zniekształcenia i aberracje chromosomowe

R Objawy, oznaki i nieprawidłowe wyniki badań, niesklasyfikowane gdzie indziej

S_T Urazy, zatrucia i inne określone skutki działania czynników zewnętrznych

Z Czynniki wpływające na stan zdrowia i kontakt ze służbą zdrowia

Z analizy wyłączono grupę O, obejmującą ciążę, poród i połóg, ponieważ nie dotyczy ona obu analizowanych płci.

4. Przygotowanie danych

Dane zostały pobrane bezpośrednio z Eurostatu przy użyciu pakietu `eurostat` w języku R.

Następnie przeprowadzono:
- wybór danych dotyczących Polski i analizowanego okresu,
- wybór grup chorób i grup wiekowych,
- ograniczenie danych do kobiet i mężczyzn,
- przekształcenie tabeli do postaci szerokiej,
- kontrolę podstawowej poprawności danych,
- zapis przygotowanego zbioru do pliku CSV.

5. Struktura repozytorium

`01_pobranie_i_przygotowanie_danych.R`  Skrypt pobierający i przygotowujący dane 
`dane_surowe.csv`  Dane pobrane z Eurostatu 
`dane_analityczne.csv`  Dane przygotowane do dalszej analizy 
`.gitignore`  Pliki wyłączone z kontroli wersji 
`.Rproj`  Plik projektu RStudio 

6. Informacje o danych i ograniczenia

Wartości w zbiorze oznaczają wypisy ze szpitala, a nie liczbę unikalnych pacjentów. Jedna osoba może być hospitalizowana więcej niż jeden raz.
Dane dotyczą głównego rozpoznania chorobowego i są przedstawione jako wskaźniki na 100 000 mieszkańców.
Zbiór obejmuje dane historyczne do 2021 roku.
