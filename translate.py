## Translate list of Dutch motion verbs to different languages using GoogleTransl

from googletrans import Translator
import csv


# read in Dutch verbs
du_verbs = []
# with open('Schreuder_1976_Dutch-motion-verbs-list.txt', encoding = "utf8") as f:
# with open('dutch-verbs-list_short.txt', encoding = "utf8") as f:
with open('dutch-verbs-list_short.txt') as f:
	for line in f:
		du_verbs.append(line.rstrip('\n'))
du_verbs  = [x.lower() for x in du_verbs]

languages = ["en", "de", "sv", "es", "fr"]

# Instantiate the translator
translator = Translator()

csv_writer = csv.writer(open("dutch-verbs_translated.csv", "w", newline=''))



translated_verbs = []
for word in du_verbs:
	print(word)
	for lang in languages:
		print(lang)
		translated_verbs.append(
			[word,
			lang,
			translator.translate(word, dest = lang).text
			])

columns = ["Dutch_verb", "Target_lang", "Translation"]

csv_writer.writerow(columns)
for word_list in translated_verbs:
	csv_writer.writerow(word_list)
