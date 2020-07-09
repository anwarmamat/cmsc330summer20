open Disc.Parser

(* (Parameterized) type of an environment. *)
type 'a env = (var * 'a) list

(* Type of a closure. *)
type closure = Closure of closure env * expr

(* Evaluates expression t. *)
let rec eval (t : expr) : expr =
  raise (Failure "unimplemented")

(* Evaluates term t in environment e (environment-passing-style). *)
and eval_eps (e : closure env) (t : expr) : closure =
  raise (Failure "unimplemented")

