library(readxl)
Tes202504 <- as.data.frame(read_excel("Hydrocarpath2025_plots_KG.xlsx"))
library(xts)
Sys.setenv(TZ="UTC")
Tes202504.xts <- xts(Tes202504[,-(1:2)], Tes202504[,2])

## Ábra gyártás
plot.zoo(Tes202504.xts['2025-04-13/2025-04-22',4])
