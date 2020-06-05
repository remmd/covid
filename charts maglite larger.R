library(“viridis”) 

pal <- magma(7, alpha = 1, begin = 0.2, end = 1)   #color palette magma lite
“#A8327DFF"  #middle purple color

# Occupation barplot magma lite large font
par(mar=c(5.1,10.5, 4.1, 0.25))
pal <- magma(1, alpha = 1, begin = 0.5, end = 0.6)
occ.sorted <- c(2, 3, 3, 3, 6, 6, 7, 7, 10, 21, 22, 24, 28, 247)
b <- barplot(occ.sorted, names.arg=c("Social Worker", "Medical Asst.", "CRNA", "Case Manager", "Intern", "Fellow", "Physician Asst.", "Pharmacist", "Resp. Therapist","Nursing Asst.", "Attending", "Other", "Resident", "Nurse"), col = pal, main="Occupation", xlab="Count", horiz = TRUE, las=2, xlim=c(0,275), cex.axis=1.4, cex.lab=1.6, cex.names=1.6, cex.main=1.6)
text(y=b, x=occ.sorted, pos=4, labels=occ.sorted, cex=1.6)

# Dept barplot magma lite large font
par(mar=c(5.1,12, 3.0, 1))
pal <- magma(1, alpha = 1, begin = 0.5, end = 0.6)
deptsorted <- c(5, 8, 16, 20, 20, 33, 38, 59, 78, 107)
b <- barplot(deptsorted, names.arg=c("Surg. Subspecialty", "Anesthesia", "Med. Subspecialty", "Other to IM/ICU", "Family Med.", "Surgery", "Internal Med.", "Pulm./Crit.", "Emergency Dept.","Other"), col = pal, main="Department", xlab="Count", horiz = TRUE, las=2, xlim=c(0,120), cex.axis=1.6, cex.lab=1.6, cex.names=1.6, cex.main=1.6)
text(y=b, x=deptsorted, pos=4, labels=deptsorted, cex=1.6)

# Setting barplot magma lite large font
pal <- magma(1, alpha = 1, begin = 0.5, end = 0.6)
par(mar=c(5.1,12, 3.0, 1))
setsorted <- c(1, 5,10, 16, 21, 21, 83, 98, 132)
settingnames <- c("Urgent Care", "Telemedicine", "Operating Room", "Outpatient", "Other", "Stepdown Unit", "Emergency Dept", "Intensive Care", "Inpatient Floor")
b <- barplot(setsorted, names.arg=settingnames, col=pal, main="Setting", xlab="Count",  horiz = TRUE, las=2, xlim=c(0,150), cex.axis=1.6, cex.lab=1.6, cex.names=1.6, cex.main=1.6)
text(y=b, x=setsorted, pos=4, labels=setsorted, cex=1.6)

# Sx by location barplot magma lite large font
par(mar=c(5.1,5, 4.1, 2.1))
df <- data.frame(hand=c(250, 321, 140, 173, 22, 146, 107, 25), face=c(225,168,64,99,187,17,87,62), body=c(74,101,27,58,34,12,20,47), scalp=c(30,63,36,60,12,1,11,13))
pal <- magma(8, alpha = 1, begin = 0.2, end = 1)
rownames(df) <- c("Redness, irritation", "Dryness, roughness", "Peeling, flaking", "Itch, burning", "Pimples, pustules", "Cracking, bleeding", "Pain", "Excess sweat")
colnames(df) <- c("Hands", "Face", "Body", "Scalp")
barplot(as.matrix(df), main="Symptoms by Location", xlab="Location", ylab="Complaints", ylim=c(0,1200), col=pal, cex.axis=1.6, cex.lab=1.6, cex.names=1.6, cex.main=1.6)
legpal <- magma(8, alpha=1, begin=0.2, end=1, direction=-1)
sxs <- c("Excess sweat", "Pain", "Cracking, bleeding", "Pimples, pustules", "Itching, burning", "Peeling, flaking", "Dryness, roughnes", "Redness, irritation")
legend("topright", sxs, fill=legpal, cex=1.4)

# Sx by PPE barplot magma lite larger font
par(mar=c(5.1,5, 4.1, 2.1))
pal <- magma(7, alpha = 1, begin = 0.2, end = 1)
df <- data.frame( SurgMask=c(182,148,9,30,25,24,63), N95=c(251,151,56,87,31,44,137), FaceShield=c(116,49,19,20,4,9,96), Glasses=c(18,8,3,4,0,2,13), Gloves=c(78,84,1,10,22,6,9), Gown=c(22,27,0,2,9,2,3))
colnames(df) <- c("Surg. Mask", "N95", "Shield", "Eyewear", "Gloves", "Gown")
barplot(as.matrix(df), main="Symptoms by PPE Type", xlab="PPE", ylab="Complaints", ylim=c(0,900), col=pal, cex.axis=1.6, cex.lab=1.6, cex.names=1.3, cex.main=1.6)
sxs <-c("Pain", "Blisters, erosions, scabs", "Persistent rash", "Discoloration", "Bruising", "Itching", "Redness")
legpal <- magma(7, alpha=1, begin=0.2, end=1, direction=-1)
legend("topright", sxs, fill=legpal, cex=1.4)

# Dx Horizontal stacked magma lite inverse larger font
par(mar=c(5.1, 12, 4.1, 3.1))
pal <- magma(3, alpha = 1, begin = 0.5, end = 1, direction=-1)
df <- data.frame(trich=c(0,1,1), hs=c(0,2,1), hyperhidrosis=c(0,1,4), foll=c(1,4,1), pod=c(0,1,5), tincorp=c(0,7,0), tinvers=c(0,6,2), sebderm=c(0,5,6), pso=c(0,8,4), alo=c(1,7,4), tinped=c(2,20,4), handderm=c(0,6,23), ros=c(0,14,17), urt=c(1,26,7), ad=c(0,25,33), contact=c(0,22,38), acne=c(4,19,56))
colnamesrev <- c("Acne", "Contact Dermatitis", "Atopic Dermatitis", "Urticaria", "Rosacea", "Hand Dermatitis", "Tinea Pedis", "Psoriasis", "Alopecia", "Seb. Dermatitis", "Tinea Versicolor", "Tinea Corporis", "Folliculitis", "Perioral Dermatitis", "Hyperhidrosis", "Hidradenitis", "Trichotillomania")
colnames <-rev(colnamesrev)
colnames(df) <-colnames
barplot(as.matrix(df), main="Existing Diagnoses", col=pal, xlab="Count", xlim=c(0,90), horiz=TRUE, las=2)
b <- barplot(as.matrix(df), main="Existing Diagnoses", col=pal, xlab="Count", xlim=c(0,90), horiz=TRUE, las=2, cex.axis=1.5, cex.lab=1.5, cex.names=1.5, cex.main=1.6)
dxtotals=c(2,3,5,6,6,7,8,11,12,12,26,29,31,34,58,60,79)
text(y=b, x=dxtotals, pos=4, labels=dxtotals, cex=1.5)
legend("right", c("Better", "No Change", "Worse"), fill=pal, cex=1.5)



