
# gsub, substr --------------------------------------------------------------------

test_str <- c("study group is awesome!", "Woooo!")

test_str

nchar(test_str)

substr(test_str, 1, 7)

substr(test_str, 1, 7) <- "SCIENCE"
test_str

# ?gsub
test_str <- c("study group is awesome!", "Woooo!")

gsub("group", "SCIENCE", test_str)
## gsub replaces it all!

gsub("o", "OOO", test_str)

strsplit(test_str, " ")

strsplit(test_str, "\\s")


# combining strings -------------------------------------------------------
split_test <- strsplit(test_str, "\\s")

split_test[[1]]

### include diagram of the list subsettings

class(split_test)
class(split_test[1])
split_test[1]
split_test[[1]]
class(split_test[[1]])

### combining strings! ####

paste(split_test[[1]], collapse = "_")

paste("Hello", "Andrew")
paste("Hello", "Andrew", sep = "_")
paste0("hey", "andrew")


# grepl -------------------------------------------------------------------

table_one <- c("patrick", "will", "armando", "carolina")

table_one

grepl(pattern = "o", x = table_one)
names_with_a <- grepl(pattern = "a", x = table_one)
## use logical vectors as index
table_one[names_with_a]
## but how many!
length(table_one[names_with_a])

sum(names_with_a)


# Introducing stringr -----------------------------------------------------

# install.packages("stringr")
library(stringr)

str_detect(table_one, pattern = "a")
str_detect(table_one, "k|a")
## start of a string
table_one
str_detect(table_one, "^a")

### str_extract

test_str
str_extract(test_str, "group")


# lubridate ---------------------------------------------------------------
install.packages("lubridate")
library(lubridate)

## let's write a date

my_start_data <- "01 Jan 2010"

as.Date(my_start_date)

# as.Date(my_start_date)

dmy(my_start_data)

lets_party <- "Dec 31 1999"

mdy(lets_party)

to <- "10/06/2016"

dmy(to)

## Whis is this useful

birthdays <- data.frame(dob = c("12 nov 2016", 
                                "30 jun 2016", 
                                "25 nov 2016",
                                "8 aug 2016"))

plot(birthdays)

birthdays$cumulative_ppl <- seq_along(birthdays$dob)
birthdays

birthdays$dob <- dmy(birthdays$dob)
birthdays

birthdays$dob <- sort(birthdays$dob)
birthdays
plot(birthdays)

month(birthdays$dob)

joeys_summer <- interval(dmy("30-June-2016"), dmy("01-Sep-2016"))

start_sum <- dmy('30-June-2016')
end_sum <- dmy('01-Sep-2016')

len_summer <- end_sum - start_sum
class(len_summer)
as.numeric(len_summer)

new_dates <- data.frame(user_dates = c("01 Nov 1999",
                                       "03 Oct 1997",
                                       "Dec 31 2007",
                                       "Apr 01 1999"))

## find the two date formats (stringr)
## parse the dates to a useful format