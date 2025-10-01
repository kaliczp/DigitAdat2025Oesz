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
str(kk24)
kk24 = read.table("kőriskárok 2012 2024.csv", sep = ";", head = T)
str(kk24)
kk24 = read.table("kőriskárok 2012 2024.csv", sep = ";", head = T, dec = ",")
kk24 <- read.table("kőriskárok 2012 2024.csv", sep = ";", head = T, dec = ",")
