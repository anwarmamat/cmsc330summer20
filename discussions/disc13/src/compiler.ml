open Ast

(* Church Booleans *)
(* You must implement these. See the slides and other resources
   for the encodings. *)
let church_t = Var "unimplemented"
let church_f = Var "unimplemented"
let church_if = Var "unimplemented"
let church_and = Var "unimplemented"

(* Church Numerals *)
let succ =
    let a = Var "f" in
    let b = App (App (Var "n", Var "f"), Var "x") in
    Fun ("n", Fun ("f", Fun ("x", App (a, b))))
let add = Fun ("m", Fun ("n", App (App (Var "n", succ), Var "m")))
(* The discovery of pred is due to Church's student Kleene (yes, the same
   Kleene of Kleene star). He came up with the solution while high on
   laughing gas at the dentist. *)
let pred =
    let a = Var "n" in
    let b = Fun ("g", Fun ("h", App (Var "h", App (Var "g", Var "f")))) in
    let c = Fun ("u", Var "x") in
    let d = Fun ("u", Var "u") in
    Fun ("n", Fun ("f", Fun ("x", App (App (App (a, b), c), d))))
let sub = Fun ("m", Fun ("n", App (App (Var "n", pred), Var "m")))
let iszero = Fun ("n", App (App (Var "n", Fun ("x", church_f)), church_t))
let leq = Fun ("m", Fun ("n", App (iszero, App (App (sub, Var "m"), Var "n"))))
let eq =
    let left = App (App (leq, Var "m"), Var "n") in
    let right = App (App (leq, Var "n"), Var "m") in
    Fun ("m", Fun ("n", App (App (church_and, left), right)))

(* Fixpoint *)
(* This is the standard (not CBV) fixpoint combinator. Our evaluator is
   lazy so this combinator will work fine. *)
let fix =
  let a = UFun (["x"], UApp (UVar "f", UApp (UVar "x", UVar "x"))) in
  UFun (["f"], UApp (a, a))

(* Compiler *)
(* The compiler will convert a MicrOCaml program into a semantically
   equivalent NanOCaml program. You have to implement most of these
   cases. *)
let rec compile (e : uexpr) : expr =
  match e with
  | UVar x -> Var x
  | UFun (params, body) -> raise (Failure "unimplemented")
  | UApp (t1, t2) -> raise (Failure "unimplemented")
  | UBool x -> raise (Failure "unimplemented")
  | UNat x -> raise (Failure "unimplemented")
  | UEq (t1, t2) -> App (App (eq, compile t1), compile t2)
  | UPlus (t1, t2) -> App (App (add, compile t1), compile t2)
  | USub (t1, t2) -> App (App (sub, compile t1), compile t2)
  | ULetRec (f, params, body, e) ->
     compile (ULet (f, UApp (fix, UFun (f :: params, body)), e))
  | ULetFun (f, params, body, e) ->
     raise (Failure "unimplemented")
  | ULet (x, y, z) -> raise (Failure "unimplemented")
  | UIf (x, y, z) -> raise (Failure "unimplemented")
  | _ -> raise (Failure "cannot compile")
