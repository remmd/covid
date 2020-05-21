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
library(wesanderson)
pal <- wes_palette("Zissou1", 14, type = "continuous")> occ.sorted <- c(2, 3, 3, 3, 6, 6, 7, 7, 10, 21, 22, 24, 28, 247)
par(mar=c(5.1,10, 4.1, 2.1))
b <- barplot(occ.sorted, names.arg=c("Social Worker", "Medical Assistant", "CRNA", "Case Manager", "Intern", "Fellow", "Physician Assistant", "Pharmacist", "Respiratory Therapist","Nursing Assistant", "Attending", "Other", "Resident", "Nurse"), col = pal, main="Occupation", xlab="Count", horiz = TRUE, las=2, xlim=c(0,275))
occ.sorted <- c(2, 3, 3, 3, 6, 6, 7, 7, 10, 21, 22, 24, 28, 247)
text(y=b, x=occ.sorted, pos=4, labels=occ.sorted) #YESYESYES

# BARPLOT BY DEPT
pal <- wes_palette("Zissou1", 10, type = "continuous")
deptsorted <- c(5, 8, 16, 20, 20, 33, 38, 59, 78, 107)
par(mar=c(5.1,10, 4.1, 2.1))
b <- barplot(deptsorted, names.arg=c("Surgical Subspecialty", "Anesthesia", "Medicine Subspecialty", "Other pulled IM/ICU", "Family Medicine", "Surgery", "Internal Medicine", "Pulm/Critical Care", "Emergency Dept","Other"), col = pal, main="Department", xlab="Count", horiz = TRUE, las=2, xlim=c(0,120))
text(y=b, x=deptsorted, pos=4, labels=deptsorted) 

# BARPLOT BY SETTING
pal <- wes_palette("Zissou1", 9, type = "continuous")
setsorted <- c(1, 5,10, 16, 21, 21, 83, 98, 132)
par(mar=c(5.1,10, 4.1, 2.1))
b <- barplot(setsorted, names.arg=c("Urgent Care", "Telemedicine", "Operating Room", "Outpatient", "Other", "Stepdown Unit", "Emergency Department", "Intensive Care", "Inpatient Floor"), col=pal, main="Setting", xlab="Count", horiz = TRUE, las=2, xlim=c(0,150))
text(y=b, x=setsorted, pos=4, labels=setsorted) 


# DX HORIZ STACKED
par(mar=c(5.1, 10, 4.1, 3.1))
pal <- wes_palette("Zissou1", 3, type = "continuous")
df <- data.frame(trich=c(0,1,1), hs=c(0,2,1), hyperhidrosis=c(0,1,4), foll=c(1,4,1), pod=c(0,1,5), tincorp=c(0,7,0), tinvers=c(0,6,2), sebderm=c(0,5,6), pso=c(0,8,4), alo=c(1,7,4), tinped=c(2,20,4), handderm=c(0,6,23), ros=c(0,14,17), urt=c(1,26,7), ad=c(0,25,33), contact=c(0,22,38), acne=c(4,19,56))
colnamesrev <- c("Acne", "Contact Dermatitis", "Atopic Dermatitis", "Urticaria", "Rosacea", "Hand Dermatitis", "Tinea Pedis", "Psoriasis", "Alopecia", "Seborrheic Dermatitis", "Tinea Versicolor", "Tinea Corporis", "Folliculitis", "Perioral Dermatitis", "Hyperhidrosis", "Hidradenitis Suppurativa", "Trichotillomania")
colnames <-rev(colnamesrev)
colnames(df) <-colnames
barplot(as.matrix(df), main="Existing Diagnoses", col=pal, xlab="Count", xlim=c(0,90), horiz=TRUE, las=2)
b <- barplot(as.matrix(df), main="Existing Diagnoses", col=pal, xlab="Count", xlim=c(0,90), horiz=TRUE, las=2)
dxtotals=c(2,3,5,6,6,7,8,11,12,12,26,29,31,34,58,60,79)
text(y=b, x=dxtotals, pos=4, labels=dxtotals)
legend("right", c("Better", "No Change", "Worse"), fill=pal)

# SYMPTOMS BY LOCATION STACKED BAR
pal <- wes_palette(“Zissou1”, 8, type=“continuous”)
df <- data.frame(hand=c(250, 321, 140, 173, 22, 146, 107, 25), face=c(225,168,64,99,187,17,87,62), body=c(74,101,27,58,34,12,20,47), scalp=c(30,63,36,60,12,1,11,13))
head(df)
rownames(df) <- c("red", "dry", "peel", "itch", "pimples", "crack", "pain", "sweat")
#OR
rownames(df) <- c("Redness, irritation", "Dryness, roughness", "Peeling, flaking", "Itch, burning", "Pimples, pustules", "Cracking, bleeding", "Pain", "Excess sweat")
colnames(df) <- c("Hands", "Face", "Body", "Scalp")
barplot(as.matrix(df), main="Symptoms by Location", xlab="Location", ylab="Count", ylim=c(0,1200), col=pal)
legend("topright", c("Redness, irritation", "Dryness, roughness", "Peeling, flaking", "Itch, burning", "Pimples, pustules", "Cracking, bleeding", "Pain", "Excess sweat"), fill=pal)

# SYMPTOMS LOCATION GROUPED BAR
par(mar=c(5.1, 4.1, 4.1, 2.1))
pal <- wes_palette("Zissou1", 8, type = "continuous")
df <- data.frame(Hands=c(250, 321, 140, 173, 22, 146, 107, 25), Face=c(225,168,64,99,187,17,87,62), Body=c(74,101,27,58,34,12,20,47), Scalp=c(30,63,36,60,12,1,11,13))
barplot(as.matrix(df), main="Symptoms by Location", xlab="Location", ylab="Count", ylim=c(0,350), col=pal, beside=TRUE)
legend("topright", c("Redness, irritation", "Dryness, roughness", "Peeling, flaking", "Itch, burning", "Pimples, pustules", "Cracking, bleeding", "Pain", "Excess sweat"), fill=pal)


# SYMPTOMS PPE GROUPED BAR
pal <- wes_palette("Zissou1", 7, type = "continuous")
df <- data.frame( SurgMask=c(182,148,9,30,25,24,63), N95=c(251,151,56,87,31,44,137), FaceShield=c(116,49,19,20,4,9,96), Glasses=c(18,8,3,4,0,2,13), Gloves=c(78,84,1,10,22,6,9), Gown=c(22,27,0,2,9,2,3))
barplot(as.matrix(df), main="Symptoms by PPE Type", xlab="PPE", ylab="Count", col=pal, cex.names=0.75, beside=TRUE)
legend("topright", c("Redness", "Itching", "Bruising", "Discoloration", "Persistent rash", "Blisters, erosions, scabs", "Pain"), fill=pal)

# SYMPTOMS PPE STACKED BAR
pal <- wes_palette("Zissou1", 7, type = "continuous")
df <- data.frame( SurgMask=c(182,148,9,30,25,24,63), N95=c(251,151,56,87,31,44,137), FaceShield=c(116,49,19,20,4,9,96), Glasses=c(18,8,3,4,0,2,13), Gloves=c(78,84,1,10,22,6,9), Gown=c(22,27,0,2,9,2,3))
colnames(df) <- c("Surgical Mask", "N95 Mask", "Face Shield", "Eyewear", "Gloves", "Gown")
barplot(as.matrix(df), main="Symptoms by PPE Type", xlab="PPE", ylab="Count", ylim=c(0,900), cex.names=0.75, col=pal)
legend("topright", c("Redness", "Itching", "Bruising", "Discoloration", "Persistent rash", "Blisters, erosions, scabs", "Pain"), fill=pal)
