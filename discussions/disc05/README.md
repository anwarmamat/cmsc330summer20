# Discussion 5: Higher Order Functions
Due: Wed 17 Jun 2020 11:59 PM

Points: 100P/0SP/0S

You will need to implement the following functions in src/disc05.ml.

## Submitting
You will submit this project to Gradescope. Click on the "disc05" assignment and submit only your **disc05.ml** file in the src directory. Don't zip your solution. ***Any files other than disc05.ml will be ignored***.


## `filter`
### Type: ('a -> bool) -> 'a list -> 'a list`
Returns elements in the list argument satisfying predicate `f`.

## `pick`
### Type: `('a -> bool) -> ('a * 'b) list -> 'b`
In OCaml it is common practice to represent related values using tuples and lists,
 where the first elemet of the tuple is the key,
 and the second element of the tuple is the value
These lists are typically called association lists.

Returns the first element in the association list in the argument satisfying predicate `f`.

## `set`
### Type: `: int -> 'a -> 'a list -> 'a list`
Returns a list with the `k`th element of the list set to the input value

## `negate`
### Type: `: ('a -> bool) -> 'a -> bool`
Returns a function that is the negation of the above function

## `composes`
### Type: `: ('a -> 'a) list -> 'a -> 'a`
Returns a new function that takes in a list of functions,
 and returns the composition of all the functions

```ocaml
let lst = [f; g; h] 
composes lst
(*should be equivalent to*)
fun x -> (f (g (h x)))
```


