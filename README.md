# covid
COVID dermatoses R code #
covid <- read.csv(file.choose(), header=T)
attach(covid)
head(covid)
summary(covid)

library(ggplot2)
ggplot(covid, aes(ppe_hours, handsan_times, colour = occ)) +
+   geom_point()
barplot(covid$ppe_hours)
hist(covid$ppe_hours, breaks = 10)


# BARPLOT BY OCCUPATION 
> library(wesanderson)
> pal <- wes_palette("Zissou1", 14, type = "continuous")> occ.sorted <- c(2, 3, 3, 3, 6, 6, 7, 7, 10, 21, 22, 24, 28, 247)
> par(mar=c(5.1,10, 4.1, 2.1))
> b <- barplot(occ.sorted, names.arg=c("Social Worker", "Medical Assistant", "CRNA", "Case Manager", "Intern", "Fellow", "Physician Assistant", "Pharmacist", "Respiratory Therapist","Nursing Assistant", "Attending", "Other", "Resident", "Nurse"), col = pal, main="Occupation", xlab="Count", horiz = TRUE, las=2, xlim=c(0,275))
> occ.sorted <- c(2, 3, 3, 3, 6, 6, 7, 7, 10, 21, 22, 24, 28, 247)
> text(y=b, x=occ.sorted, pos=4, labels=occ.sorted) #YESYESYES
