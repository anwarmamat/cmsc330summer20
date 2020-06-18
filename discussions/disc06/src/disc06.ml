(* Returns the sum of squares of every integer in xs. *)
let sq_sum (xs : int list) : int =
  0

(* Appends ys to the end of xs (without using @ or List.append). *)
let append (xs : 'a list) (ys : 'a list) : 'a list =
  []

(* Returns the run length encoding of xs
   e.g. run_length [1;1;2;2;1;3;3] -> [(1,2);(2,2);(1,1);(3,2)]. *)
let run_length (xs : 'a list) : ('a * int) list =
  []

(* Returns all elements that does not satisfy the predicate p *)
let block (p : 'a -> bool) (xs : 'a list) : 'a list =
  []

(* Returns the composition of all functions in fs. *)
let composes (fs : ('a -> 'a) list) : ('a -> 'a) =
  fun x -> x
