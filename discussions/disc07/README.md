# Discussion 07 

Due Date: Wed 24 June 2020, 11:59PM

Points: 50P/50SP/0S

## Introduction
In a previous exercise you had implemented the `run_length:'a list -> ('a * int) list`.
We will be expanding on this by making a type for this new list called `lelist`. 

```ocaml
type 'a lelist = 
    Cons of ('a * int * 'a lelist)
    | Empty
```

Your task for this exercise is to implement the following common operations needed for a list. 

## `map : ('a -> 'b) -> 'a lelist -> 'b lelist`
This is a function that applies the given function to every element in the given list.
## `foldl : ('a -> 'b -> 'a) -> 'a -> 'b lelist -> 'a`
This function should be equivalent to the fold_left with lists
## `foldr : ('b -> 'a -> 'a) -> 'b lelist -> 'a -> 'a `
This function should be equivalent to the fold_right with lists
## `find : ('a -> bool) -> 'a lelist -> 'a option`
This function returns an option type,
  where if the element functions returns true it returns Some of the first occurrence 
  and None if there are no occurrences
## `contains : 'a lelist -> 'a -> bool`
If the input element is contained in the list then this returns true otherwise false
