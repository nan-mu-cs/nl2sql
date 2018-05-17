# Different Evaluation Metrics for seq2SQL project

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
- SQL components 1: WHERE, GROUP BY, ORDER BY, LIMIT, JOIN, OR, LIKE，HAVING
- SQL components 2: EXCEPT, UNION, INTERSECT, NESTED
- Others: # of agg > 1, # of select columns > 1, # of where conditions > 1, # of group by clauses > 1, # of group by clauses > 1 (no consider col1-col2 math equations etc.)

1. easy: 
   - if SQL key words have ZERO or exact ONE from [SQL components 1] and SQL do not satisfy any conditions in [Others] above. AND no word from [SQL components 2].
2. medium: 
   - SQL satisfies no more than two rules in [Others] and do not have more than one word from [SQL components 1]. AND no word from [SQL components 2]
   - or, SQL has exact 2 words from SQL components 1 and less than 2 ruls in [Others]. AND no word from [SQL components 2]
3. hard: 
   - SQL satisfies more than two rules in [Others], with no more than 2 key words in [SQL components 1] and NO word in [SQL components 2]
   - or, SQL has 2 < # key words in [SQL components 1] <= 3 and satisfies no more than two rules in [Others] but NO word in [SQL components 2].
   - or, SQL has no more than 1 key word in [SQL components 1] and NO rule in [Others], but exact one key word in [SQL components 2].
4. extra hard:
   - all others left (you can double check and make some modifications on this criteria according to hardness of implementation and overlap issues of above rules)
5. all: just use all SQL-question pairs to compute different scores listed below.

##### For all SQL-question pairs labeled with different hardness levels, you are going to compute scores based on below different evaluation matrices.

### Exact Matching without Values

To avoid order problems in each SQL components, we should not just compare the all decodered SQL with whole gold SQL.
Otherwise, for example, SELECT col1, col2 would not be evaluated as the same as SELECT col2, col1. Thus, first compare
set matching for each component and then see if predicted SQL get all SQL parts right. If the predicted result gets all
SQL parts right, then the score of Exact Matching without Values for this predicted example is 1, otherwise 0.

For each SQL example:
1. replace gold and predicted sql values because we do not predict values in our task definition. BUT DO NOT replace VALUES if they are nested queries! Also, no evaluation on distinct key word for now.
2. get seperate parts for SELECT, WHERE, GROUP BY, ORDER BY, EXCEPT, UNION, INTERSECT etc. For example, for SELECT: set([(col, agg), (col, agg)]), WHERE: set([col, op, nested], [col, op], [AND, OR])
3. compute if each predicted SQL part is the same as the gold SQL part. For example, for SELECT: if gold set([(col, agg), (col, agg)]) = predict set([(col, agg), (col, agg)]).
4. see if predicted SQL gets all parts right, if so, then score is 1, otherwise, 0.

Final accuracy score = # of right SQL examples / total # of SQL examples

### Partial Matching without Values

In order to know model's performance on different SQL components, it is important to know the detailed scores on each part.

First, replace gold and predicted sql values because we do not predict values in our task definition. BUT DO NOT replace VALUES if they are nested queries! Also, no evaluation on distinct key word for now.

Then, for each SQL, compute accuracy and [F1 scores](https://en.wikipedia.org/wiki/F1_score) for all following components:

1. SELECT COLUMN: e.g. gold: ([select, col1, none], [select, col2, max]) and predicted: ([select, col1, none], [select, col3, min]) compute accuracy, recall, precision and F1 scores.
2. SELECT COLUMN WITHOUT AGG: e.g. gold: ([select, col1], [select, col2]) and predicted: ([select, col1], [select, col3]) compute accuracy, recall, precision and F1 scores.
3. WHERE COLUMN: ([where, col4, NOT IN, NESTED SQL], [where, col1, >=, novalue], [where, col2, =, novalue])
4. WHERE COLUMN WITHOUT OP:  ([where, col1], [where, col4])
5. GROUP BY: ([groupby, col2], [groupby, col5])
6. GROUP BY HAVING: ([groupby, col2, having col1, count, >=])
7. ORDER BY: ([orderby, col1, no agg, desc, no limit], [orderby, *, count, asc, 3])
8. AND/OR: ([where, col1, col2, and], [where, col3, col2, or])
9. EXCEPT, UNION, INTERSECT, NESTED SQL: get the except/union/intersect/nested part in all SQLs containing except/union/intersect/nested, check if predicted except/union/intersect/nested part equals to the gold except/union/intersect/nested part.
10. SQL KEY WORDS: for gold and predicted sql, create a set of SQL key words if they are in [where, group by, having, desc, asc, order by, limit, except, union, intersect, not in, in, or, like]

Final accuracy and F1 scores = averaged score over all SQL examples

#### At the end, you should have (# of SQL Hardness level + all SQL together) * (1 Exact Matching score + 10 Partial Matching scores * 2 different evaluation matrices# acc and F).

