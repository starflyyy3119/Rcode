source("R programming\\complete.R")
corr <- function(directory, threshold = 0) {
  file_names <- list.files(directory)
  df <- complete(directory)
  index <- df$id[df$nobs > threshold]
  
  res <- numeric()
  for (i in index) {
    tmp <- read.csv(paste0(directory, '\\', file_names[i]))
    tmp <- tmp[complete.cases(tmp), ]
    res <- append(res, cor(tmp$sulfate, tmp$nitrate))
  }
  
  res
}

#head(corr("R programming\\specdata", 150))