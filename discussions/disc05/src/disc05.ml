(* Returns elements in xs satisfying predicate f. *)
let rec filter (f : 'a -> bool) (xs : 'a list) : 'a list =
  failwith "filter unimplemented"

(* Given an associative list, find the value corresponding to the key k*)
let rec pick (k : 'a -> bool) (mp : ('a * 'b) list) : 'b =
  failwith "pick unimplemented"

(* Sets the kth element of xs to r. *)
let rec set (k : int) (r : 'a) (xs : 'a list) : 'a list =
  failwith "set unimplemented"

(* Return the negation of the predicate f. *)
let negate (f : 'a -> bool) : 'a -> bool =
  failwith "negate unimplemented"

(* Returns the composition of functions fs. *)
let rec composes (fs : ('a -> 'a) list) : 'a -> 'a =
  failwith "composes unimplemented"
