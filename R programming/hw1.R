dat <- read.csv('hw1_data.csv')
colnames(dat)
head(dat, 2)

nrow(dat)

dat$Ozone[47]

sum(is.na(dat$Ozone))

mean(dat$Ozone[!is.na(dat$Ozone)])



tmp <- dat[dat$Ozone > 31, ]

tmp2 <- tmp[tmp$Temp > 90, ]


mean(tmp2$Solar.R[!is.na(tmp2$Solar.R)])

tmp3 <- dat[dat$Month == 5, ]

