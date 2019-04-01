## Translate list of Dutch motion verbs to different languages using GoogleTransl

from googletrans import Translator
import csv


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
# Break therefore down the list into smaller sublists and save to disk.
# (NB: See bottom of file for alternative ways of doing this)
steps_of = 20
index_list = [x*steps_of for x in range(1 + len(du_verbs)//20)]

du_verbs_chunked = [
	du_verbs[x*steps_of : (x+1) * steps_of]
		for x in range(1 + len(du_verbs)//20)
	]

for verb_sublist in du_verbs_chunked:
	# initialize list for translations
	translated_verbs = []
	for word in verb_sublist:
		for lang in languages:
			translated_verbs.append([
				word,
				lang#,
				# translator.translate(word, dest = lang).text
				])
	# save to csv file
	for item in translated_verbs:
		csv_writer.writerow(item)

outfile.close()



#################################################
# Alessio Quaresima showed me this alternative way of looping through a list
# using [Python generators](https://wiki.python.org/moin/Generators), which
# avoid storing big chunks in memory (not a problem here but could become an
# issue when dealing with bigger data sets)
#################################################

# HAVEN'T RUN THIS CODE (I think it's incomplete, but the gist is there?):

# def gener_short_sample(du_verbs):
#     for x in range(len(du_verbs)//20):
#         yield new_du_verbs[x*steps_of:(x+1)*steps_of]

# my_generator = gener_short_sample(du_verbs)
