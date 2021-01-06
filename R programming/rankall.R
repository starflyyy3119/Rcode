rankall <- function(outcome, num = 'best') {
  ## Read outcome data
  dat <- read.csv('R programming/outcome-of-care-measures.csv')
  
  ## Check that the outcome are valid
  valid_states <- unique(dat$State)
  valid_outcome <- c('heart attack', 'heart failure', 'pneumonia')
  if (!(outcome %in% valid_outcome)) stop('invalid outcome')
  
  ## For each state, find the hospital of the given rank
  res_frame <- data.frame()
  for (state in valid_states) {
    specific <- filter(dat, State == state) %>% 
      select(c(2, index[outcome])) %>%
      filter(!(.data[[outcome]] == 'Not Available'))  # .data[[]] can convert a character to a name
    
    specific[, 2] <- as.numeric(specific[, 2])
    specific <- arrange(specific, .data[[outcome]], Hospital.Name)
    
    
    if (num == 'best') res_frame <- rbind(res_frame, data.frame(hospital = specific[1, 1], state = state))
    else if (num == 'worst') res_frame <- rbind(res_frame, data.frame(hospital = specific[nrow(specific), 1], state = state))
    else {
      if (nrow(specific) < num) {
        res_frame <- rbind(res_frame, data.frame(hospital = NA, state = state))
      }
      else res_frame <- rbind(res_frame, data.frame(hospital = specific[num, 1], state = state))
    }
  }
  ## Return a data frame with the hospital names and the state name
  arrange(res_frame, state)
}