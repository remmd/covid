# covid
COVID dermatoses R code #
covid <- read.csv(file.choose(), header=T)
attach(covid)
head(covid)
summary(covid)

library(ggplot2)
ggplot(covid, aes(ppe_hours, handsan_times, colour = occ)) +
+   geom_point()
barplot(covid2$ppe_hours)
hist(covid2$ppe_hours, breaks = 10)
