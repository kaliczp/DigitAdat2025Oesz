tempSopron <- read.table("ta_h_Sopron_18702023.csv", sep = ";", head = TRUE)
plot(tempSopron$ta, type = "l")
