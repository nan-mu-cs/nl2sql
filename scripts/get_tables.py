import os
import sys
import json
import sqlite3
from os import listdir, makedirs
from os.path import isfile, isdir, join, split, exists, splitext
from nltk import word_tokenize, tokenize


def dump_db_json_schema(db, f):
    '''read table and column info'''

    conn = sqlite3.connect(db)
    conn.execute('pragma foreign_keys=ON')
    cursor = conn.execute("SELECT name FROM sqlite_master WHERE type='table';")

    data = {'db_id': f,
         'table_names_original': [],
         'table_names': [],
         'column_names_original': [(-1, '*')],
         'column_names': [(-1, '*')],
         'column_types': ['text'],
         'primary_keys': [],
         'foreign_keys': []}

    for i, item in enumerate(cursor.fetchall()):
        table_name = item[0]
        data['table_names_original'].append(table_name)
        data['table_names'].append(table_name.lower().replace("_", ' '))
        fks = conn.execute("PRAGMA foreign_key_list('{}') ".format(table_name)).fetchall()
        data['foreign_keys'].extend([[(table_name, fk[3]), (fk[2], fk[4])] for fk in fks])
        cur = conn.execute("PRAGMA table_info('{}') ".format(table_name))
        for j, col in enumerate(cur.fetchall()):
            data['column_names_original'].append((i, col[1]))
            data['column_names'].append((i, col[1].lower().replace("_", " ")))
            #varchar, '' -> text, int, numeric -> integer,
            col_type = col[2].lower()
            if 'char' in col_type or col_type == '' or 'text' in col_type or 'var' in col_type:
                data['column_types'].append('text')
            elif 'int' in col_type or 'numeric' in col_type or 'decimal' in col_type or 'number' in col_type\
             or 'id' in col_type or 'real' in col_type or 'double' in col_type or 'float' in col_type:
                data['column_types'].append('number')
            elif 'date' in col_type or 'time' in col_type or 'year' in col_type:
                data['column_types'].append('time')
            elif 'boolean' in col_type:
                data['column_types'].append('boolean')
            else:
                data['column_types'].append('others')

            if col[5] == 1:
                data['primary_keys'].append(len(data['column_names'])-1)

    return data


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print "Usage: python get_tables.py [dir includes many subdirs containing database.sqlite files] [output file name e.g. output.json]"
        sys.exit()
    input_dir = sys.argv[1]
    output_file = sys.argv[2]
    db_files = [(df+'.sqlite', df) for df in listdir(input_dir) if exists(join(input_dir, df, df+'.sqlite'))]
    tables = []
    for f, df in db_files:
        db = join(input_dir, df, f)
        print 'reading db: ', df
        table = dump_db_json_schema(db, df)
        tables.append(table)
    with open(output_file, 'wt') as out:
        json.dump(tables, out, sort_keys=True, indent=2, separators=(',', ': '))
