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
