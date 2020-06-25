# Discussion 8: Are You Having Fun?
Date: Tue 25 June 2020

50P/50R/0S

## Introduction

Complete `disc.ml` **without** defining any new functions (neither named
nor anonymous) or making any of the existing ones recursive. There should
be no `fun` in your file!

You may use anything from Pervasives, but may only use map and the folds
from the List module. All other modules are prohibited.

This exercise is **not** graded.

## String Function

### `val join : string list -> string -> string`
Joins together the strings in xs by separator sep
   e.g. join ["cat"; "dog"; "fish"] "," = "cat,dog,fish".

## Option Functions
### `val list_of_option : 'a option -> 'a list`
Converts an option to a list. Some is a singleton containing
   the value, while None is an empty list.
### `val get_first : 'a option -> 'a option -> 'a option`
Returns the first option that contains a value, None otherwise
   e.g. getFirst (Some 1) (Some 2) = Some 1
### `val match_key : 'k -> 'k * 'v -> 'v option`
If the pair's key matches k returns the value as an option. Otherwise
   return None.

## Dictionary Functions
Here is the type for dictionaries
```ocaml
type ('k, 'v) dict = ('k * 'v) list
```
### `val set : ('k, 'v) dict -> 'k -> 'v -> ('k, 'v) dict`
Creates a key-value pair association in the dictionary
   (later bindings should shadow earlier ones) 
### `val get : ('k, 'v) dict -> 'k -> 'v option`
Returns the value associated with a key (as an option) 
### `val get_some_values : ('k, 'v) dict -> 'k list -> 'v option list`
Given a list of keys, returns a list of options of the associated
   values (and None if the key wasn't found).
### `val get_values : ('k, 'v) dict -> 'k list -> 'v list`
Given a list of keys, returns a list of the values associated
   with the keys.
