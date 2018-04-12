#!/usr/bin/python

#!/usr/bin/python

import sys
import sqlparse
import re
import json
from collections import OrderedDict
def parse(filepath):
	f = open(filepath,"r")
	ret = []
	question = ""
	paraphrase = []
	sql_list = []
	lines = list(f.readlines())
	f.close()
	i = 0
	q = ""
	id = 1
	sqa = {
		"question":[],
		"sql":[]}
	sql_key = ""
	while i < len(lines):
		line = lines[i].lstrip().rstrip()
		line = line.replace("\r","")
		line = line.replace("\n","")
		if "Total" in line:
			i += 1
			break
		i += 1
	while i < len(lines):
		line = lines[i].lstrip().rstrip()
		line = line.replace("\r","")
		line = line.replace("\n","")
		has_prefix = False
		if len(line) == 0:
			i += 1
			continue
		if ord('0') <= ord(line[0]) <= ord('9'):
			if len(question)!=0:
				ret.append({
					"id":id,
					"question":question,
					"paraphrase":paraphrase,
					"sql":sql_list,
					"sqa":sqa
				})
				id += 1
				q_list = []
				sql_list = []
				paraphrase = []
				sqa =  {
					"question":[],
					"sql":[]
				}
			sql_key = ""
			#remove question number
			index = line.find(".")
			if index != -1:
				line = line[index+1:]
			question = line
			i += 1
			continue
		if line.startswith("P:"):
			index = line.find("P:")
			line = line[index+3:]
			paraphrase.append(line)
			has_prefix = True
		if line.startswith("S:"):
			index = line.find("S:")
			line = line[index+3:]
			sqa["question"].append(line)
			sql_key = "sql"
			has_prefix = True
		if line.startswith("S1:"):
			index = line.find("S1:")
			line = line[index+4:]
			if "question2" not in sqa:
				sqa["question2"] = []
				sqa["sql2"] = []
			sqa["question2"].append(line)
			sql_key = "sql2"
			has_prefix = True
#		if line[0] == "#":
#			line = line[1:]
#			q_list.append(line)
		if (line.startswith("select") or line.startswith("SELECT") or line.startswith("Select") or \
			line.startswith("with") or line.startswith("With") or line.startswith("WITH") ) and not has_prefix :
			sql = [line]
			i += 1
			while i < len(lines):
				line = lines[i]
				line = lines[i].lstrip().rstrip()
				line = line.replace("\r","")
				line = line.replace("\n","")
				if len(line) == 0 or ord('0') <= ord(line[0]) <= ord('9') or not line[0].isalpha():
					break
				sql.append(line)
				i += 1
			sql = " ".join(sql)
			sql = sqlparse.format(sql, reindent=False, keyword_case='upper')
			sql = re.sub(r"(<=|>=|=|<|>|,)",r" \1 ",sql)
#			sql = sql.replace("\"","'")
			sql = re.sub(r"(T\d+\.)\s",r"\1",sql)
			if sql_key == "":
				sql_list.append(sql)
			else:
				sqa[sql_key].append(sql)
			continue
		i += 1
	if len(question) > 0:
		ret.append( {
			"question":question,
			"paraphrase":paraphrase,
			"sql":sql_list,
			"sqa":sqa
		})
	return {
		"label_id":"",
		"review_id":"",
		"data":ret
	}

#filename = sys[0]
#print(sys.argv)
input_file = sys.argv[1]
#input_file="./art_1_tao_sqa.txt"
data = parse(input_file)
#filename = filename.split(".")[0]
#output_file = "test.json"
output_file = sys.argv[2]
outfile = open(output_file, 'w')
json.dump(data,outfile,indent=4,separators=(',',':'),sort_keys=True)

