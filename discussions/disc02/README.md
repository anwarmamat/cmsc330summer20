# Discussion 2: Databases

Due: Friday June 05, 23:59:59

Points: 100P/0SP/0S

In this exercise we will be applying what we know in ruby to implement a simple database.
The hierarchy is such thhat a database contains tables.
Each table contains tuples of a fixed size n,
 where n is the number of columns in the table. 

## Tuple
The tuple class contains an entry in the table. 

You will have to write 3 methods for this section: 

### `Tuple#initialize(data: Array)`
This method initalizes the Tuple class with 
the values coming in from the array `data`.

### `Tuple#getSize() -> Integer`
This method return the number of entries in the tuple

### `Tuple#getData(index: Integer) -> ...`
This method returns the data in a particular index of a tuple (which is 0 indexed) 
if the `index > 0` then `nil` should be returned.

## Table

### `Table#initialize(column_names: Array)`
This initializes the table with 
an array of strings that serve as the column names.

### `Table#getSize() -> Integer`
This returns the number of tuples in the table

### `Table#insertTuple(tuple: Tuple) -> Object`
This method inserts a tuple into the table. 
You have to make sure that
 the tuple is of the correct size based of the `column_names`. 
It returns a _falsy_ value when the instertion fails and a 
_truthy_ object when the instertions succeeds 


### `Table#selectTuples(column_names) -> Array`
This method returns an array whose values correspond
to the `column_names` mentioned above. 

## Database

### `Database#initialize`
This initializes the data structure used for the database. 
We need a structure that has O(1) access. 
Which data structure have you learnt that you can use here? 

### `Database#createTable(table_name : String, column_names : Array)`
 This method creates a new table in the database with the given table name.
 It returns _truthy_ value on success and _falsy_ value on failure.
 The table will have the columns named in `column_names`.
 If a table with `table_name` already exists, this is regarded as a failure.
 `column_names` is a non empty Array of Strings

### `Database#dropTable(table_name : String)`
 This method will delete `table_name` from the database.
 All of its tuples will be deleted in the process.
 This method will return true on success and false on failure.
 If the table name is not found, this is regarded as a failure.
 `table_name` is a String

### `Database#select(table_name : String, column_names : Array)`
This method will return all tuples in `table_name`
  only for the corresponding `column_names`.
The result is returned as an array of tuples.
Assume that `table_name` exists and the `column_names` match those of the table.

`column_names` is a non empty Array of Strings

### `Database#insert(table_name : String, data : Array)`
 This method will insert a tuple of size n into the `table_name` and return true on success and false on failure.
 If the tuple size is not equal to the number of columns in the table, 
  or the `table_name` does not exist, 
 this is regarded as a failure.

 data is a non empty Array whose elements form the tuple to be inserted into the table.
