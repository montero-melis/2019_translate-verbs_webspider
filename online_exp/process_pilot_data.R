## Process data as output by the online experiment in Frinex

library(dplyr)
library(readr)

# Load data files ---------------------------------------------------------

# Load main data file
d_all <- read.csv("online_exp/pilot_data/tagpairdata.csv",
              stringsAsFactors = FALSE, fileEncoding = "UTF-8")

# Create column so I can later reorder rows if necessary
d_all$row_nb <- seq_len(nrow(d_all))
# Deal with time data, see https://www.cyclismo.org/tutorial/R/time.html
d_all$DateTime <- as.POSIXct(strptime(d_all$TagDate, format = "%Y-%m-%d %H:%M:%S"))
# remove character duplicate of TimeDate
d_all$TagDate <- NULL

str(d_all)
head(d_all)

# List of valid completion codes (from actual participants only)
valid_codes <- read.table("online_exp/pilot_data/valid_completion_codes.txt",
                          col.names = "code")
head(valid_codes)

# List of participant information
ppt_info <- read.csv("online_exp/pilot_data/participants.csv")
head(ppt_info)


# List of verbs used as stimuli (need only verb name in 1st column)
verbs <- read.csv("online_exp/verbs_pilot.csv", fileEncoding = "UTF-8") %>%
  select(verb = feature)
verbs$verb_id <- 1 : nrow(verbs)
verbs

# Select valid participants only ------------------------------------------

# Select unique pairs of <UserId, CompletionCode> (note some of them are
# duplicated, perhaps because the information was resent several times?)
user_ids <- unique(d_all[d_all$TagValue1 == "CompletionCode", c("UserId", "TagValue2")])
valid_ids <- user_ids[user_ids$TagValue2 %in% valid_codes$code, "UserId"]

# Use the data from valid pilot participants only
d <- d_all[d_all$UserId %in% valid_ids, ]

# How many participants are there?
length(unique(d$UserId))


# Select relevant rows only -----------------------------------------------

# EvenTag column specifies the nature of the logged data
unique(d$EventTag)

# Keep only relevant data: text input or presentation time
d <- d[d$EventTag %in% c("StimulusPresentationTime", "freeText"), ]
# Trim leading/trailing white spaces and to lower case
d$TagValue2 <- tolower(trimws(d$TagValue2))



# Add verb ----------------------------------------------------------------

# The number at the end of TagValue tells us which verb was the stimulus
# So put that into a new column
d$verb_id <- as.numeric(gsub("\\D", "", d$TagValue1))

# Join it with the actual verb
d <- left_join(d, verbs)



# Feature task ------------------------------------------------------------

# Select feature trials and filter out all empty cells
feat <- d[grepl("^feat", d$TagValue1), ] %>%
  filter(EventTag == "freeText" & TagValue2 != "") %>%
  select(UserId, verb_id, verb, feature_raw = TagValue2)

# How many unique features?
length(unique(feat$feature_raw))  # 823

# Save to disk feature data set
write_csv(feat, path = "online_exp/pilot_data/feature_trial-data.csv")

# Data file for coding, which contains only unique features per verb:
feat_coding <- unique(feat[, c("verb", "feature_raw")])
feat_coding$feature_clean <- feat_coding$feature_raw
feat_coding$feature_revised <- ""
feat_coding$revision <- ""
feat_coding$feature_type <- ""
feat_coding$feature_english <- ""
feat_coding$comment <- ""

# Save to disk
write_csv(feat_coding, path = "online_exp/pilot_data/feature_for-coding.csv")


# Negation task -----------------------------------------------------------

# Select negation trials and filter out all empty cells
neg <- d[grepl("^neg", d$TagValue1), ] %>%
  filter(EventTag == "freeText" & TagValue2 != "") %>%
  select(UserId, verb_id, verb, response_raw = TagValue2)

# How many unique responses?
length(unique(neg$response_raw))

# Save to disk negation data set
write_csv(neg, path = "online_exp/pilot_data/negation_trial-data.csv")

# Data file for coding, which contains only unique responses:
neg_coding <- data.frame(
  response_raw   = sort(unique(neg$response_raw)),
  response_clean = sort(unique(neg$response_raw)),
  response_english = "",
  comment = ""
)

# Save to disk
write_csv(neg_coding, path = "online_exp/pilot_data/negation_for-coding.csv")



# Via task ----------------------------------------------------------------

# Select via trials
via <- d[grepl("^via", d$TagValue1), ] %>%
  filter(EventTag == "freeText" & TagValue2 != "") %>%
  select(UserId, verb_id, verb, response_raw = TagValue2)

# How many unique verb-response pairs?
nrow(unique(via[, c("verb", "response_raw")]))

# Save to disk via data set
write_csv(via, path = "online_exp/pilot_data/via_trial-data.csv")

# Data file for coding, which contains only unique responses per verb:
via_coding <- via[, c("verb", "response_raw")] %>%
  mutate(response_clean   = response_raw,
         valid_response   = "",
         comment          = "")

# Save to disk
write_csv(via_coding, path = "online_exp/pilot_data/via_for-coding.csv")
