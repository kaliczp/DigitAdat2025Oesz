library(readxl)
Tes202504 <- as.data.frame(read_excel("Hydrocarpath2025_plots_KG.xlsx"))
library(xts)
Sys.setenv(TZ="UTC")
Tes202504.xts <- xts(Tes202504[,-(1:2)], Tes202504[,2])

## Ábra gyártás
Sys.setenv(LANG = "en_US.UTF-8")

png("TensileTR202504.png", width= 28.2, height= 6.7, units = "cm", res = 300, pointsize = 10)
par(las=1, mar = c(2.1,4.1,0.6,4.1))
plot.zoo(Tes202504.xts['2025-04-13/2025-04-22',4],
         type = "n",
         xaxt = "n",
         ylim = c(0,22),
         xlab = "", ylab = "",
         xaxs="i", yaxs="i")
axis.POSIXct(1,at = c(ISOdate(2025,4,13:22,0,0),ISOdate(2025,4,22,23,00)), labels = FALSE)
axis(1, at = ISOdate(2025,4,13:22), tck = 0, labels = paste(13:22, "Apr."), mgp = c(3,0.5,0) )
grid(nx = NA, ny = NULL)
mtext("Temperature", 2, 3, at = 15, las = 0)
mtext("[°C]", 2, 2, at = 15, las = 0)
mtext("Precipitation", 2, 3, at = 2.5, las = 0)
mtext("[mm/hours]", 2, 2, at = 2.5, las = 0)
lines(as.zoo(Tes202504.xts['2025-04-13/2025-04-22',4]),
      col="red", lwd = 2)
lines(as.zoo(Tes202504.xts['2025-04-13/2025-04-22',3]),
      lend = 1,
      col="blue", lwd = 5, type = "h")
par(new = TRUE)
plot.zoo(Tes202504.xts['2025-04-13/2025-04-22', 1],
         col = "orange", lwd = 2,
         xlab = "", ylab = "",
         ylim = c(7.4,9.6),
         xaxt = "n", yaxt = "n",
         xaxs="i", yaxs="i")
lines(as.zoo(Tes202504.xts['2025-04-13/2025-04-22', 2]),
         col = "green", lwd = 2,
         xaxs="i", yaxs="i")
axis(4, at = c(7.9,8.4,8.9,9.4))
mtext("Tension [mA]", 4, 3, las = 0)
legend(ISOdate(2025,4,20), y = 8.5, legend = c("Temp.","Prec.", "Tés 1", "Tés 2"), lwd = c(2,4,2,2),
       ncol = 2,
       col = c("red", "blue", "orange", "green"))
dev.off()
