open OUnit2
open Disc.Disc07

let test_map _ =
  assert_equal (Cons (1, 1, Cons (2, 2, Cons (3, 3, Empty)))) @@
  map (fun x -> x) (Cons (1, 1, Cons (2, 2, Cons (3, 3, Empty))))

(* Public Tests *)
let public_map_i _ =
  let lst = (Cons (1, 1, Cons (2, 2, Cons (3, 3, Empty)))) in
  assert_equal lst @@ map (fun x -> x) lst

let public_map _ =
  assert_equal (Cons (1, 1, Cons (2, 2, Cons (3, 3, Empty)))) @@
  map (fun x -> x) (Cons (1, 1, Cons (2, 2, Cons (3, 3, Empty))))

let public_foldl _ =
  let lelst = (Cons (1, 1, Cons (2, 2, Cons (3, 3, Empty)))) in
  assert_equal [3;3;3;2;2;1] @@
  foldl (fun acc x -> x :: acc) [] lelst

let public_foldr _ =
  let lelst = (Cons (1, 1, Cons (2, 2, Cons (3, 3, Empty)))) in
  assert_equal [1;2;2;3;3;3] @@
  foldr (fun x acc -> x :: acc) lelst []

let public_find _ =
  let t = fun _ -> true in
  let f = fun _ -> false in 
  let eq1 = (=) 1 in
  let even = fun x -> not @@ eq1 (x mod 2) in
  let xs =  Cons (1, 1, Cons (2, 1, Cons (4, 1, Empty))) in
  assert_equal None @@ find t Empty;
  assert_equal None @@ find f xs;
  assert_equal (Some 4) @@ find even xs;
  assert_equal (Some 1) @@ find eq1 xs


let public_contains _ =
  let xs = Cons (1, 1, Cons (2, 1, Cons (4, 1, Empty))) in
  assert_equal false @@ contains Empty 1;
  assert_equal false @@ contains xs 0;
  assert_equal true @@ contains xs 2


let suite =
  "public" >::: [
    "public_map" >:: public_map;
    "public_foldl" >:: public_foldl;
    "public_foldr" >:: public_foldr;
    "public_find" >:: public_find;
    "public_contains" >:: public_contains;
  ]

let _ = run_test_tt_main suite
