## Galandfere.xlsx mappába másolása
dir() # Ellenőrzöm, hogy sikerüólt-e a másolás
install.packages("readxl") # Telepítés
library(readxl) # Csomag betöltése
search() # betöltött csomagok (keresési útvonal)
ls() # munkakörnyezetben szereplő objektumok
Galand <- as.data.frame(read_excel("Galandfereg.xlsx",4)) # A munkalap megnevezésével
str(Galand) # adatok áttekintése
Galand$Faj # Változó kiválasztása
Galand$"Hullatek faj" # Szóközzel az oszlopnév idézőjelbe
factor(Galand$Faj) # Faktorrá alakítás
Galand$Faj <- factor(Galand$Faj) # A faktor mentése az adatbázisba
str(Galand) # Ellenőrzés
summary(Galand)
summary(Galand$Faj)
summary(Galand$darab)
summary(Galand$Homérséklet)
## Megjelenési dinamika és mi hat rá. Időben, évszakban, hónapban.
