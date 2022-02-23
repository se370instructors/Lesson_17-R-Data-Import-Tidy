## SE370 AY22-2
## Lesson 17: Data Import and Tidy Data


library(tidyr)
library(readr)
library(jsonlite)

#--reading data

#csv


#xlsx


#txt


#json (JavaScript Object Notation)


#rda (Rdata file -- maintains the R specific info in the encoding!)



#--Saving data
# write.csv() for tables
#saveRDS() for rda


#--Gathering data

name <- c('Clay','Ian','JD','John','Steven')
push_up <- c(78,NA,100,100,98)
run <- c(98,100,84,100,78)
sit_up <- c(88,64,70,100,96)



# Gather this data so that it only has 3 columns -- one for name,
# one for event, and one for score.



# Why might this format useful?


#--Spreading data
# Spread the data so it's back to it original format (5 rows with 
# 4 columns)



# Why might this format useful?

#--NA values
# Remove the data with an incomplete APFT





#---In-Class Exercise -- complete on your own

## Read in the billboard dataset 



# Tidy the dataset using pivot_longer().
# Consolidate all the week columns into a single column


# Get rid of the missing values


# Separate the "date.entered" into "release_year", "release_month", "release_date" 



#Convert the week variable to a number 
#(HINT: There are several ways to do this. 
# Try Googling "parse_number()" for the tidyr method!)


# Save the updated billboard data as a .CSV file 
# and submit it on Teams!
