pollutantmean <- function(directory, pollutant, id = 1:332) {
  file_names <- list.files(directory)
  dat <- data.frame()
  for (index in id) {
    tmp <- read.csv(paste0(directory, '\\', file_names[index]))
    dat <- rbind(dat, tmp)
  }
  mean(dat[, pollutant], na.rm = TRUE)
}


# pollutantmean('D:\\Rcode\\Rcode\\R programming\\hw2\\specdata', 'nitrate', 70:72)