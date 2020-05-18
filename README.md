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

# BARPLOT BY DEPT
> pal <- wes_palette("Zissou1", 10, type = "continuous")
> deptsorted <- c(5, 8, 16, 20, 20, 33, 38, 59, 78, 107)
> par(mar=c(5.1,10, 4.1, 2.1))
> b <- barplot(deptsorted, names.arg=c("Surgical Subspecialty", "Anesthesia", "Medicine Subspecialty", "Other pulled IM/ICU", "Family Medicine", "Surgery", "Internal Medicine", "Pulm/Critical Care", "Emergency Dept","Other"), col = pal, main="Department", xlab="Count", horiz = TRUE, las=2, xlim=c(0,120))
> text(y=b, x=deptsorted, pos=4, labels=deptsorted) 

# BARPLOT BY SETTING
> pal <- wes_palette("Zissou1", 9, type = "continuous")
> setsorted <- c(1, 5,10, 16, 21, 21, 83, 98, 132)
> par(mar=c(5.1,10, 4.1, 2.1))
> b <- barplot(setsorted, names.arg=c("Urgent Care", "Telemedicine", "Operating Room", "Outpatient", "Other", "Stepdown Unit", "Emergency Department", "Intensive Care", "Inpatient Floor"), col=pal, main="Setting", xlab="Count", horiz = TRUE, las=2, xlim=c(0,150))
> text(y=b, x=setsorted, pos=4, labels=setsorted) 
