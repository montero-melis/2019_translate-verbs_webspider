## Take the list of translated Dutch motion verbs and reshape
# NB: Translations are done in Python (see scripts), but data handling is much
# easier for me in R.

library("tidyr")
library("dplyr")

tr <- read.csv("dutch-verbs_translated_01.csv", fileEncoding = "UTF-8",
               stringsAsFactors = FALSE)

# Reorder language levels
tr$Target_lang <- factor(tr$Target_lang,
                         levels = c("en", "de", "sv", "es", "fr")
                         )
nbLangs <- length(unique(tr$Target_lang))

# To wide format:
tr_w <- spread(tr, Target_lang, Translation)

# Add a few columns for annotations
tr_w$IsMannerOfMotion <- ""
tr_w$Category <- ""
tr_w$IsEnCorrect <- ""
tr_w$Comment <- ""

# Rearrange columns
tr_w <- tr_w[, c(1, (2+nbLangs) : ncol(tr_w), 2 : (1+nbLangs))]
head(tr_w)
# Save to disk
write.csv(tr_w, "verbs_for_annotation.csv", fileEncoding = "UTF-8")

# verb list to lower case
vlist <- read.table("Schreuder_1976_Dutch-motion-verbs-list.txt",
                    sep = "\n", fileEncoding = "UTF-8") %>%
  transmute(du_verbs = tolower(V1))
head(vlist)
write.table(vlist, "dutch_verbs_lowercase.txt", fileEncoding = "UTF-8",
            col.names = FALSE, row.names = FALSE, quote = FALSE)
