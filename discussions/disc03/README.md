# Discussion 03: Database Select! 
Last discussion we had made a database library. 
In this discussion we will modify it using the concepts we have studied over the past few lectures. 

## Regular Expressions
We want to regulate the name of the tables but
we do not want to write an elaborate switch statement to check through all the possibilities. 
To achieve this we will be using regular expressions! 

You will be reimplementing the `create_table` method:

### `createTable(table_name : String, column_names : String Array) -> Integer`
 This method creates a new table in the database with the given table name.
 It returns an `Integer` on success and `nil` on failure.
 The table will have the columns named in `column_names`.

 If a table with `table_name` already exists, this is regarded as a failure.

 If the `table_name` does not match the specification below, 
   this is also a failure.

 Return the numeric part of the `table_name` (0 if none) 
   as an `Integer` on success.

 `table_name` is a String that starts with an uppercase letter, 
   followed by any number of lower case letters, and could end
   with a number in the set `[1, 1000]` (trailing 0's allowed e.g 00094). 

 `column_names` is a non empty Array of Strings

## Code Blocks

The method we use earlier to select the relevant data returned an array. 
Since the database is a container 
we want some mechanism to iterate through all the records and perform some action on it.
Moreover, It is very un-ruby like just to return an array. 

You want to construct your `select` command such that you can do the following:
``` ruby
db.select("table", ["col1", "col2"] do |tuple|
    # some action with tuple
end
```
If you want to see an example in action check the `test_SelectWithCodeBlock`


### `select(table_name : String, column_names : String Array) -> Tuple Array`
 This method returns an array of tuples, where each tuple has been narrowed down to include only 
 the data that belongs to columns whose names are in `column_names`.

 If a code block is passed in, the final result should be filtered through that code block.
 Only tuples for which the code block returns true should be included in the final array of tuples that is returned.

 Assume that `table_name` exists and `column_names` is a subset of the names of the columns of the table.

`table_name` is a String
`column_names` is a non empty Array of Strings

