#!/usr/bin/env python
# encoding: -utf-8


import csv
import sys
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
	g1 = get_tweets_from_csv(sys.argv[1])
	g2 = get_tweets_from_csv(sys.argv[2])

	for a, b in izip(g1, g2):
		print a
		print b

