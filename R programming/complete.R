complete <- function(directory, id = 1:332) {
  file_names <- list.files(directory)
  dat <- data.frame()
  for (index in id) {
    tmp <- read.csv(paste0(directory, '\\', file_names[index]))
    dat <- rbind(dat, data.frame(id = index, nobs = sum(complete.cases(tmp))))
  }
  dat
}


#a <- read.csv('D:\\Rcode\\Rcode\\R programming\\specdata\\001.csv')
#summary(a)

#complete('D:\\Rcode\\Rcode\\R programming\\specdata', c(2, 4, 8, 10, 12))

