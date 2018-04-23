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

from process_sql import get_sql


def get_schemas_from_json(fpath):
    with open(fpath) as f:
        data = json.load(f)
    db_names = [db['db_id'] for db in data]

    schemas = {}
    for db in data:
        db_id = db['db_id']
        schema = {} #{'table': [col.lower, ..., ]} * -> __all__
        column_names_original = db['column_names_original']
        table_names_original = db['table_names_original']
        for i, tabn in enumerate(table_names_original):
            table = str(tabn.lower())
            cols = [str(col.lower()) for td, col in column_names_original if td == i]
            schema[table] = cols
        schemas[db_id] = schema

    return schemas, db_names


def parse_file_and_sql(filepath, schema, db_id):
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
                q_toks = word_tokenize(q)
                query_toks = word_tokenize(sql)
                sql_label = get_sql(schema, sql)
		ret.append({'question': q,
                            'question_toks': q_toks,
                            'query': sql,
                            'query_toks': query_toks,
                            'sql': sql_label,
                            'db_id': db_id})
		questions = []
		has_prefix = False
		continue

	i += 1

    return ret


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print "Usage: python get_data.py [dir containing reviewed files] [processed table json file] [output file name e.g. output.json]"
        sys.exit()
    input_dir = sys.argv[1]
    table_file = sys.argv[2]
    output_file = sys.argv[3]

    schemas, db_names = get_schemas_from_json(table_file)
    db_files = [f for f in listdir(input_dir) if f.endswith('.txt')]
    fn_map = {}
    for f in db_files:
        for db in db_names:
            if db in f:
                fn_map[f] = db
                continue
    if len(db_files) != len(fn_map.keys()):
        print 'Warning: misspelled files: ', [f for f in db_files if f not in fn_map.keys()]
        sys.exit()

    data = []
    for f, db_id in fn_map.items():
        raw_file = join(input_dir, f)
        print 'reading labeled file for db: ', db_id
	schema = schemas[db_id]
        data_one = parse_file_and_sql(raw_file, schema, db_id)
        data.extend(data_one)
    with open(output_file, 'wt') as out:
        json.dump(data, out, sort_keys=True, indent=4, separators=(',', ': '))

