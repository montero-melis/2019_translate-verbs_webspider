## Process data as output by the online experiment in Frinex

library("dplyr")

d_all <- read.csv("online_exp/pilot_data/tagpairdata.csv",
              stringsAsFactors = FALSE)
str(d_all)

# deal with time data, see https://www.cyclismo.org/tutorial/R/time.html
d_all$DateTime <- as.POSIXct(strptime(d_all$TagDate, format = "%Y-%m-%d %H:%M:%S"))
head(d_all)

# Use the data from two pilot participants (2 colleagues at MPI, RS and EP)
valid_ids <- c("16a9d19b2cc-4a25-64fd-bc62-3d3e",
               "16ab0db1df1-b8e3-4bb3-67a-df5f")

# d <- d_all %>% filter(UserId %in% valid_ids)
d <- d_all %>%
  filter(EventTag == "freeText")

head(d, 400)
d[150:290,]
