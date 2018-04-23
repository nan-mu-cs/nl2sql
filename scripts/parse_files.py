#!/usr/bin/python
import os
import re
import sys
import json
import sqlite3
import sqlparse
from os import listdir, makedirs
from collections import OrderedDict
from nltk import word_tokenize, tokenize
from os.path import isfile, isdir, join, split, exists, splitext

def parse(filepath):
	f = open(filepath,"r")
	ret = []
	lines = list(f.readlines())
	f.close()
	i = 0
	questions = []
	has_prefix = False
	while i < len(lines):
		line = lines[i].lstrip().rstrip()
		line = line.replace("\r","")
		line = line.replace("\n","")
		if len(line) == 0:
			i += 1
			continue
		if ord('0') <= ord(line[0]) <= ord('9'):
			#remove question number
			if len(questions) != 0:
				print '\n-----------------------------wrong indexing!-----------------------------------\n'
				print 'questions: ', questions
				sys.exit()
			index = line.find(".")
			if index != -1:
				line = line[index+1:]
			if line != '' and len(line) != 0:
				questions.append(line.lstrip().rstrip())
			i += 1
			continue
		if line.startswith("P:"):
			index = line.find("P:")
			line = line[index+2:]
			if line != '' and len(line) != 0:
				questions.append(line.lstrip().rstrip())
			has_prefix = True
		if (line.startswith("select") or line.startswith("SELECT") or line.startswith("Select") or \
			line.startswith("with") or line.startswith("With") or line.startswith("WITH")) and has_prefix:
			sql = [line]
			i += 1
			while i < len(lines):
				line = lines[i]
				line = lines[i].lstrip().rstrip()
				line = line.replace("\r","")
				line = line.replace("\n","")
				if len(line) == 0 or len(line.strip()) == 0 or ord('0') <= ord(line[0]) <= ord('9') or \
						not (line[0].isalpha() or line[0] in ['(',')','=','<','>', '+', '-','!','\'','\"','%']):
					break
				sql.append(line)
				i += 1
			sql = " ".join(sql)
			sql = sqlparse.format(sql, reindent=False, keyword_case='upper')
			sql = re.sub(r"(<=|>=|=|<|>|,)",r" \1 ",sql)
#			sql = sql.replace("\"","'")
			sql = re.sub(r"(T\d+\.)\s",r"\1",sql)
			if len(questions) != 2:
				print '\n-----------------------------wrong indexing!-----------------------------------\n'
				print 'questions: ', questions
				sys.exit()
			for q in questions:
				ret.append({'question': q, 'sql': sql})
			questions = []
			has_prefix = False
			continue

		i += 1

	return ret

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print "Usage: python get_data.py [dir includes many subdirs containing reviewed files] [processed table json file] [output file name e.g. output.json]"
        sys.exit()
    input_dir = sys.argv[1]
    output_file = sys.argv[2]
    db_files = [f for f in listdir(input_dir) if f.endswith('.txt')]

    data = []
    for f in db_files:
		raw_file = join(input_dir, f)
		print 'reading labeled file for db: ', f
		data_one = parse(raw_file)
		data.extend(data_one)
    with open(output_file, 'wt') as out:
        json.dump(data, out, sort_keys=True, indent=4, separators=(',', ': '))

