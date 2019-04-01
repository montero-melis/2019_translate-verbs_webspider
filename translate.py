## Translate list of Dutch motion verbs to different languages using GoogleTransl

from googletrans import Translator
import csv
import numpy


# read in Dutch verbs
du_verbs = []
with open('Schreuder_1976_Dutch-motion-verbs-list.txt') as f:
	for line in f:
		du_verbs.append(line.rstrip('\n'))
du_verbs  = [x.lower() for x in du_verbs]

# Target languages to translate to
languages = ["en", "de", "sv", "es", "fr"]

# Instantiate the translator
translator = Translator()

# csv file to save the results
outfile = open("dutch-verbs_translated.csv", "w", newline='')
csv_writer = csv.writer(outfile)
columns = ["Dutch_verb", "Target_lang", "Translation"]
csv_writer.writerow(columns)

# There is a limit to the number of requests to Google translate, see
# https://cloud.google.com/translate/quotas
# Slice therefore the list into smaller chunks and save to disk.
# (NB: I can't figure out a simple way of subsetting lists!!)
steps_of = 20
index_list = [x*steps_of for x in range(1 + len(du_verbs)//20)]

for i in index_list:
	# initialize list for translations
	translated_verbs = []
	# current subset of Dutch verbs to be translated
	curr_verbs = du_verbs[i : i+steps_of]
	for word in curr_verbs:
		for lang in languages:
			translated_verbs.append(
				[word,
				lang#,
				# translator.translate(word, dest = lang).text
				])
	# save to csv file
	for item in translated_verbs:
		csv_writer.writerow(item)

outfile.close()
