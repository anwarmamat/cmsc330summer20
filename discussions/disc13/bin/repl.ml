open Disc
open Ast
open Compiler

(* Interpreter *)

let interpret eval x =
  let lexbuf = Lexing.from_string x in
  (Parser.main Lexer.read lexbuf) |> compile |> eval |> string_of_normal

(* Main *)

let rec main () =
  output_string stdout "> ";
  flush stdout;
  let repl_in = (input_line stdin) in
  output_string stdout "[Compiled] ";
  repl_in |> (interpret (fun x -> x)) |> (output_string stdout);
  output_string stdout "\n";
  output_string stdout "[Evaluated] ";
  repl_in |> (interpret normalize) |> (output_string stdout);
  output_string stdout "\n";
  flush stdout;
  cntr := 0;
  main ()

let () = main ()
