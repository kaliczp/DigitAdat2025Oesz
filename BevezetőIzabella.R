## Galandfere.xlsx mappába másolása
dir() # Ellenőrzöm, hogy sikerüólt-e a másolás
# install.packages("readxl") # Telepítés, ha kell a kommentet törölni
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
## A numerikus változó esetében a summary dolgainak megjelenítése
boxplot(Galand$Homérséklet)
quantile(Galand$Homérséklet) # kvantilisek a boxplothoz
## Boxplot dobozának szélessége az inter-kvartilis terjedelem
IQR(Galand$Homérséklet)
## Normalitáshoz Q-Q plot
qqnorm(Galand$Homérséklet)
qqline(Galand$Homérséklet) # alsó- felső kvartilisen átmenő egyenes
hist(Galand$Homérséklet) # Hisztogram elemszám
hist(Galand$Homérséklet, freq = FALSE) # területe = 1
lines(density(Galand$Homérséklet), lwd = 2) # Sűrűség fv. becslése
## Ha bizonytalan vagyok érdemes megnézni,
## hogy hasonló méretű normális eloszlású adatsor hogyan néz ki?
GeneraltNorm <- rnorm(nrow(Galand))
hist(GeneraltNorm, freq = FALSE) # hisztogram alapján is látszik, hogy szép szimmetrikus
lines(density(GeneraltNorm), lwd = 2) # Sűrűség fv. becslése

qqnorm(GeneraltNorm)
qqline(GeneraltNorm)


## Megjelenési dinamika és mi hat rá. Időben, évszakban, hónapban.
