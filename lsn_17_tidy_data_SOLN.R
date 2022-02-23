## SE370 AY22-2
## Lesson 17: Data Import and Tidy Data
setwd("C:/Users/jae.kim/OneDrive - West Point/AY22 SE370/Block 3/Lesson 17 - Data Import & Tidy/data")


library(tidyr)
library(readr)
library(jsonlite)

#--reading data

#csv
df <- read.csv("APFT_data.csv")

#xlsx
df <- readxl::read_xlsx("APFT_data.xlsx")

#txt
data <- read.table('Messy_Data.txt')



#json (JavaScript Object Notation)
result <- read_json("nhl_game.json")

#rda (Rdata file -- maintains the R specific info in the encoding!)
rda_file <- load(file = 'wiki_hot_100s.rda')


#--Saving data
# write.csv() for tables
#saveRDS() for rda


#--Gathering data

name <- c('Clay','Ian','JD','John','Steven')
push_up <- c(78,NA,100,100,98)
run <- c(98,100,84,100,78)
sit_up <- c(88,64,70,100,96)

df <- data.frame(name, push_up, run, sit_up, stringsAsFactors = FALSE)

# Gather this data so that it only has 3 columns -- one for name,
# one for event, and one for score.

# Used to use gather which was replaced by pivot_longer which is easier to use, 
# and has more features

#df <- gather(df, push_up, run, sit_up, key = 'event', value = 'score')

df <- pivot_longer(df, cols =c(push_up, run, sit_up), names_to = "event",
                   values_to = "score")



# Why might this format useful?


#--Spreading data
# Spread the data so it's back to it original format (5 rows with 
# 4 columns)


# Used to use spread which was replaced by pivot_wider which is easier to use, 
# and has more features

#df <- spread(df, event, score) 

df <- pivot_wider(df, names_from = 'event', values_from = 'score')

# Why might this format useful?

#--NA values
# Remove the data with an incomplete APFT

df <- drop_na(df, push_up, run, sit_up)



#---In-Class Exercise -- complete on your own

## Read in the billboard dataset 
billboard <- read_csv('billboard.txt')
str(billboard)
head(billboard)

# Tidy the dataset using gather().
# Consolidate all the week columns into a single column using pivot_longer

#billboard2 <- gather(billboard, week, rank, wk1:wk76)

billboard2 <- pivot_longer(billboard, cols = wk1:wk76, names_to = 'week', values_to = 'rank')

# Get rid of the missing values
billboard2 <- drop_na(billboard2, rank)

# Separate the "date.entered" into "release_year", "release_month", "release_date" 
billboard2 <- separate(billboard2, date.entered, sep = "-", 
                       into = c("rel_year", "rel_month", "rel_date"))

#Convert the week variable to a number 
#(HINT: There are several ways to do this. 
# Try Googling "parse_number()" for the tidyr method!)
billboard2$week <- parse_number(billboard2$week)

# Save the updated billboard data as a .CSV file 
# and submit it on Teams!
