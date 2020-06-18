# Discussion 06: Fold the Lists
Date: Thu 18 Jun 2020 11:00 EDT
50P/50R/0S

## Introduction

Complete the functions in `disc.ml` **without using recursion**.

## `sq_sum xs: int list -> int`
This function computes sum of the square of all the integers  
  of a given `xs : int list`

```ocaml
sq_sum [] = 0
sq_sum [1] = 1
sq_sum [1;2] = 5
```

## `append xs ys: 'a list -> 'a list -> 'a list`
Given two lists appends `ys`at to the end of `xs`

```ocaml
append [] [] = []
append [1; 2] [] = [1; 2]
append [] [1;2] = [1;2]
append [1] [2] = [1;2]
append [1;2] [3;4] = [1;2;3;4]
```

## `run_length : 'a list -> ('a * int) list`
Given a given list returns the run length encoding of the list. 
This goes down the list and replaces the elements 
  with the counts of a consecutive block of the element

```ocaml
run_length [] = []
run_length [1] = [(1,1)]
run_length [1;1;1;1] = [(1,4)]
run_length [1;1;2;2] = [(1,2); (2,2)]
```

## `block : ('a -> bool) -> 'a list -> 'a list`
Returns all elements that does not satisfy the predicate p

```ocaml
let turthy = fun x -> true;;
let falsey = fun x -> false;;
let is_even = fun x -> (x mod 2) = 0 ;;

block truthy [] = []
block falsey [1; 2; 3; 4] = [1; 2; 3; 4] 
block truthy [1; 2; 3; 4] = []
block even [1; 2; 3; 4] = [1; 3]
```
## `composes: ('a -> 'a) list -> 'a -> 'a`
This returns the composition of all the functions in fs.
If the list it empty, then there are no functions to compose, thus not doing anything(i.e. returns whatever is passed in). 
```ocaml
let add1 = ( + ) 1;;
let dbl  = ( * ) 2;;

composes [] 0 = 0;;
composes [] "a" = "a";;
composes [add1] 0 = 1;;
composes [add1; dbl] 2 = 5;;
composes [dbl; add1] 2 = 6;;
```
