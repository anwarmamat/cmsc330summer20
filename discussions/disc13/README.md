# Discussion 11: μOCaml Compiler

Due: Thursday July 14th at 11:59:59PM

Points: 50P/50R/0S

## Introduction

Last week we implemented NanOCaml. Today we learned that NanOCaml is really
just the CBV lambda-calculus. That means NanOCaml is Turing complete, so we can
compute really anything in it. Let's not just talk to the talk, let's see
how we can do some actually useful computation.

A compiler translates high-level code into a lower-level representation.
For example, `gcc` will convert C code into native machine code. We're
going to write a compiler that converts higher-level μOCaml to lower-level
NanOCaml. In other words, the μOCaml language is just syntactic sugar
over NanOCaml. The compiler de-sugars the language so it can be run.

We've provided a lexer and parser for μOCaml. They will produce values
of type `uexpr`.

```ml
type uexpr =
  | UFun of string list * uexpr
  | UApp of uexpr * uexpr
  | UVar of string
  | UBool of bool
  | UNat of int
  | UEq of uexpr * uexpr
  | UPlus of uexpr * uexpr
  | USub of uexpr * uexpr
  | ULetFun of string * string list * uexpr * uexpr
  | ULetRec of string * string list * uexpr * uexpr
  | ULet of string * uexpr * uexpr
  | UIf of uexpr * uexpr * uexp
```

Instead of providing a grammar, here are a few examples. You should get
the gist.

```ml
let x = 100 in let y = 200 in 100 + 200
```

These are normal let bindings that should yield `300`.

```ml
let rec mult m n = if m = 0 then 0 else n + (mult (m - 1) n) in mult 5 5
```

Here we're defining a recursive multiplication function. In this example
we're computing `5 * 5` so the result is `25`.

## The compiler

Your compiler will convert μOCaml terms of the type `uexpr` to NanOCaml
terms of the type `expr`. We've started the work, but you have to finish it.
You will use the usual Church encoding of numerals and booleans.

## The REPL

You can write programs in μOCaml and they will be compiled into NanOCaml
(using your compiler) and run through our NanOCaml evaluator. Provided is an
interface to the language that you can run with `dune exec bin/repl.bc`.
This will yield both the compiled NanOCaml term you generate as well as
the evaluated result.

Once you're done, try the examples above. You should get exactly the same
thing OCaml would give!
