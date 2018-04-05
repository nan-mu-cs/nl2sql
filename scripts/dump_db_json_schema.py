import sqlite3
import sys
import json


def parse_table(table):
    #print table
    table = table.split("\n")
    ret = []
    table_name = ""
    for line in table:
        line = line.split()
        #print line
        if len(line) < 2:
            continue
        if line[0] == "CREATE" and line[1] == "TABLE":
            table_name = line[2]
            continue
        line[1] = line[1][:len(line[1])-1]
        ret.append({
            "column_name":line[0],
            "default_column_name":line[0],
            "data_type":line[1],
            "annote":line[2] if len(line) > 2 else ""
            })
    return table_name,ret
       
def dump_db_json_schema():
    if len(sys.argv) < 2:
        print "run with python dump_db_json_schema.py database.sqlite output.json"
        return 
    db = sys.argv[1]
    conn = sqlite3.connect(db)
    cursor = conn.execute("SELECT name FROM sqlite_master WHERE type='table';")
    data = []
    #parse_table(ret[0])
    for item in cursor.fetchall():
        table = item[0]
        cur = conn.execute("PRAGMA table_info('{}') ".format(table))
        col_data = []
        for col in cur.fetchall():
            col_data.append({
                "default_column_name":col[1],
                "column_name":col[1],
                "data_type":col[2],
                "not_null":col[3],
                "default_value":col[4],
                "primary_key":col[5]
                })
        data.append({
                "table":table,
                "col_data":col_data
            })
    #print tables
    output_name = sys.argv[2]
    with open(output_name, 'wt') as out:
        json.dump(data, out, sort_keys=True, indent=4, separators=(',', ': '))

dump_db_json_schema()

#db = sys.argv[1]
#conn = sqlite3.connect(db)
#cursor = conn.execute(".tables	")
#cursor = conn.execute("PRAGMA table_info('salary') ")
#cursor = conn.execute("SELECT name FROM sqlite_master WHERE type='table';")
#print cursor.fetchall()
