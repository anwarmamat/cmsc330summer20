module L = List

(* MicrOCaml Terms *)

type uexpr =
  | UFun of string list * uexpr
  | UApp of uexpr * uexpr
  | UVar of string
  | UBool of bool
  | UNat of int
  | UEq of uexpr * uexpr
  | UPlus of uexpr * uexpr
  | USub of uexpr * uexpr
  | ULetFun of string * string list * uexpr * uexpr
  | ULetRec of string * string list * uexpr * uexpr
  | ULet of string * uexpr * uexpr
  | UIf of uexpr * uexpr * uexpr

  (* Ignore this one... *)
  | UParams of string list

(* NanOCaml Terms *)

type expr =
  | Fun of string * expr
  | App of expr * expr
  | Var of string

(* Printing Terms *)

let rec join (xs : string list) : string =
  match xs with
  | [] -> ""
  | [x] -> x
  | x :: xt -> x ^ " " ^ (join xt)

let rec string_of_expr (m : expr) : string =
  match m with
  | Fun (v, m) -> "(fun " ^ v ^ " -> " ^ (string_of_expr m) ^ ")"
  | App (m, n) -> "(" ^ (string_of_expr m) ^ " " ^ (string_of_expr n) ^ ")"
  | Var v -> v

let rec string_of_uexpr (t : uexpr) : string =
  match t with
  | UFun (xs, b) -> "(fun " ^ (join xs) ^ " -> " ^ (string_of_uexpr b) ^ ")"
  | UApp (t1, t2) -> "(" ^ (string_of_uexpr t1) ^ " " ^ (string_of_uexpr t2) ^ ")"
  | UVar x -> x
  | UBool x -> string_of_bool x
  | UNat x -> string_of_int x
  | UEq (t1, t2) -> (string_of_uexpr t1) ^ " = " ^ (string_of_uexpr t2)
  | UPlus (t1, t2) -> (string_of_uexpr t1) ^ " + " ^ (string_of_uexpr t2)
  | USub (t1, t2) -> (string_of_uexpr t1) ^ " - " ^ (string_of_uexpr t2)
  | ULetRec (x, vs, t1, t2) ->
     "let rec " ^ join (x :: vs) ^ " = " ^ (string_of_uexpr t1) ^ " in " ^ (string_of_uexpr t2)
  | ULetFun (x, vs, t1, t2) ->
     "let " ^ join (x :: vs)  ^ " = " ^ (string_of_uexpr t1) ^ " in " ^ (string_of_uexpr t2)
  | ULet (x, t1, t2) ->
     "let " ^ x ^ " = " ^ (string_of_uexpr t1) ^ " in " ^ (string_of_uexpr t2)
  | UIf (x, y, z) ->
     "if " ^ (string_of_uexpr x) ^ " then " ^ (string_of_uexpr y) ^ " else " ^ (string_of_uexpr z)
  | _ -> raise (Failure "cannot print uexpr")

(* Normalizing *)
(* We use a normal-order evaluation strategy with capture-avoiding substitution.
   This is guaranteed to find the normal form if it exists. *)

let cntr = ref (-1)
let fresh () =
    cntr := !cntr + 1;
    "_" ^ (string_of_int !cntr)

let rec normalize (t : expr) : expr =
  fix step t

and step (t : expr) : expr =
  match t with
    Fun (x, t) -> Fun (x, step t)
  | Var _ -> t
  | App (m, n) ->
      (match m with
         Fun (x, b) -> subst b x n
       | _ ->
           let m' = step m in
           if m <> m' then App (m', n) else App (m, step n))

and subst (t : expr) (x : string) (v : expr) : expr =
  match t with
    Fun (y, _) when x = y -> t
  | Fun (y, b) ->
      let z = fresh () in
      Fun (z, subst (subst b y (Var z)) x v)
  | App (o, p) -> App (subst o x v, subst p x v)
  | Var y when x = y -> v
  | Var _ -> t

and fix f x0 = let x1 = f x0 in if x0 = x1 then x0 else fix f x1

(* Normal Form Printing *)
(* We recognize Church encodings of lambda terms and print
   them in a nice way. *)

let rec int_of_normal (t : expr) : int option =
  match t with
    Fun (_, Fun (x, Var y)) when x = y -> Some 0
  | Fun (f, Fun (x, App (Var g, t'))) when f = g ->
      (match int_of_normal (Fun (f, Fun (x, t'))) with
         Some n -> Some (n + 1)
       | None -> None)
  | _ -> None

let bool_of_normal (t : expr) : bool option =
  match t with
    Fun (a, Fun (_, Var c)) when a = c -> Some true
  | Fun (_, Fun (b, Var c)) when b = c -> Some false
  | _ -> None

let string_of_normal (t : expr) : string =
  match (int_of_normal t, bool_of_normal t) with
    (Some n, _) -> string_of_int n
  | (_, Some b) -> string_of_bool b
  | (_, _) -> string_of_expr t
