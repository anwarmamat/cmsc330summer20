open OUnit2
open Disc.Disc06

let test_sq_sum ctxt =
  assert_equal 0 @@ sq_sum [];
  assert_equal 1 @@ sq_sum [1];
  assert_equal 5 @@ sq_sum [1;2]

let test_append ctxt =
  assert_equal [] @@ append [] [];
  assert_equal [1; 2] @@ append [1; 2] [];
  assert_equal [1; 2] @@ append [] [1; 2];
  assert_equal [1; 2] @@ append [1] [2];
  assert_equal [1; 2; 3; 4] @@ append [1; 2] [3; 4]

let test_run_length ctxt =
  assert_equal [] @@ run_length [];
  assert_equal [(1, 1)] @@ run_length [1];
  assert_equal [(1, 4)] @@ run_length [1;1;1;1];
  assert_equal [(1, 2); (2, 2)] @@ run_length [1;1;2;2]

let test_filter ctxt =
  let t = fun x -> true in
  let f = fun x -> false in
  let even = fun x -> (x mod 2) = 0 in

  let xs = [1; 2; 3; 4] in
  assert_equal [] @@ block t [];
  assert_equal xs @@ block f xs;
  assert_equal [] @@ block t xs;
  assert_equal [1; 3] @@ block even xs

let test_composes ctxt =
  let add1 = ( + ) 1 in
  let dbl =  ( * ) 2 in

  let f0 = composes [] in
  let f1 = composes [add1] in
  let f2 = composes [add1; dbl] in
  let f3 = composes [dbl; add1] in

  assert_equal 0 @@ f0 0;
  assert_equal 1 @@ f1 0;
  assert_equal 5 @@ f2 2;
  assert_equal 6 @@ f3 2

let suite =
  "public" >::: [
    "sq_sum" >:: test_sq_sum;
    "append" >:: test_append;
    "run_length" >:: test_run_length;
    "filter" >:: test_filter;
    "composes" >:: test_composes
  ]

let _ = run_test_tt_main suite
