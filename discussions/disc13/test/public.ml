open OUnit2
open Disc
open Ast
open Compiler

(* MicrOCaml *)

let cond_true = "if true then 0 else 1"
let cond_false = "if false then 0 else 1"
let eq_true = "if 1 = 1 then 0 else 1"
let eq_false = "if 1 = 2 then 0 else 1"
let add = "1 + 1"
let sub = "1 - 1"
let plain_let =
  "let x = 100 in let y = 200 in 100 + 200"
let mult_5_times_5 =
  "let rec mult n m = if m = 0 then 0 else n + (mult (m - 1) n) in mult 5 5"

(* Values *)

let cond_true_val = "0"
let cond_false_val = "1"
let eq_true_val = "0"
let eq_false_val = "1"
let add_val = "2"
let sub_val = "0"
let plain_let_val = "300"
let mult_5_times_5_val = "25"

(* Utility *)

let interpret eval x =
  let lexbuf = Lexing.from_string x in
  (Parser.main Lexer.read lexbuf) |> compile |> eval |> string_of_normal

let assert_compiled msg x y =
  assert_equal ~printer:(fun x -> x) ~msg:msg (x |> interpret normalize) y

(* Tests *)

let test_easy ctxt =
  assert_compiled "cond_true" cond_true cond_true_val;
  assert_compiled "cond_false" cond_false cond_false_val;
  assert_compiled "eq_true" eq_true eq_true_val;
  assert_compiled "eq_false" eq_false eq_false_val;
  assert_compiled "add" add add_val;
  assert_compiled "sub" sub sub_val

let test_hard ctxt =
  assert_compiled "plain_let" plain_let plain_let_val;
  assert_compiled "mult_5_times_5" mult_5_times_5 mult_5_times_5_val

let suite =
  "public" >::: [
    "easy" >:: test_easy;
    "hard" >:: test_hard
  ]

let _ = run_test_tt_main suite
