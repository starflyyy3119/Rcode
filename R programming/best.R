library(dplyr)
best <- function(state, outcome) {
  ## Read outcome data
  dat <- read.csv('R programming/outcome-of-care-measures.csv')
  
  ## Check that state and outcome are valid
  valid_states <- unique(dat$State)
  valid_outcome <- c('heart attack', 'heart failure', 'pneumonia')
  if (!(state %in% valid_states)) stop('invalid state')
  if (!(outcome %in% valid_outcome)) stop('invalid outcome')
  
  index <- c(11, 17, 23)
  names(index) <- valid_outcome
  
  ## Return hospital name in that state with lowest 30-day death rate
  specific <- filter(dat, State == state) %>% 
              select(c(2, index[outcome])) %>%
              filter(!(.data[[outcome]] == 'Not Available'))  # .data[[]] can convert a character to a name
  
  specific[, 2] <- as.numeric(specific[, 2])
  specific <- arrange(specific, .data[[outcome]])
  specific[1, 1]
}