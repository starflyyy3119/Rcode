rankhospital <- function(state, outcome, num = 'best') {
  ## Read outcome data
  dat <- read.csv('R programming/outcome-of-care-measures.csv')
  
  ## check the state and outcome are valid
  valid_states <- unique(dat$State)
  valid_outcome <- c('heart attack', 'heart failure', 'pneumonia')
  if (!(state %in% valid_states)) stop('invalid state')
  if (!(outcome %in% valid_outcome)) stop('invalid outcome')
  
  ## Return hospital name in that state with the given rank 30-day death rate
  specific <- filter(dat, State == state) %>% 
    select(c(2, index[outcome])) %>%
    filter(!(.data[[outcome]] == 'Not Available'))  # .data[[]] can convert a character to a name
  
  specific[, 2] <- as.numeric(specific[, 2])
  specific <- arrange(specific, .data[[outcome]], Hospital.Name)

  
  if (num == 'best') return(specific[1, 1])
  else if (num == 'worst') return(specific[nrow(specific), 1])
  else {
    if (nrow(specific) < num) {
      return(NA)
    }
    else return(specific[num, 1])
  }
  
}