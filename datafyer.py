#!/usr/bin/env python
# encoding: -utf-8


import csv
import sys
import re
import HTMLParser
from itertools import izip

def get_tweets_from_csv(csv_name):
	with open(csv_name, 'rb') as csvfile:
		csv_reader = csv.reader(csvfile)
		for row in csv_reader:
			try:
				yield row[2]
			except:
				# Weirdly formatted line - i.e. do nothing
				pass

if __name__ == '__main__':
	text = ""
	g1 = get_tweets_from_csv(sys.argv[1])
	g2 = get_tweets_from_csv(sys.argv[2])

	for a, b in izip(g1, g2):
		text +=  a + "\n"
		text +=  b + "\n"

	# Remove non-ascii data
	text =  ''.join([i if ord(i) < 128 else '' for i in text])

	# Remove URLs
	text = re.sub("((https?):((//)|(\\\\))+([\w\d:#@%/;$()~_?\+-=\\\.&](#!)?)*)", ""	, text)

	# Remove URLs my way
	text = re.sub("(^)?http[a-zA-Z0-9\.\/:]*($)?", "" , text, re.M)

	# Remove any http/https stubs
	text = re.sub("http|https", "", text)

	# Expand HTML entities
	text = HTMLParser.HTMLParser().unescape(text)

	print text
