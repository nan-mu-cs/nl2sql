import json
import os
import collections
import sqlite3
ALIAS = 'alias'
default = "{value}"

def get_upper_key_words():
    key_words = [".", ",", "(", ")", "in", "not", "and", "between", "or", "where",
                "except", "union", "intersect",
                "group", "by", "order", "limit", "having","asc", "desc",
                "count", "sum", "avg", "max", "min",
                "{value}",
               "<", ">", "=", "!=", ">=", "<=",
                "like",
                "distinct","*",
                "join", "on", "as", "select", "from"
               ]
    upper_keywords = [kw.upper() for kw in key_words]
    return set(upper_keywords)

def lower_sql(sql):
    sql_tokens = sql.split()
    upper_key_words = get_upper_key_words()
    # lower_tokens = [tok.lower() if tok not in upper_key_words else tok for tok in sql_tokens]
    lower_tokens = [tok.lower().replace(ALIAS, "_") if tok not in upper_key_words else tok for tok in sql_tokens]
    return " ".join(lower_tokens)
    
    

def get_tokens(sql):
    sql = sql.strip().strip(";").strip().replace(" INNER ", ' ').replace(" LEFT ", ' ').replace(" OUTER ", ' ').replace(" RIGHT ", ' ').replace("(", " ( ").replace(")", " ) ").replace("LOWER", "").replace("UPPER", "").replace("lower", "").replace("upper", "")
    # sql = sql.strip().strip(";").strip().replace(" INNER ", ' ').replace("(", " ( ").replace(")", " ) ") 
    sql_tokens = []
    old_toks = sql.split()
    for item in old_toks:
        if item != '':
            sql_tokens.append(item)
    sql = ' '.join(sql_tokens)
    return sql, sql_tokens

def rename_table(sql, sql_tokens):
    tabns = list(set([tok.split(".")[0] for tok in sql_tokens if ALIAS in tok and '.' in tok])) 
    for i, tabn in enumerate(tabns):
        sql = sql.replace(tabn+".", "")
    sql = sql.replace(ALIAS, "_")
    return sql

def reformat_sql(sql):
    
    sql, sql_tokens = get_tokens(sql)
    sql = reorder(sql)
    sql = rename_table(sql, sql_tokens)
    sql = lower_sql(sql)
    return sql.replace("<>", "!=") + ";"

def reorder(sql):
    orig_sql = sql
    sql = sql.strip()

    if "select" not in sql.lower():
        return sql

    constraints = {}
    stack = []
    prefix = ""
    prev = 0
    replace_dic = {}
    cnt = 0
    flag = True
    l = len(sql)
    i = 0
    # find recursion
    while i < l:
        if sql[i] == '(':
            stack.append(('(', i))
        elif sql[i] == ')':
            left = stack.pop()
            if len(stack) == 0:
                inner = sql[left[1] + 1:i]
                if 'select' not in inner.lower():
                    # content = inner.strip().split()
                    # todo
                    # content = [c for c in content if len(c)>0 ]
                    # if len(content) == 1:
                    #     sql = sql[0:left[1]] + content[0] + sql[i + 1:]
                    #     i -= 1
                    #     l = len(sql)
                    # else:
                    #     i += 1
                    #     l = len(sql)
                    i += 1
                    l = len(sql)
                    continue
                res = reorder(inner)


                previous_word = sql[0:left[1]].strip().split()
                if len(previous_word) == 1:
                    new_identifier = "\"NEW_IDENTIFIER_" + str(cnt) + "\""
                else:
                    new_identifier = "NEW_IDENTIFIER_" + str(cnt)
                prev = left[1] + len(new_identifier)
                # print "NEW PREV", prev
                sql = sql[0:left[1]] + new_identifier + sql[i + 1:]
                replace_dic[new_identifier] = "( " + res + " )"
                cnt += 1
                i = prev + 1
        i += 1
        l = len(sql)

    sql_tokens = sql.split(" ")
    with_dot = set([tok.split(".")[0] for tok in sql_tokens if ALIAS in tok and '.' in tok])
    without_dot = set([tok for tok in sql_tokens if ALIAS in tok and '.' not in tok])
    
    tabns = list(with_dot)
    if "select" not in sql.lower():
        for k in replace_dic.keys():
            sql = sql.replace(k, replace_dic[k]) # replace the inner ()
        # todo: valid check
        for k in constraints.keys():
            sql = sql.replace(k, constraints[k]) # constraints table k is pass from the inside ()??
        return sql

    if len(tabns) == 0:
        pass
    elif len(tabns) == 1:
        sql = sql.replace(tabns[0] + '.', '').replace(' AS ' + tabns[0], '')
    else:
        # replace table name
        for i, tabn in enumerate(tabns):
            sql = sql.replace(' ' + tabn, ' T' + str(i + 1))
            constraints[' ' + tabn] = ' T' + str(i + 1)
        sql_tokens = sql.split(" ")
        from_inds = [i for i, x in enumerate(sql_tokens) if x == 'FROM']
        # tokens before from
        toks_bf_from = ' '.join(sql_tokens[:from_inds[0]])
        new_sql = toks_bf_from
        for f, find in enumerate(from_inds):
            tables = []
            joins = []
            ind = 0
            is_join = False
            if f + 1 < len(from_inds):
                # tokens before from, suppose not any ??
                toks_bw_from = sql_tokens[find: from_inds[f + 1]]
            else:
                toks_bw_from = sql_tokens[find:]

                
            sql_bw_from = ' '.join(toks_bw_from)
            # print "SQL BETWEEN FROM", sql_bw_from
            for i, tok in enumerate(toks_bw_from):
                if i < ind:
                    continue
                tok_3 = toks_bw_from[i:i + 3]
                # print "TOK3", tok_3
                r = 0
                for tok in tok_3:
                    if tok in replace_dic:
                        r = 1
                if len(tok_3) < 3 or r == 1: # can be replaced?
                    break
                # join on = 
                if ('=' in tok_3[1]) and ('T' in tok_3[0] and '.' in tok_3[0]) and ('T' in tok_3[2] and '.' in tok_3[2]):
                    if  'AND' == toks_bw_from[i - 1]:
                        join_tok = ' AND ' + ' '.join(tok_3)
                        sql_bw_from = sql_bw_from.replace(join_tok, '')
                        sql_bw_from = sql_bw_from.replace(' '.join(tok_3) + ' AND ', '')
                        sql_bw_from = sql_bw_from.replace(' '.join(tok_3), '')
                    elif  i + 3< len(toks_bw_from) and 'AND' == toks_bw_from[i + 3]:
                        join_tok = ' '.join(tok_3) + ' AND '
                        sql_bw_from = sql_bw_from.replace(join_tok, '')
                        sql_bw_from = sql_bw_from.replace(' AND ' + ' '.join(tok_3), '')
                        sql_bw_from = sql_bw_from.replace(' '.join(tok_3), '')
                    else:
                        join_tok = ' '.join(tok_3)
                        sql_bw_from = sql_bw_from.replace(join_tok, '')
                    joins.append(' '.join(tok_3))
                    ind = i + 3
                elif tok_3[1] == 'AS' and 'T' ==  tok_3[2][0] and len(tok_3)> 1 and tok_3[2][1:].isdigit():
                # else:
                    # print "sql_bw_from before: ", sql_bw_from
                    sql_bw_from = sql_bw_from.replace(' '.join(tok_3), '')
                    # if ',' == toks_bw_from[i-1]:
                    #     sql_bw_from = sql_bw_from.replace(' , ', '')
               

                    # print 'sql_bw_from after: ', sql_bw_from
                    tables.append(' '.join(tok_3))
            # print "joins", joins
            # print "TABLES", tables

            from_tabs = ''
            join_num = 0
            join_ordered = []
            if len(joins) > 1:
                tabs_vis = []
                for i, jn in enumerate(joins):
                    jn_toks = jn.split(' ')
                    t1 = jn_toks[0].split('.')[0]
                    t2 = jn_toks[2].split('.')[0]
                    if i == 0:
                        join_ordered.append(jn)
                        tabs_vis.extend([t1, t2])
                    else:
                        for jnb in joins[i:]:
                            jnb_toks = jnb.split(' ')
                            tb1 = jnb_toks[0].split('.')[0]
                            tb2 = jnb_toks[2].split('.')[0]
                            if tb1 in tabs_vis or tb2 in tabs_vis:
                                join_ordered.append(jnb)
                                tabs_vis.extend([tb1, tb2])
            for jn in joins:
                if jn not in join_ordered:
                    join_ordered.append(jn)
            for join in join_ordered:
                join_toks = join.split(' ')
                t1 = join_toks[0].split('.')[0]
                t2 = join_toks[2].split('.')[0]
                
                if any(t1 in tab.split() for tab in tables) and any(t2 in tab.split() for tab in tables):
                    # print tables
                    for tab in tables:
                        tab_words = tab.split()
                        
                        if t1 in tab_words:
                            tab_t1 = tab
                        elif t2 in tab_words:
                            tab_t2 = tab
                    if from_tabs == '':
                        from_tabs += tab_t1 + ' JOIN ' + tab_t2 + ' ON ' + join
                    else:
                        from_tabs += ' AND ' + tab_t1 + ' JOIN ' + tab_t2 + ' ON ' + join
                    # print tables
                    # print tab_t1, tab_t2
                    tables.remove(tab_t1)
                    # print tables
                    tables.remove(tab_t2)
                    join_num += 1
                elif any(t1 in tab for tab in tables) and not any(t2 in tab for tab in tables):
                    for tab in tables:
                        if t1 in tab:
                            tab_t1 = tab
                    from_tabs += ' JOIN ' + tab_t1 + ' ON ' + join
                    tables.remove(tab_t1)
                    join_num += 1
                elif any(t2 in tab for tab in tables) and not any(t1 in tab for tab in tables):
                    for tab in tables:
                        if t2 in tab:
                            tab_t2 = tab
                    from_tabs += ' JOIN ' + tab_t2 + ' ON ' + join
                    tables.remove(tab_t2)
                    join_num += 1

            # if len(joins) != join_num:
                # print 'joins: ', joins
                # print join_num
                # print "-------------------------not all joins used-----------------!\n"

            if len(tables) != 0:
                for tab in tables:
                    from_tabs += ' , ' + tab
            # print "BW from", sql_bw_from
            sql_back_toks = sql_bw_from.split("FROM")[1].strip().split(' ')
            # print "SQL BACK TOKS", sql_back_toks
            sql_back_toks_new = []
            # for i, tok in enumerate(sql_back_toks):
            #     if ',' == tok or '' == tok:
            #         continue
            #     else:
            #         sql_back_toks_new = sql_back_toks[i - 1:]
            #         break
            for i, tok in enumerate(sql_back_toks):
                if ',' == tok or '' == tok or 'JOIN' == tok or 'ON' == tok:
                    continue
                else:
                    sql_back_toks_new = sql_back_toks[i - 1:]
                    break
            
            # print "SQL BACK TOKS", sql_back_toks_new
            
            if '' in sql_back_toks_new:
                sql_back_toks_new = [x for x in sql_back_toks_new if x != '']
            # print "SQL BACK TOKS", sql_back_toks_new
            if 'WHERE' in sql_back_toks_new:
                wh_id = sql_back_toks_new.index('WHERE')
                # print wh_id
                if 0 <= (wh_id + 1) <len(sql_back_toks_new) and( sql_back_toks_new[wh_id + 1] == 'ORDER' or sql_back_toks_new[wh_id + 1] == 'GROUP'):
                    sql_back_toks_new.remove('WHERE')
                if  (wh_id + 1) == len(sql_back_toks_new):
                    sql_back_toks_new.remove('WHERE')
            
            from_new_str = ' FROM ' + from_tabs + ' ' + ' '.join(sql_back_toks_new)
            new_sql += from_new_str
        sql = new_sql
    # print "before substitution", sql
    for k in replace_dic.keys():
        # print k, '->', replace_dic[k]
        sql = sql.replace(k, replace_dic[k])
    # print  sql
    for k in constraints.keys():
        # print k, '->', constraints[k]
        sql = sql.replace(k, constraints[k])


    # print "RETURN final"
    # print  sql
    return sql


def add_val(sql, val_dict):
    for k in val_dict.keys():
        if len(val_dict[k].strip()) > 0:
            sql = sql.replace(k, val_dict[k])
        else:
            sql = sql.replace(k, default)
    return sql

def compare_results(original_lower_sql,new_lower_sql, c):
    try:
        c.execute(original_lower_sql)
        all_rows_orig = c.fetchall()
    except:
        return -2
    try:
        c.execute(new_lower_sql)
        all_rows_new = c.fetchall()
    except:
        return -1
    if all_rows_new == all_rows_orig:
        # print all_rows_new
        # print all_rows_orig
        if len(all_rows_new) > 0 and len(all_rows_new[0]) > 0:
            return 2
        else:
            return 1
    else:
        return 0




def load_and_process_data(json_path, output_path, sqlite_path=None):
    
    sql_data = []
    output_path = json_path.split(".")[0] + "_" + output_path
    reviewed_file = open(json_path.split(".")[0]+"_dongxu.txt",'w')
    review_count = 0
    if sqlite_path is None:
        sqlite_path = os.path.join("/data/projects/nl2sql/database/",json_path.split(".")[0], json_path.split(".")[0]+".sqlite")
    conn = sqlite3.connect(sqlite_path)
    c = conn.cursor()
    json_path = os.path.join("/data/projects/nl2sql/done_cathy/", json_path)
    print 'loading from %s' % (json_path)
    print 'sqlite path %s' % (sqlite_path)
    with open(output_path, "w") as fout:
        cnt = 0
        cnt_correct = 0
        join_cnt = 0
        different_match_count = collections.Counter()
        with open(json_path) as f:
            ex_list = json.load(f)
            for ex in ex_list:
                cnt += 1
                fout.write("---------------------- " + str(cnt_correct + 1) + " ----------------------\n\n");
                sentences_json = ex["sentences"]
                sents = []
                sentence_to_variable = {}
                example_variables = None
                for sentence in sentences_json:
                    if sentence["text"] in sentence_to_variable:
                        if sentence_to_variable[sentence["text"]] == sentence["variables"]:
                            continue
                    sentence_to_variable[sentence["text"]] = sentence["variables"]
                    # fout.write("Q: " + sentence["text"] + "|")
                    # json.dump(sentence['variables'], fout);
                    example_variables = sentence['variables']
                    if json_path == 'advising.json':
                        break
                sql_org = ex['sql']

                # todo: change debug
                # if "COUNT" not in sql_org[0]:
                #     continue
                
                # INNER is the default, there is no natural in dataset
                if "OUTER" in sql_org[0] or "LEFT" in sql_org[0] or "RIGHT" in  sql_org[0]:
                    print cnt, sql_org[0]
                    fout.write("*****TO CHECK: LEFT/RIGHT/OUTER JOIN!*******\n")

                    join_cnt += 1
                    continue
                original_lower_sql = lower_sql(sql_org[0])

                new_lower_sql = reformat_sql(sql_org[0])
                
                if example_variables is None:
                    result_match = compare_results(original_lower_sql,new_lower_sql, c)
                else:
                    result_match = compare_results(add_val(original_lower_sql, example_variables), add_val(new_lower_sql, example_variables), c)
                
                if result_match == 2:
                    # fout.write("*****MATCH: result matches!*******\n")
                    different_match_count[2] += 1
                elif result_match == 1:
                    # fout.write("*****TO CHECK: empty result matches!*******\n")
                    different_match_count[1] += 1
                elif result_match == 0:
                    fout.write("*****TO CHECK: not exact match!*******\n")
                    different_match_count[0] += 1
                elif result_match == -1:
                    different_match_count[-1] += 1
                    fout.write("*****TO CHECK: illegal sql!*******\n")
                elif result_match == -2:
                    different_match_count[-2] += 1
                    fout.write("*****TO CHECK: illegal original sql!*******\n") 
                    
                if result_match == 2 or result_match == 1:
                    review_count += 1
                    reviewed_file.write(str(review_count) + ". ")
                    candidate_nls = set()
                    for i in range(len(sentences_json)):
                        sentence = sentences_json[i]
                        # if sentence["text"] in sentence_to_variable:
                        #     if sentence_to_variable[sentence["text"]] == sentence["variables"]:
                        #         continue
                        # sentence_to_variable[sentence["text"]] = sentence["variables"]
                        
                        current_nl = add_val(sentence["text"], example_variables)
                        if current_nl not in candidate_nls:
                            if i != 0:
                                reviewed_file.write("P: ")
                            # reviewed_file.write("ORIG: \n" + sql_org[0] + "\n\n")
                            reviewed_file.write(current_nl)
                            candidate_nls.add(current_nl)
                            reviewed_file.write("\n")
                    
                    reviewed_file.write("\n" + add_val(new_lower_sql, example_variables) +"\n\n")
                else:   
                    candidate_nls = set()
                    for i in range(len(sentences_json)):
                        sentence = sentences_json[i]
                        current_nl = add_val(sentence["text"], example_variables)
                        if current_nl not in candidate_nls:
                            if i != 0:
                                fout.write("P: ")
                            fout.write(current_nl)
                            candidate_nls.add(current_nl)
                            fout.write("\n")
                    json.dump(example_variables, fout)
                    fout.write("\n")
                    fout.write("ORIG: \n" + sql_org[0] + "\n\n")
                    fout.write("orig: \n" + original_lower_sql + "\n\n")
                    fout.write("new: \n" + new_lower_sql +"\n\n")
                # if cnt_correct % 10 == 0:
                #     print cnt_correct
                cnt_correct += 1
                fout.flush()
                # if json_path.endswith('advising.json') or example_variables is None:
                #     pass
                # else:
                #     original_with_val = add_val(original_lower_sql, example_variables)
                #     new_with_val = add_val(new_lower_sql, example_variables)
                #     fout.write("orig_val: \n" + original_with_val + "\n\n")
                #     fout.write("new_val: \n" + new_with_val +"\n\n")
                    
                
    conn.close()
    print  "total correct", cnt_correct, cnt, join_cnt, different_match_count

    
if __name__ == "__main__":

    # # load_and_process_data('scholar.json', 'output.txt') # only test with small
    # load_and_process_data('scholar.json', 'output.txt', 'scholar_small.sqlite') # only test with small
    # load_and_process_data('atis.json', 'output.txt', 'atis_schema.sqlite') # only test with schema


    load_and_process_data('geo.json', 'output.txt') # good
    # load_and_process_data('advising.json', 'output.txt') # good
    
    # load_and_process_data('yelp.json', 'output.txt') # bug in original
    # load_and_process_data('academic.json', 'output.txt') # not found 
    # load_and_process_data('imdb.json', 'output.txt') # not found
    # load_and_process_data('restaurants.json', 'output.txt') # not found restaurant 1?


# loading from atis.json
# total correct 947 0 0
# loading from geo.json
# 186 SELECT STATEalias0.STATE_NAME FROM STATE AS STATEalias0 LEFT OUTER JOIN BORDER_INFO AS BORDER_INFOalias0 ON STATEalias0.STATE_NAME = BORDER_INFOalias0.STATE_NAME WHERE STATEalias0.STATE_NAME <> "var0" AND STATEalias0.STATE_NAME <> "var1" GROUP BY STATEalias0.STATE_NAME HAVING COUNT( BORDER_INFOalias0.BORDER ) = ( SELECT MIN( DERIVED_TABLEalias0.DERIVED_FIELDalias0 ) FROM ( SELECT COUNT( BORDER_INFOalias1.BORDER ) AS DERIVED_FIELDalias0 , STATEalias1.STATE_NAME FROM STATE AS STATEalias1 LEFT OUTER JOIN BORDER_INFO AS BORDER_INFOalias1 ON STATEalias1.STATE_NAME = BORDER_INFOalias1.STATE_NAME WHERE STATEalias1.STATE_NAME <> "var0" AND STATEalias1.STATE_NAME <> "var1" GROUP BY STATEalias1.STATE_NAME ) DERIVED_TABLEalias0 ) ;
# 230 SELECT STATEalias0.STATE_NAME FROM STATE AS STATEalias0 LEFT OUTER JOIN BORDER_INFO AS BORDER_INFOalias0 ON STATEalias0.STATE_NAME = BORDER_INFOalias0.STATE_NAME GROUP BY STATEalias0.STATE_NAME HAVING COUNT( BORDER_INFOalias0.BORDER ) = ( SELECT MIN( DERIVED_TABLEalias0.DERIVED_FIELDalias0 ) FROM ( SELECT COUNT( BORDER_INFOalias1.BORDER ) AS DERIVED_FIELDalias0 , STATEalias1.STATE_NAME FROM STATE AS STATEalias1 LEFT OUTER JOIN BORDER_INFO AS BORDER_INFOalias1 ON STATEalias1.STATE_NAME = BORDER_INFOalias1.STATE_NAME GROUP BY STATEalias1.STATE_NAME ) DERIVED_TABLEalias0 ) ;
# total correct 247 0 2
# loading from scholar.json
# total correct 193 0 0
# loading from academic.json
# total correct 185 0 0
# loading from restaurants.json
# total correct 23 0 0
# loading from advising.json
# total correct 194 0 0
# loading from yelp.json
# total correct 110 0 0
# loading from imdb.json
# 23 SELECT COMPANYalias0.NAME FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , MOVIE AS MOVIEalias0 WHERE COPYRIGHTalias0.CID = COMPANYalias0.ID AND MOVIEalias0.MID = COPYRIGHTalias0.MSID AND MOVIEalias0.TITLE = "movie_title0" ;
# 24 SELECT MOVIEalias0.TITLE FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , MOVIE AS MOVIEalias0 WHERE COMPANYalias0.NAME = "company_name0" AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND MOVIEalias0.MID = COPYRIGHTalias0.MSID ;
# 27 SELECT MOVIEalias0.TITLE FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , MOVIE AS MOVIEalias0 WHERE COMPANYalias0.NAME = "company_name0" AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND MOVIEalias0.MID = COPYRIGHTalias0.MSID AND MOVIEalias0.RELEASE_YEAR > movie_release_year0 ;
# 36 SELECT COMPANYalias0.NAME FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , TV_SERIES AS TV_SERIESalias0 WHERE COPYRIGHTalias0.CID = COMPANYalias0.ID AND TV_SERIESalias0.SID = COPYRIGHTalias0.MSID AND TV_SERIESalias0.TITLE = "tv_series_title0" ;
# 37 SELECT TV_SERIESalias0.TITLE FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , TV_SERIES AS TV_SERIESalias0 WHERE COMPANYalias0.NAME = "company_name0" AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND TV_SERIESalias0.SID = COPYRIGHTalias0.MSID ;
# 38 SELECT DIRECTORalias0.NAME FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , DIRECTED_BY AS DIRECTED_BYalias0 , DIRECTOR AS DIRECTORalias0 , TV_SERIES AS TV_SERIESalias0 WHERE COMPANYalias0.NAME = "company_name0" AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND DIRECTORalias0.DID = DIRECTED_BYalias0.DID AND TV_SERIESalias0.SID = COPYRIGHTalias0.MSID AND TV_SERIESalias0.SID = DIRECTED_BYalias0.MSID AND TV_SERIESalias0.TITLE = "tv_series_title0" ;
# 53 SELECT DIRECTORalias0.NAME FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , DIRECTED_BY AS DIRECTED_BYalias0 , DIRECTOR AS DIRECTORalias0 , MOVIE AS MOVIEalias0 WHERE COMPANYalias0.NAME = "company_name0" AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND DIRECTORalias0.DID = DIRECTED_BYalias0.DID AND DIRECTORalias0.GENDER = "director_gender0" AND MOVIEalias0.MID = COPYRIGHTalias0.MSID AND MOVIEalias0.MID = DIRECTED_BYalias0.MSID ;
# 69 SELECT COUNT( DISTINCT ( MOVIEalias0.TITLE ) ) FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , MOVIE AS MOVIEalias0 WHERE COMPANYalias0.NAME = "company_name0" AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND MOVIEalias0.MID = COPYRIGHTalias0.MSID ;
# 72 SELECT COUNT( DISTINCT ( COMPANYalias0.NAME ) ) FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , MOVIE AS MOVIEalias0 WHERE COPYRIGHTalias0.CID = COMPANYalias0.ID AND MOVIEalias0.MID = COPYRIGHTalias0.MSID AND MOVIEalias0.TITLE = "movie_title0" ;
# 74 SELECT COUNT( DISTINCT ( COMPANYalias0.NAME ) ) FROM ACTOR AS ACTORalias0 , CAST AS CASTalias0 , COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , MOVIE AS MOVIEalias0 WHERE ACTORalias0.NAME = "actor_name0" AND CASTalias0.AID = ACTORalias0.AID AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND MOVIEalias0.MID = CASTalias0.MSID AND MOVIEalias0.MID = COPYRIGHTalias0.MSID ;
# 85 SELECT DIRECTORalias0.NAME FROM COMPANY AS COMPANYalias0 , COPYRIGHT AS COPYRIGHTalias0 , DIRECTED_BY AS DIRECTED_BYalias0 , DIRECTOR AS DIRECTORalias0 , MOVIE AS MOVIEalias0 WHERE COMPANYalias0.NAME = "company_name0" AND COPYRIGHTalias0.CID = COMPANYalias0.ID AND DIRECTORalias0.DID = DIRECTED_BYalias0.DID AND MOVIEalias0.MID = COPYRIGHTalias0.MSID AND MOVIEalias0.MID = DIRECTED_BYalias0.MSID ORDER BY MOVIEalias0.RELEASE_YEAR DESC LIMIT 1 ;
# total correct 89 0 11

#scholar
#total correct 193 193 0 Counter({1: 151, 2: 35, -2: 5, -1: 2})
#geo
#total correct 245 247 2 Counter({2: 225, -1: 10, 1: 8, -2: 2})
#atis:
#total correct 947 947 0 Counter({1: 736, -1: 181, 2: 25, -2: 5})
#advising:
#total correct 194 194 0 Counter({1: 109, 2: 61, -2: 14, -1: 10})