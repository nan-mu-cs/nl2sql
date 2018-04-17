#!/usr/bin/python

import sys
import os
import json

'''
python3 create_wiki_sql.py output_file_name (dev|train|test) tableid1 tableid2 tableid3 ... tableidn
'''

data_dir = "./WikiSQL-master/data"

train_type = sys.argv[2]
data_file = os.path.join(data_dir, "{}.tables.jsonl".format(sys.argv[2]))
tables = sys.argv[3:]
tables = ["-".join(table.split("_")) for table in tables]

def create_sql(data_file,tables):
	f = open(data_file,"r")
	ret = []
	table_map = dict()
	for line in f.readlines():
		line = json.loads(line)
		table_map[line["id"]] = line
	for table in tables:
		table = table_map[table]
		create_st = 'CREATE TABLE "{}" (\n'.format(table["id"])
		for i,val in enumerate(zip(table["header"],table["types"])):
			col = val[0]
			typ = val[1]
			if i != len(table["header"])-1:
				create_st += '"{}" {},\n'.format(col, typ)
			else:
				create_st += '"{}" {}\n'.format(col, typ)
		create_st += ");\n\n";
		insert_st = []
		for row in table["rows"]:
			s = 'INSERT INTO  "{}" VALUES ({});'.format(table["id"], ",".join(['"{}"'.format(v) for v in row]))
			insert_st.append(s)
		insert_st = "\n".join(insert_st)
		insert_st += "\n"
		ret.append({
			"create":create_st,
			"insert":insert_st
		});
	f.close()
	return ret
	
def save_data(output_file,data):
	f = open(output_file,"w")
	for item in data:
		f.write(item["create"])
	for item in data:
		f.write(item["insert"])
	f.close()

data = create_sql(data_file, tables)
save_data(sys.argv[1], data)
	
			
