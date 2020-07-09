open OUnit2
open Disc.Parser
open D11.Evaler

(* ASTs *)

let fun_zoo_ast = Fun ("zoo", Var "zoo")
let fun_nested_ast = Fun ("x", Fun ("zoo", Var "x"))
let app_id_ast = App (Fun ("x", Var "x"), Fun ("x", Var "x"))
let app_id_y_ast = App (Fun ("x", Var "x"), Fun ("y", Var "y"))
let app_under_ast = App (Fun ("x", Fun ("x", Var "x")), Fun ("y", Var "y"))
let app_dbl_ast = App (Fun ("x", App (Var "x", Var "x")),
                       Fun ("y", Var "y"))

(* Values *)

let fun_zoo_val = Fun ("zoo", Var "zoo")
let fun_nested_val = Fun ("x", Fun ("zoo", Var "x"))
let app_id_val = Fun ("x", Var "x")
let app_id_y_val = Fun ("y", Var "y")
let app_under_val = Fun ("x", Var "x")
let app_dbl_val = Fun ("y", Var "y")

(* Tests *)

let test_eval_1 ctxt =
  assert_equal ~msg:"fun_zoo" fun_zoo_val (fun_zoo_ast |> eval);
  assert_equal ~msg:"fun_nested" fun_nested_val (fun_nested_ast |> eval);
  assert_equal ~msg:"app_id" app_id_val (app_id_ast |> eval);
  assert_equal ~msg:"app_id_y" app_id_y_val (app_id_y_ast |> eval)

let test_eval_2 ctxt =
  assert_equal ~msg:"app_under" app_under_val (app_under_ast |> eval);
  assert_equal ~msg:"app_dbl" app_dbl_val (app_dbl_ast |> eval)


let suite =
  "public" >::: [
    "eval_1" >:: test_eval_1;
    "eval_2" >:: test_eval_2;
  ]

let _ = run_test_tt_main suite
