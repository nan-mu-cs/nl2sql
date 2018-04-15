# SQL Matching Model

## On a Sidenote

Even outside of this context, models from stage 1 and 3 can be used before and after any model to potentially improving their results. While any other model can be used as the model for step 2.

## Overview

```
raw question string -1-> question + pattern -2-> question + pattern + column names and values (question-SQL candidates) -3-> final SQL
```

## Pros and Cons

Pros:

- simple and efficient
- direct and intuitive, analogous to the way humans learn and write SQL
- generalized the matching between question and SQL, based on the comparison of previous work in the field (e.g. Iyers, doing the question-question match which would fail on other databases)
    - the patterns are universal across all databases

Cons:

- Usage of templates, even though you have much more patterns than WikiSQL and ATIS, and covers vast majority of all possible SQLs, they are still patterns and cannot cover 100% possible SQLs.

## Stages

### 1. Question-SQL Pattern Match

Technically this is also a NLI model because it studies the matching between things (in this case, question and pattern)

- input: question
    - e.g. "What are the names of all customers?"
- output: top $k$ likely pattern that the question could potentially match
    - e.g. `[SELECT_ALL_FROM, SELECT_ALL_FROM_WHERE, SELECT_FROM_WHERE]`
    - using $k$ as a hyper-parameter, we could start by trying $1$

We have two options: matching with questions with column names etc., or just the question skeleton without column name and values.

#### Training Dataset

For training we could be trying the DB approaches (e.g. NaLIR), or neural network models (e.g. NN model with beam search)

- define a series of patterns
    - this can be done by looking through all the training SQLs without column name and values
- remove all the non-keywords (column names and values) from both SQL and questions in the training data
    - remove by first getting all the non-keywords from the SQL
    - then for each of these non-keyword, try to find something similar from the question and remove it
- then we would be having a `(question skeleton, pattern)` pair for each training exmaple
- label all these with value `1` (indicating that they are indeed a match), and produce some random mismatched question-query pairs and label them with `0` (or use the overlapping score between the correct and fake queries)
- then we would be having a list of training examples in the form `(question skeleton, pattern, is_match)`, feed this into the NLI model
- we don't match question skeleton with query skeleton directly due to the consideration of the amount of data, as in that way the amount of training data would be exponential to the number of training examples

Negative sampling generation:

1. Random matching a question
    - can try different positive-negative ratio (1:1, 1:2, 1:3 etc)
2. Make small changes to existing data and mark them as negative
    - like changing the value in the query or changing `min` to `max`
3. Try using a similarity measure generating a floating point value instead of just the distinct between positive and negative samples

#### Trained Process

Use one of the exsiting models from [NLI](https://nlp.stanford.edu/projects/snli/).

### 2. Column Name and Value Identification

This model is used to find the column names and values that appeared in the raw question texts.

#### Possible Approaches

1. use question text, database schema and content to find match (like string match)
2. training, with input being the question with a boolean vector indicating which columns are involved in this question
    - but then the output is not ordered and we still have to determine the permutation of these column names in later stages
3. as we have determined the pattern, and for each location that would need filling in column names, train a function `f(raw_question_string, WHERE) -> column_name` that determines what is likely to be in that clause
    - in this way we have solved the problem of ordering/permutation


### 3. Question-Query Matching

Traditionally used to infer the relationship between two sentences, e.g. relationship between "The male athletes are playing a game" and "Those men are playing a game" would be composition. Here we would be using a simplified and modified version, with the following changes:

1. The inputs are not two sentences, but a question with a SQL
2. The objective is only to determine whether the question and the SQL match, doing a binary classification

We have many exsiting models for this, just find one (preferrably with code) off Stanford's website.

#### With column name vs. without column name

We have the option of using the column name or not. If yes, match the raw question with filled SQLs, otherwise we would be matching the question skeleton with the query skeleton.

#### Training Dataset

Create the dataset with a similar method to the first stage, using original match as 1 and random mismatch as 0.

We need to handle the ordering problem, as some column names and constraints can be reordered. We can address this problem by creating training examples with different SQL internal order with the original question (marked as 1)

For testing pipeline:

Based on the approaches 1 and 2 in the previous step, we can create the training datasets for this step by:

- take the column attributes and values into account to get a subset of SQL candidates based on the question.

For the approach 3 in the last step, we can generate several possible SQL candidates from the model.

## Why Two NLI Models?

The input/output of these models are slightly different, and they work for different purposes. The first one exists primarily for narrowing down the possible candidates for the second model (otherwise the number of potential candidates would grow exponentially to table size)

# Seq2Seq-SQL Generation

## Pros and Cons

Pros:

- can handle nested queries
- no use of templates
- Seq2seq model

Cons:

- ordering problem during SQL generation
- performance maybe low

## Overview

Based on paper [A Syntactic Neural Model for General-Purpose Code Generation](https://arxiv.org/abs/1704.01696), [ACL Presentation](https://vimeo.com/234954608), [code](https://github.com/pcyin/NL2code).

1. Write the SQLs in the following format

    ```
    <\start>
        select col_name <\n>
        where col_1 >
            <\start>
                nested SQL content
            <\end> <\n>
        group by col_2 <\n>
        ...
    <\end>
    ```

2. The encoder-decoder structure can be extended to our task, and we can define our own `applyRule` and `genTokens` (tokens allowed based on the previous state)

# Seq2Seq But with Only Skeletons

SQLs with column names and values suffers a lot from ordering problem, SQLs with only keywords can almost eliminate that issue.

Therefore we can use the seq2seq model and produce the SQL skeleton with questions first, then fill in the blanks.
