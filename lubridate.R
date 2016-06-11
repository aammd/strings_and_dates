install.packages("lubridate")


# gsub, str ---------------------------------------------------------------



test_str <- c("study group is awesome!","Group! Woooo!")

nchar(test_str)

substr(test_str,1,7)

substr(test_str,1,7) <- "science"

gsub("group","SCIENCE",test_str)


strsplit(test_str,"u")

strsplit(test_str,"\\s")



# combining strings -------------------------------------------------------

split_test <- strsplit(test_str,"\\s")

paste(split_test[[1]],split_test[[1]],collapse=",",sep="_")


# grepl -------------------------------------------------------------------

table_one <- c("patrick","will","armando","carolina")
grepl(pattern = "o",table_one)
table_one[grepl(pattern = "o",table_one)]



# stringr -----------------------------------------------------------------

install.packages("stringr")
library(stringr)

str_detect(table_one,"a")
str_detect(table_one, "k|a")

str_detect(table_one,"^a")


str_split(test_str,"\\s")

# lubridate ---------------------------------------------------------------


library(lubridate)

## let's write a date

my_start_date <- "01 Jan 2010"

# as.Date(my_start_date)

dmy(my_start_date)

lets_party <- "Dec 31 1999"
mdy(lets_party)

today()

to <- "10/06/2016"

dmy(to)

## Why is this useful??

birthdays <- data.frame(dob = c("12 nov 2016",
                                "30 jun 2016",
                                "25 nov 2016",
                                "8 aug 2016"))
birthdays
plot(birthdays$dob)

birthdays$cumulative_ppl <- seq_along(birthdays$dob)

birthdays$dob <- dmy(birthdays$dob)
birthdays
birthdays$dob <- sort(birthdays$dob)
plot(birthdays$dob)

month(birthdays$dob)
day(birthdays$dob)

joey_summer <- interval(dmy("30-June-2016"), dmy("01-Sep-2016"))

start_sum <- dmy("30-June-2016")
end_sum <-  dmy("01-Sep-2016")

len_summer <- end_sum - start_sum
class(len_summer)
as.numeric(len_summer)


new_dates <- data.frame(user_dates = c("01 Nov 1999",
                                       "03 Oct 1997",
                                       "Dec 31 2007",
                                       "Apr 01 1999"))

## find the two date formats (stringr)
## parse the dates to a useful format (lubridate)

nicedates <- !is.na(as.numeric(str_sub(new_dates$user_dates, 1, 2)))

c(dmy(new_dates$user_dates[nicedates]),
  mdy(new_dates$user_dates[!nicedates]))

str_replace(new_dates$user_dates, "^/d", dmy(new_dates$user_dates))

str_detect(new_dates$user_dates, "^\\d")

## can you get the day of the week?