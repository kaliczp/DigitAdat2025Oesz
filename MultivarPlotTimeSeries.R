library(readxl)
Tes202504 <- as.data.frame(read_excel("Hydrocarpath2025_plots_KG.xlsx"))
library(xts)
Sys.setenv(TZ="UTC")
Tes202504.xts <- xts(Tes202504[,-(1:2)], Tes202504[,2])

## Ábra gyártás
par(las=1, mar = c(3.1,4.1,0.6,4.1))
plot.zoo(Tes202504.xts['2025-04-13/2025-04-22',4],
         type = "n",
         ylim = c(0,22),
         xlab = "", ylab = "Temperature ďegC",
         xaxs="i", yaxs="i")
grid(nx = NA, ny = NULL)
lines(as.zoo(Tes202504.xts['2025-04-13/2025-04-22',4]),
      col="red", lwd = 2)
lines(as.zoo(Tes202504.xts['2025-04-13/2025-04-22',3]),
      lend = 1,
      col="blue", lwd = 5, type = "h")
par(new = TRUE, mar = c(3.1,4.1,0.6,4.1))
plot.zoo(Tes202504.xts['2025-04-13/2025-04-22', 1],
         col = "orange", lwd = 2,
         xlab = "", ylab = "",
         ylim = c(7.6,9.5),
         yaxt = "n",
         xaxs="i", yaxs="i")
lines(as.zoo(Tes202504.xts['2025-04-13/2025-04-22', 2]),
         col = "green", lwd = 2,
         ylim = c(7.6,9.5),
         xaxs="i", yaxs="i")
axis(4)
par(xpd = TRUE) #Draw outside plot area
text(x = ISOdatetime(2025,4,23,6,0,0), y = 8.5, "Strength", srt = 270)



mtext("Tension", 4, 3, las = 0)
