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
kk12 <- as.data.frame(read_excel("kőriskárok 2012 2024.xlsx")) ## Alapértelmezetten az első munkalap (sheet)
str(kk12) # Struktúra
summary(kk12) ## Összefoglalás, mindne objektumon működik
kk13 <- as.data.frame(read_excel("kőriskárok 2012 2024.xlsx", 2)) ## Második munkalap (sheet)
summary(kk13) ## Összefoglalás a másodi objektumról
kk14 <- as.data.frame(read_excel("kőriskárok 2012 2024.xlsx", "2014")) ## harmadik munkalap argumentum hivatkozásnélkül szövegként
kk15 <- as.data.frame(read_excel("kőriskárok 2012 2024.xlsx", sheet = "2015")) ## harmadik munkalap argumentum hivatkozással szövegként
summary(kk15)
names(kk15) # nevek
boxplot(kk15[,c(9,10)]) # Doboz ábra indexeléssel
boxplot(kk15[,c("Gyakoriság", "Kárerély")]) # Doboz ábra indexeléssel név alapján
boxplot(kk14[,c("Gyakoriság", "Kárerély")]) # Csak az objektum nevet írom át
boxplot(kk13[,c("GYAKORISAG", "KARERELY")]) # Csak az objektum nevet írom át
kk16 <- as.data.frame(read_excel("kőriskárok 2012 2024.xlsx", sheet = "2016")) ## harmadik munkalap argumentum hivatkozással szövegként
boxplot(kk16[,c("Gyakoriság", "Kárerély")])

## Beolvasás újra
ev <- 13
    assign(paste0("kk", ev), as.data.frame(read_excel("kőriskárok 2012 2024.xlsx", sheet = paste0("20",ev))))
for(ev in 14:24) {
    assign(paste0("kk", ev), as.data.frame(read_excel("kőriskárok 2012 2024.xlsx", sheet = paste0("20",ev))))
}

par(mfrow = c(4,3))
for(ev in 13:24) {
    boxplot(get(paste0("kk",ev))[,9:10], main = paste0("20",ev))
}

## Kőrispusztulás / év
par(mfrow = c(4,3), mar=c(0.5,0.5,3.1,0.5))
for(ev in 13:24) {
    akt_summ <- summary(factor(get(paste0("kk",ev))[,7]))
    pie(akt_summ, labels = names(akt_summ), main = paste0("20",ev))
}

ev <- 13
akt_summ <- summary(factor(get(paste0("kk",ev))[,7]))
akt_table <- as.data.frame(akt_summ)
names(akt_table) <- paste0("db",ev)
akt_table$Kod <- row.names(akt_table)
fin_table <- akt_table
## Táblázatosan
for(ev in 14:24) {
    akt_summ <- summary(factor(get(paste0("kk",ev))[,7]))
    akt_table <- as.data.frame(akt_summ)
    names(akt_table) <- paste0("db",ev)
    akt_table$Kod <- row.names(akt_table)
    fin_table <- merge(fin_table, akt_table, by = "Kod", all = TRUE)
}
write.csv2(fin_table, "fin_table.csv")
