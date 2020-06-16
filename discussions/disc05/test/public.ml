open OUnit2
open Disc.Disc05

let f x = (x > 0)
let g x = (x < 0)
let a x = x + 3
let b x = x * 5

let test_public_filter ctxt =
  assert_equal [1; 3; 5] (filter f [1; 3; (-1); 5; (-3)]);
  assert_equal [(-1); (-3)] (filter g [1; 3; (-1); 5; (-3)]);
  assert_equal [] (filter g (filter f [1; 3; (-1); 5; (-3)]));
  assert_equal [] (filter f []);
  assert_equal [1; 3; 4] (filter f [1; 3; 4]);
  assert_equal [] (filter g [1; 3; 4])

let test_public_set ctxt =
  assert_equal ["a"; "d"; "c"] (set 1 "d" ["a"; "b"; "c"]);
  assert_equal ["x"] (set 0 "x" ["y"]);
  assert_equal [1; 3; 3] (set 1 3 [1; 2; 3])

let test_public_pick ctxt =
  let mp = [(1, "c"); (2, "d"); (3, "a"); (4, "b")] in
  let is_1 = fun x -> x = 1 in 
  let is_2 = fun x -> x = 2 in 
  let is_3 = fun x -> x = 3 in 
  let is_4 = fun x -> x = 4 in 
  assert_equal "c" (pick is_1 mp);
  assert_equal "d" (pick is_2 mp);
  assert_equal "a" (pick is_3 mp);
  assert_equal "b" (pick is_4 mp)

let test_public_negate ctxt =
  assert_equal (filter f [1; 3; (-1); 5; (-3)]) (filter (negate g) [1; 3; (-1); 5; (-3)]);
  assert_equal (filter g [1; 3; (-1); 5; (-3)]) (filter (negate f) [1; 3; (-1); 5; (-3)])

let test_public_composes ctxt =
  assert_equal 18 ((composes [a; b]) 3);
  assert_equal 28 ((composes [a; b]) 5);
  assert_equal 318 ((composes [a; b; (composes [a;b])]) 12)

let suite =
  "public" >::: [
    "filter" >:: test_public_filter;
    "set" >:: test_public_set;
    "pick" >:: test_public_pick;
    "negate" >:: test_public_negate;
    "composes" >:: test_public_composes
  ]

let _ = run_test_tt_main suite
