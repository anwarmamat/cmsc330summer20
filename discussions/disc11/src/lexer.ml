(* Type *)
type token =
  Tok_Fun
| Tok_Var of string
| Tok_Arrow
| Tok_LParen
| Tok_RParen
| Tok_EOF

(* Given source code returns a token list. *)
let rec lex (s : string) : token list =
  []

(* Returns a string representation of a token list. *)
let rec string_of_tokens (ts : token list) : string =
  ""
