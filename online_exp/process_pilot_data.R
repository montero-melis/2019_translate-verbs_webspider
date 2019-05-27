## Process data as output by the online experiment in Frinex


# Load data files ---------------------------------------------------------

# Load main data file
d_all <- read.csv("online_exp/pilot_data/tagpairdata.csv",
              stringsAsFactors = FALSE)

# Create column so I can later reorder rows if necessary
d_all$row_nb <- seq_len(nrow(d_all))
# Deal with time data, see https://www.cyclismo.org/tutorial/R/time.html
d_all$DateTime <- as.POSIXct(strptime(d_all$TagDate, format = "%Y-%m-%d %H:%M:%S"))

str(d_all)
head(d_all)

# List of valid completion codes (from actual participants only)
valid_codes <- read.table("online_exp/pilot_data/valid_completion_codes.txt",
                          col.names = "code")
head(valid_codes)

# List of participant information
ppt_info <- read.csv("online_exp/pilot_data/participants.csv")
head(ppt_info)



# Select valid participants only ------------------------------------------

# Select unique pairs of <UserId, CompletionCode> (note some of them are
# duplicated, perhaps because the information was resent several times?)
user_ids <- unique(d_all[d_all$TagValue1 == "CompletionCode", c("UserId", "TagValue2")])
valid_ids <- user_ids[user_ids$TagValue2 %in% valid_codes$code, "UserId"]

# Use the data from valid pilot participants only
d <- d_all[d_all$UserId %in% valid_ids, ]



# Select relevant rows only -----------------------------------------------

d$TagDate <- NULL  # character duplicate of TimeDate

# EvenTag column specifies the nature of the logged data
unique(d$EventTag)

# Keep only relevant data: text input or presentation time
d <- d[d$EventTag %in% c("StimulusPresentationTime", "freeText"), ]

