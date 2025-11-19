tempSopron <- read.table("ta_h_Sopron_18702023.csv", sep = ";", head = TRUE)
plot(tempSopron$ta, type = "l", xaxs = "i", col = "red")
## Leíró stat
boxplot(tempSopron$ta)
quantile(tempSopron$ta)
hist(tempSopron$ta)
mean(tempSopron$ta)
plot(tempSopron[1:3650,1:2]) # Ezt a dátum formát nem jó számként használni
## Mielőtt elemzem, megcsinálom az index sort
tempSopron$Index <- 1:nrow(tempSopron)
## Ábrázolás az Indexszel
plot(tempSopron[1:3650,c(4,2)], type = "l") # Ezt a dátum formát nem jó számként használni
plot(ta ~ Index, tempSopron, type = "l")
## Regressziós trend
lm(ta ~ Index, data = tempSopron)
abline(9.194e+00, 3.198e-05)
## lineáris modell eredmény objektuma
tempSopron.lm <- lm(ta ~ Index, data = tempSopron)
tempSopron.lm
str(tempSopron.lm) # Mi is van az objektumban?
tempSopron.lm$coefficients
plot(tempSopron.lm$residuals) # Maradékok
boxplot(tempSopron.lm$residuals) # Maradékok
qqnorm(tempSopron.lm$residuals)
qqline(tempSopron.lm$residuals)
plot(names(fitted(tempSopron.lm)), fitted(tempSopron.lm)) # Maga az illesztett modell (itt egyenes)
coef(tempSopron.lm)[2]*365*100 # A meredekségből 100 évre jutó emelkedés
plot(tempSopron.lm)# Diagnosztikai ábrák
summary(tempSopron.lm)# Összefoglalás
tempSopron.lmsum <- summary(tempSopron.lm)# Összefoglalás
str(tempSopron.lmsum)
tempSopron.lmsum$r.squared
## Csináljunk igazi idősort!
SopDatum <- as.Date(as.character(tempSopron[,1]), format = "%Y%m%d") # Dátum formátum importáláa
head(SopDatum) # így látjuk
deparse(head(SopDatum)) # Valójában egy szám csak, amit formáz az R
plot(SopDatum, tempSopron$ta, lty="l")
## Van erre külön csomag
inastall.packages("xts")
library(xts)
tempSop.xts <- xts(tempSopron$ta, SopDatum)
tempSop.xts
plot(tempSop.xts)
plot(tempSop.xts['1973'])
