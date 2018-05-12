# Different Evaluation Matrices for seq2SQL project

- SQL Hardness criteria
- Exact matching without values
- Partial Matching without Values

## Predicted SQL Parsing

- what if the predicted SQL is not syntactically correct? use what to be used to parse different components?
- use AST tree or our own preprocessing structure?


### SQL Hardness criteria

For all different evaluation metrices, we would get the scores on all SQL-question pairs. Also, we would like to know the scores
on SQL with different hardness levels.

We define:
SQL components 1: WHERE, GROUP BY, ORDER BY, LIMIT, JOIN, OR, LIKE
SQL components 2: EXCEPT, UNION, INTERSECT, NESTED
Others: # of agg > 2, # of select columns > 2 (or has col1-col2 etc.), # of where condition > 2, # of group by clauses > 1, # of group by clauses > 1(or has col1-col2 etc.)

1. easy: if SQL key words ONLY have no or exact ONE from [SQL components 1] and SQL do not satisfy any conditions in [Others] above.
2. medium: SQL satisfies less than two rules in [Others] and do not have more than one word from [SQL components 1]. OR, SQL has exact TWO words from SQL components 1 and less than 1 ruls in [Others]
3. hard: SQL satisfies more than two rules in [Others] and no more than 2 key words in [SQL components 1] but no any word in [SQL components 2], OR SQL has more than 2 key words in [SQL components 1] and satisfies no more than two rules in [Others] but no any words in [SQL components 2], OR SQL has no key words in [SQL components 1] and rules in [Others], but exact one key word in [SQL components 2].
4. extra hard: all others left (you can double check and make some modifications on this criteria according to hardness of implementation and overlap issues of above rules)
5. all: just use all SQL-question pairs to compute different scores listed below.

##### For all SQL-question pairs labeled with differen hardness levels, you are going to compute scores based on below different evaluation matrices.

### Exact Matching without Values

To avoid order problems in each SQL components, we should not just compare the all decodered SQL with whole gold SQL.
Otherwise, for example, SELECT col1, col2 would not be evaluated as the same as SELECT col2, col1. Thus, first compare
set matching for each component and then see if predicted SQL get all SQL parts right. If the predicted result gets all
SQL parts right, then the score of Exact Matching without Values for this predicted example is 1, otherwise 0.

For each SQL example:
1. replace gold and predicted sql values (also no evaluation on distinct key word for now, BUT DO NOT replace them if they are nested queries!) in the AST with the same sepecial tok e.g. _VALUE_. (because we do not predict values)
2. get seperate parts for SELECT, WHERE, GROUP BY, ORDER BY, EXCEPT, UNION, INTERSECT etc. For example, for SELECT: set([(col, agg), (col, agg)]), WHERE: set([col, op, nested], [col, op], [AND, OR])
3. compute if each predicted SQL part is the same as the gold SQL part. For example, for SELECT: if gold set([(col, agg), (col, agg)]) = predict set([(col, agg), (col, agg)]).
4. see if predicted SQL gets all parts right, if so, then score is 1, otherwise, 0.

Final accuracy score = # of right SQL examples / total # of SQL examples

### Partial Matching without Values

In order to know model's performance on different SQL components, it is important to know the detailed scores on each part.

First, do the steps 1 as above. Then, for each SQL, compute accuracy (actually you already computed the accuracy in Exact Matching step 3), recall, precision and F1 scores for all following components:

1. SELECT COLUMN: e.g. gold: ([select, col1, none], [select, col2, max]) and predicted: ([select, col1, none], [select, col3, min]) compute accuracy, recall, precision and F1 scores.
2. SELECT COLUMN WITHOUT AGG: e.g. gold: ([select, col1], [select, col2]) and predicted: ([select, col1], [select, col3]) compute accuracy, recall, precision and F1 scores.
3. ALL AGG: ([select, col1, max], [orderby, *, count], [groupby, col2, having col1, count])
4. WHERE COLUMN: ([where, col1, >=, novalue], [where, col2, =, novalue], [where, col4, NOT IN, nested])
5. WHERE COLUMN WITHOUT OP:  ([where, col1], [where, col4])
6. GROUP BY: ([groupby, col2], [groupby, col5])
7. GROUP BY HAVING: ([groupby, col2, having col1, count, >=])
8. ORDER BY: ([orderby, col1, no agg, desc, no limit], [orderby, *, count, asc, 3])
9. AND/OR: ([where, col1, col2, and], [where, col3, col2, or])
10. EXCEPT, UNION, INTERSECT: 1 if predicted these key words right. 
11. SQL KEY WORDS: for gold and predicted sql, create a set of SQL key words if they are in [where, group by, having, desc, asc, order by, limit, except, union, intersect, not in, in, or, like]

Final accuracy, recall, precision and F1 scores = averaged score over all SQL examples
For 10. EXCEPT, UNION, INTERSECT:: only accuracy is computed # of right SQL examples / total # of SQL examples


#### At the end, you should have (# of SQL Hardness level + all SQL together) * (1 Exact Matching score + 11 Partial Matching scores * 4 different evaluation matrices#acc, F, P, R#).

