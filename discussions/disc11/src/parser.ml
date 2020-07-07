open Lexer

(* Types *)
type var = string
type expr =
  Fun of var * expr
| App of expr * expr
| Var of var

type parse_result = token list * expr

(* Returns next token in the list. *)
let lookahead (tok_list : token list) : token =
  match tok_list with
    [] -> raise (Failure "no tokens")
  | (h::t) -> h

(* Matches the top token in the list. *)
let consume (a : token) (tok_list : token list) : token list =
  match tok_list with
    (h::t) when a = h -> t
  | _ -> raise (Failure "bad match")

(* Parses a token list. *)
let rec parse (toks : token list) : expr =
  let toks, exp = parse_T toks in
  if toks <> [Tok_EOF] then
    raise (Failure "did not reach EOF")
  else
    exp

(* Parses the T (term) rule. *)
and parse_T (tok_list : token list) : parse_result =
  (tok_list, Var "implement this function")

(* Parses the X (variable) rule. *)
and parse_X (tok_list : token list) : parse_result =
  (tok_list, Var "implement this function")

(* Returns string representation of the AST. *)
let rec string_of_expr (m : expr) : string =
  "implement this function"
