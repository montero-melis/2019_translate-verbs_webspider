import csv
from googletrans import Translator
italiano = ["locomotiva","arpa","architrave"]
# Instantiate the translator
translator = Translator()
csv_writer = csv.writer(open("italian_words.csv","w",newline=''))


def myhelp():
	"""
	Here I write a docstring
	"""
	return True

def main():
	translated_words = []
	for word in italiano:
		translated_words.append([word,
								translator.translate(word, dest="en").text,
								translator.translate(word, dest="sw").text,
								translator.translate(word, dest="de").text,
								])
	columns = ["it","en","sw","de"]
	csv_writer.writerow(columns)

	for word_list in translated_words:
		csv_writer.writerow(word_list)
		print(word_list)


if __name__ =="__main__":
	main()
# # <Translated src=ko dest=en text=Good evening. pronunciation=Good evening.>
# translator.translate('안녕하세요.', dest='ja')
# # <Translated src=ko dest=ja text=こんにちは。 pronunciation=Kon'nichiwa.>
# translator.translate('veritas lux mea', src='la')
# # <Translated src=la dest=en text=The truth is my light pronunciation=The truth is my light>

#translator.translate("hola buenos días")
