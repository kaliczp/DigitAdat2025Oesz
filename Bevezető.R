## Ez egy megjegyzés.
## Mappa kiválasztása a Fájl -> munkakönyvtár beállítása
dir()
## Az aktuális munkakönyvtár listázása a dir() függvénnyel.
## Ha újra akarom futtatni a kkor a föl gommbbal elérem a korábban begépelt parancsokat.
### Fájl beolvasás
## Ha valami újat csinálok, keresek segítséget.
help.start()
## Első próba Error
read.table("kőriskárok 2012 2024.csv")
## Második próba. Siker?
read.table("kőriskárok 2012 2024.csv", sep = ";")
## Hozzunk létre objektumot!
kk24 = read.table("kőriskárok 2012 2024.csv", sep = ";")
## Tudjunk meg többet a létrehozott kk24 objektumról.
str(kk24) # str() függvény a változókat írja a dollárjel után 
## Minden karakter. A fejléc szövege miatt.
?read.table # kézikönyv olvasása, vagy az Import/Export kézikönyvé
kk24 = read.table("kőriskárok 2012 2024.csv", sep = ";", head = T) # header argumentum beállítva rövidítve
kk24 = read.table("kőriskárok 2012 2024.csv", sep = ";", header = TRUE) # vagy teljesen kiírva
str(kk24) # Most már látszanak a fejléc nevek, de a tizedes vesszőnk nem lett felismerve
## Kézikönyv -> dec argumentumba meg kell adni a karaktert.
kk24 = read.table("kőriskárok 2012 2024.csv", sep = ";", head = T, dec = ",")
str(kk24) # Már amit kell számnak értelmez. int rövid egész, num racionális szám
## az = jellele egyenértékű a <-, azaz kisebb jel és kötőjel
kk24 <- read.table("kőriskárok 2012 2024.csv", sep = ";", head = T, dec = ",")

## Excel közvetlen beolvasása
## install.packages("readxl") # ha hibát jelez az alábbi, telepíteni kell a csomagot
library(readxl)
kk12 <- as.data.frame(read_excel("kőriskárok 2012 2024.xlsx"))
