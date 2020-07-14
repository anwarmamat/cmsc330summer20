
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | Tok_Var of (
# 5 "parser.mly"
       (string)
# 11 "parser.ml"
  )
    | Tok_Then
    | Tok_Sub
    | Tok_Rec
    | Tok_RParen
    | Tok_Plus
    | Tok_Nat of (
# 6 "parser.mly"
       (int)
# 21 "parser.ml"
  )
    | Tok_Let
    | Tok_LParen
    | Tok_In
    | Tok_If
    | Tok_Fun
    | Tok_Eq
    | Tok_Else
    | Tok_EOF
    | Tok_Bool of (
# 7 "parser.mly"
       (bool)
# 34 "parser.ml"
  )
    | Tok_Arrow
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState46
  | MenhirState44
  | MenhirState41
  | MenhirState36
  | MenhirState34
  | MenhirState31
  | MenhirState29
  | MenhirState27
  | MenhirState24
  | MenhirState12
  | MenhirState9
  | MenhirState8
  | MenhirState7
  | MenhirState6
  | MenhirState4
  | MenhirState0

# 1 "parser.mly"
  
open Ast

# 77 "parser.ml"

let rec _menhir_run11 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.uexpr) -> (
# 5 "parser.mly"
       (string)
# 82 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (v : (
# 5 "parser.mly"
       (string)
# 90 "parser.ml"
    )) = _v in
    let (_menhir_stack, _menhir_s, (vs : (Ast.uexpr))) = _menhir_stack in
    let _v : (Ast.uexpr) = 
# 68 "parser.mly"
    ( match vs with
      | UParams vs -> UParams (v :: vs)
      | _ -> raise (Failure "vars did not give back parameters")
    )
# 99 "parser.ml"
     in
    _menhir_goto_vars _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _, (vs : (Ast.uexpr))), _, (e : (Ast.uexpr))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (Ast.uexpr) = 
# 108 "parser.mly"
    ( match vs with
      | UParams vs -> UFun (vs, e)
      | _ -> raise (Failure "vars did not give back parameters")
    )
# 119 "parser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (f : (Ast.uexpr)) = _v in
        let _v : (Ast.uexpr) = 
# 33 "parser.mly"
      ( f )
# 127 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Then ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState34
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState34 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Else ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState36
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState36
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState36
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((((_menhir_stack, _menhir_s), _, (g : (Ast.uexpr))), _, (t : (Ast.uexpr))), _, (f : (Ast.uexpr))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Ast.uexpr) = 
# 105 "parser.mly"
      ( UIf(g, t, f) )
# 208 "parser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (c : (Ast.uexpr)) = _v in
        let _v : (Ast.uexpr) = 
# 41 "parser.mly"
      ( c )
# 216 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_RParen ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.uexpr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.uexpr) = 
# 61 "parser.mly"
      ( e )
# 234 "parser.ml"
             in
            _menhir_goto_atom _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_In ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((((_menhir_stack, _menhir_s), (x : (
# 5 "parser.mly"
       (string)
# 283 "parser.ml"
        ))), _), _, (e1 : (Ast.uexpr))), _, (e2 : (Ast.uexpr))) = _menhir_stack in
        let _5 = () in
        let _3 = () in
        let _1 = () in
        let _v : (Ast.uexpr) = 
# 102 "parser.mly"
        ( ULet(x, e1, e2) )
# 291 "parser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (l : (Ast.uexpr)) = _v in
        let _v : (Ast.uexpr) = 
# 39 "parser.mly"
      ( l )
# 299 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_In ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((((_menhir_stack, _menhir_s), (x : (
# 5 "parser.mly"
       (string)
# 342 "parser.ml"
        ))), _, (vs : (Ast.uexpr))), _, (e1 : (Ast.uexpr))), _, (e2 : (Ast.uexpr))) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _1 = () in
        let _v : (Ast.uexpr) = 
# 96 "parser.mly"
    ( match vs with
      | UParams vs -> ULetFun(x, vs, e1, e2)
      | _ -> raise (Failure "vars did not give back parameters")
    )
# 353 "parser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (l : (Ast.uexpr)) = _v in
        let _v : (Ast.uexpr) = 
# 37 "parser.mly"
      ( l )
# 361 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_In ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((((_menhir_stack, _menhir_s), (x : (
# 5 "parser.mly"
       (string)
# 404 "parser.ml"
        ))), _, (vs : (Ast.uexpr))), _, (e1 : (Ast.uexpr))), _, (e2 : (Ast.uexpr))) = _menhir_stack in
        let _7 = () in
        let _5 = () in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.uexpr) = 
# 90 "parser.mly"
    ( match vs with
      | UParams vs -> ULetRec(x, vs, e1, e2)
      | _ -> raise (Failure "vars did not give back parameters")
    )
# 416 "parser.ml"
         in
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (l : (Ast.uexpr)) = _v in
        let _v : (Ast.uexpr) = 
# 35 "parser.mly"
      ( l )
# 424 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.uexpr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 25 "parser.mly"
       (Ast.uexpr)
# 440 "parser.ml"
            ) = 
# 29 "parser.mly"
      ( e )
# 444 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 25 "parser.mly"
       (Ast.uexpr)
# 451 "parser.ml"
            )) = _v in
            Obj.magic _1
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_vars : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Arrow ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
        | Tok_Var _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Eq ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState44
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44)
        | Tok_Var _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Eq ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
        | Tok_Var _v ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_app : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Bool _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | Tok_LParen ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | Tok_Nat _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | Tok_Var _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | Tok_EOF | Tok_Else | Tok_In | Tok_RParen | Tok_Then ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (a : (Ast.uexpr))) = _menhir_stack in
        let _v : (Ast.uexpr) = 
# 43 "parser.mly"
      ( a )
# 604 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31

and _menhir_run24 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Bool _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | Tok_LParen ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | Tok_Nat _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | Tok_Var _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

and _menhir_run27 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Bool _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | Tok_LParen ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | Tok_Nat _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | Tok_Var _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run29 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Bool _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | Tok_LParen ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | Tok_Nat _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | Tok_Var _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_goto_arith : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (a : (Ast.uexpr)) = _v in
    let _v : (Ast.uexpr) = 
# 57 "parser.mly"
      ( a )
# 674 "parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _menhir_s _v

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "parser.mly"
       (string)
# 681 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (v : (
# 5 "parser.mly"
       (string)
# 689 "parser.ml"
    )) = _v in
    let _v : (Ast.uexpr) = 
# 73 "parser.mly"
    ( UParams [v] )
# 694 "parser.ml"
     in
    _menhir_goto_vars _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_atom : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.uexpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState0 | MenhirState51 | MenhirState53 | MenhirState44 | MenhirState46 | MenhirState6 | MenhirState41 | MenhirState7 | MenhirState8 | MenhirState34 | MenhirState36 | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Eq ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Plus ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Sub ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Bool _ | Tok_EOF | Tok_Else | Tok_In | Tok_LParen | Tok_Nat _ | Tok_RParen | Tok_Then | Tok_Var _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (a : (Ast.uexpr))) = _menhir_stack in
            let _v : (Ast.uexpr) = 
# 49 "parser.mly"
     ( a )
# 719 "parser.ml"
             in
            _menhir_goto_app _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Ast.uexpr))), _, (y : (Ast.uexpr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.uexpr) = 
# 85 "parser.mly"
       ( USub(x, y) )
# 736 "parser.ml"
         in
        _menhir_goto_arith _menhir_env _menhir_stack _menhir_s _v
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (x : (Ast.uexpr))), _, (y : (Ast.uexpr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.uexpr) = 
# 83 "parser.mly"
       ( UPlus(x, y) )
# 747 "parser.ml"
         in
        _menhir_goto_arith _menhir_env _menhir_stack _menhir_s _v
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Plus ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Sub ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Bool _ | Tok_EOF | Tok_Else | Tok_Eq | Tok_In | Tok_LParen | Tok_Nat _ | Tok_RParen | Tok_Then | Tok_Var _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.uexpr))), _, (e2 : (Ast.uexpr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.uexpr) = 
# 79 "parser.mly"
      ( UEq(e1, e2) )
# 766 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (c : (Ast.uexpr)) = _v in
            let _v : (Ast.uexpr) = 
# 55 "parser.mly"
      ( c )
# 774 "parser.ml"
             in
            _menhir_goto_atom _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Eq ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Plus ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Sub ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack)
        | Tok_Bool _ | Tok_EOF | Tok_Else | Tok_In | Tok_LParen | Tok_Nat _ | Tok_RParen | Tok_Then | Tok_Var _ ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.uexpr))), _, (e2 : (Ast.uexpr))) = _menhir_stack in
            let _v : (Ast.uexpr) = 
# 47 "parser.mly"
     ( UApp(e1, e2) )
# 800 "parser.ml"
             in
            _menhir_goto_app _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 5 "parser.mly"
       (string)
# 894 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (v : (
# 5 "parser.mly"
       (string)
# 902 "parser.ml"
    )) = _v in
    let _v : (Ast.uexpr) = 
# 64 "parser.mly"
     ( UVar v )
# 907 "parser.ml"
     in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (v : (Ast.uexpr)) = _v in
    let _v : (Ast.uexpr) = 
# 59 "parser.mly"
      ( v )
# 915 "parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _menhir_s _v

and _menhir_run2 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 6 "parser.mly"
       (int)
# 922 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 6 "parser.mly"
       (int)
# 930 "parser.ml"
    )) = _v in
    let _v : (Ast.uexpr) = 
# 87 "parser.mly"
       ( UNat x )
# 935 "parser.ml"
     in
    _menhir_goto_arith _menhir_env _menhir_stack _menhir_s _v

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Rec ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Var _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Var _v ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | Tok_Var _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | Tok_Eq ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState4 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | Tok_Bool _v ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | Tok_Fun ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | Tok_If ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | Tok_LParen ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | Tok_Let ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
            | Tok_Nat _v ->
                _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | Tok_Var _v ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
        | Tok_Var _v ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Bool _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | Tok_Fun ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | Tok_If ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | Tok_LParen ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | Tok_Let ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState7
    | Tok_Nat _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | Tok_Var _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Bool _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | Tok_Fun ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | Tok_If ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | Tok_LParen ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | Tok_Let ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
    | Tok_Nat _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | Tok_Var _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Var _v ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 7 "parser.mly"
       (bool)
# 1078 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (b : (
# 7 "parser.mly"
       (bool)
# 1086 "parser.ml"
    )) = _v in
    let _v : (Ast.uexpr) = 
# 76 "parser.mly"
      ( UBool b )
# 1091 "parser.ml"
     in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (b : (Ast.uexpr)) = _v in
    let _v : (Ast.uexpr) = 
# 53 "parser.mly"
      ( b )
# 1099 "parser.ml"
     in
    _menhir_goto_atom _menhir_env _menhir_stack _menhir_s _v

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and main : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 25 "parser.mly"
       (Ast.uexpr)
# 1118 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | Tok_Bool _v ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | Tok_Fun ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | Tok_If ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | Tok_LParen ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | Tok_Let ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | Tok_Nat _v ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | Tok_Var _v ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)


# 1154 "parser.ml"
