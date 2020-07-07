open OUnit2
open Disc.Lexer
open Disc.Parser

(* Programs *)

let var_x = "x"
let var_zoo = "zoo"
let fun_x = "(fun x -> x)"
let fun_zoo = "(fun zoo -> zoo)"
let fun_nested = "(fun x -> (fun zoo -> x))"
let app = "(x y)"
let app_reduce = "(((fun x -> (fun y -> x)) a) b)"
let app_high_order = "(((fun x -> (fun y -> (x y))) (fun z -> z)) a)"

(* Token Lists *)

let var_x_tokens = [Tok_Var "x"; Tok_EOF]
let var_zoo_tokens = [Tok_Var "zoo"; Tok_EOF]
let fun_x_tokens = [Tok_LParen; Tok_Fun; Tok_Var "x"; Tok_Arrow;
                    Tok_Var "x"; Tok_RParen; Tok_EOF]
let fun_zoo_tokens = [Tok_LParen; Tok_Fun; Tok_Var "zoo"; Tok_Arrow;
                      Tok_Var "zoo"; Tok_RParen; Tok_EOF]
let fun_nested_tokens = [Tok_LParen; Tok_Fun; Tok_Var "x"; Tok_Arrow;
                         Tok_LParen; Tok_Fun; Tok_Var "zoo"; Tok_Arrow;
                         Tok_Var "x"; Tok_RParen; Tok_RParen; Tok_EOF]
let app_tokens = [Tok_LParen; Tok_Var "x"; Tok_Var "y"; Tok_RParen; Tok_EOF]
let app_reduce_tokens = [Tok_LParen; Tok_LParen; Tok_LParen; Tok_Fun;
                         Tok_Var "x"; Tok_Arrow; Tok_LParen; Tok_Fun; Tok_Var "y";
                         Tok_Arrow; Tok_Var "x"; Tok_RParen; Tok_RParen; Tok_Var "a";
                         Tok_RParen; Tok_Var "b"; Tok_RParen; Tok_EOF]
let app_high_order_tokens = [Tok_LParen; Tok_LParen; Tok_LParen; Tok_Fun; Tok_Var "x";
                             Tok_Arrow; Tok_LParen; Tok_Fun; Tok_Var "y"; Tok_Arrow;
                             Tok_LParen; Tok_Var "x"; Tok_Var "y"; Tok_RParen; Tok_RParen;
                             Tok_RParen; Tok_LParen; Tok_Fun; Tok_Var "z"; Tok_Arrow;
                             Tok_Var "z"; Tok_RParen; Tok_RParen; Tok_Var "a"; Tok_RParen;
                             Tok_EOF]

(* ASTs *)

let var_x_ast = Var "x"
let var_zoo_ast = Var "zoo"
let fun_x_ast = Fun ("x", Var "x")
let fun_zoo_ast = Fun ("zoo", Var "zoo")
let fun_nested_ast = Fun ("x", Fun ("zoo", Var "x"))
let app_ast = App (Var "x", Var "y")
let app_reduce_ast = App (App (Fun ("x", Fun ("y", Var "x")), Var "a"), Var "b")
let app_high_order_ast = App (App (Fun ("x", Fun ("y", App (Var "x", Var "y"))),
                                   Fun ("z", Var "z")), Var "a")

(* Tests *)

let test_lex_easy ctxt =
  assert_equal var_x_tokens (var_x |> lex);
  assert_equal var_zoo_tokens (var_zoo |> lex);
  assert_equal fun_x_tokens (fun_x |> lex);
  assert_equal fun_zoo_tokens (fun_zoo |> lex);
  assert_equal fun_nested_tokens (fun_nested |> lex)

let test_lex_hard ctxt =
  assert_equal app_tokens (app |> lex);
  assert_equal app_reduce_tokens (app_reduce |> lex);
  assert_equal app_high_order_tokens (app_high_order |> lex)

let test_parse_easy ctxt =
  assert_equal var_x_ast (var_x_tokens |> parse);
  assert_equal var_zoo_ast (var_zoo_tokens |> parse);
  assert_equal fun_x_ast (fun_x_tokens |> parse);
  assert_equal fun_zoo_ast (fun_zoo_tokens |> parse);
  assert_equal fun_nested_ast (fun_nested_tokens |> parse)

let test_parse_hard ctxt =
  assert_equal app_ast (app_tokens |> parse);
  assert_equal app_reduce_ast (app_reduce_tokens |> parse);
  assert_equal app_high_order_ast (app_high_order_tokens |> parse)

let test_soo _ = 
  let rec aux x = aux x in
  assert_equal 1 (aux 1)

let suite =
  "public" >::: [
    "lex_easy" >: OUnitTest.TestCase (OUnitTest.Short, test_lex_easy);
    "lex_hard" >: OUnitTest.TestCase (OUnitTest.Short, test_lex_hard);
    "parse_easy" >: OUnitTest.TestCase (OUnitTest.Short, test_parse_easy);
    "parse_hard" >: OUnitTest.TestCase (OUnitTest.Short, test_parse_hard);
  ]

let _ = run_test_tt_main suite
