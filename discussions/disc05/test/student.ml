open OUnit2
open Disc.Disc05

let test_student_sanity ctxt =
  assert_equal 1 1

let suite =
  "student" >::: [
    "sanity" >:: test_student_sanity
  ]

let _ = run_test_tt_main suite
