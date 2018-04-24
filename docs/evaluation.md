## Evaluation Methods

##### Evaluation based on AST ouput

1. parse all SQL into AST
2. parse AST to compute different scores including:
  - SELECT COLUMN #
  - SELECT COLUMNS (EXACT MATCH e.g. score: 0/1 or OVERLAP e.g score: 2/3)
  - SELECT AGG based on COL (EXACT MATCH e.g. score: 0/1 or OVERLAP e.g score: 2/3) do not compute the score for the case where gold agg is none and predicted agg is none as well.
  - sel
