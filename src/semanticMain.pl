%:-use_rendering(svgtree).
:-use_module(library(clpfd)).

lookup(Var, [[_Type, Var, Val]| _], Val).
lookup(Var, [_ | T], Val):- lookup(Var, T, Val).

update(Var, [[Type, Var, _OldVal] | T], Val, [[Type, Var, Val] | T]).
update(Var, [H | T], Val, [H | Env]):-
    update(Var, T, Val, Env).

add_Env([Type, Var, Val], Env, Result):-
    Temp = [[Type, Var, Val]],
    append(Env, Temp, Result).

eval_program(start(X), Op):-
    eval_block(X, [], Op),
    lookup(_Z, Op, _New),write(Op).

eval_block(block(), _Env, _OpEnv):-
    write('empty Program').
eval_block(block(X), Env, OpEnv):-
    eval_dec(X, NewOp),
    append(Env, NewOp, OpEnv).
eval_block(block(X), Env, OpEnv):-
    eval_command(X,Env,Env1),
    append(Env, Env1, OpEnv).
eval_block(block(X,Y), Env, OpEnv):-
    eval_dec(X, NewOp),
    append(Env, NewOp, Temp),
    eval_command(Y, Temp, OpEnv).

eval_dec(declaration(X), OpEnv):-
    eval_next_dec(X, NewOp),
    OpEnv = NewOp.
eval_dec(declaration(X, Y), OpEnv):-
    eval_next_dec(X, NewOp1),
    eval_dec(Y, NewOp2),
    append(NewOp1, NewOp2, OpEnv).

eval_next_dec(boolean(X), Env):-
    L = [],
    add_Env([boolean, X, nil], L, Env).
eval_next_dec(integer(X), Env):-
    L = [],
    add_Env([int, X, nil], L, Env).

eval_command(command(X), Env, OpEnv):-
    eval_next_cmd(X, Env, OpEnv).
eval_command(command(X,Y), Env, OpEnv):-
    eval_next_cmd(X, Env, Temp),
    eval_command(Y, Temp, OpEnv).

eval_next_cmd(assign(I,V), Env, OpEnv) :-
    is_identifier(I),
    eval_expr(V,Env,Val),
    update(I, Env, Val, OpEnv).

eval_expr(add_expr(A,B), Env, Val):-
    eval_nextExpression(A,Env,Val1),
    eval_expr(B,Env,Val2),
    Val is Val1 + Val2.

/*eval_expr(add_expr(A,B),Env, Val):-
    eval_nextExpression(new_term(A),Env,Val1),
    write(Val1),
    eval_expr(just_term(B),Env, Val2),
    Val is Val1 + Val2.*/

eval_expr(sub_expr(A,B),Env, Val):-
    eval_nextExpression(A,Env,Val1),
    eval_expr(B,Env, Val2),
    Val is Val1 - Val2.

eval_expr(just_term(V),Env, Val):-
    eval_nextExpression(V,Env, Val).


eval_nextExpression(new_term(T),Env, Val) :-
    eval_Term(T,Env,Val).

eval_Term(new_term_val(F),Env,Val) :-
    eval_digit(F,Val),!.
eval_Term(new_term_val(F),Env,Val) :-
    is_identifier(F),
    lookup(F,Env,Val),!.

eval_digit(num(N), Val):-
    is_digit(N), Val = N.

eval_digit(num(N,Y), Val):-
    New #= N * Place * 10,
    check(Y, Place,Newnew),
    Val is New + Newnew.

check(num(Y),Place, Newnew):-
    Place = 1,
    Newnew is Y * Place.

check(num(N,Y), Temp, Val):-
    New #= N * Place * 10,
    Temp #= Place * 10,
    check(Y, Place, Newnew),
    Val is New + Newnew.

is_identifier(u).
is_identifier(v).
is_identifier(w).
is_identifier(x).
is_identifier(y).
is_identifier(z).
is_digit(0).
is_digit(1).
is_digit(2).
is_digit(3).
is_digit(4).
is_digit(5).
is_digit(6).
is_digit(7).
is_digit(8).
is_digit(9).


/*Work in Progress*/


/*
eval_next_cmd(print(X)) --> [print], element(X), [;].
eval_next_cmd(if(X, Y, Z)) --> [if], eval_bool_expr(X), ['{'], eval_cmd(Y), ['}'], [else], ['{'], eval_cmd(Z), ['}'].
eval_next_cmd(while(X, Y)) --> [while], eval_bool_expr(X), ['{'], eval_cmd(Y), ['}'].
eval_next_cmd(new_block(X)) --> rend_block(X).

element(printExpr(X)) --> Z is eval_expr(X), write(Z).
element(printExpr(X)) --> Z is eval_bool_expr(X), write(Z).

eval_bool_expr(truebool(true)) --> [true].
eval_bool_expr(truebool(false)) --> [false].
eval_bool_expr(bool_exp(X, Y)) --> eval_expr(X), [~], eval_expr(Y).
eval_bool_expr(bool_not(X)) --> [not], eval_bool_expr(X).
eval_bool_expr(bool_not(X)) --> [!], eval_bool_expr(X).

eval_expr(add_expr(X, Y)) --> eval_term(X), [+], eval_expr(Y).
eval_expr(sub_expr(X, Y)) --> eval_term(X), [-], eval_expr(Y).
eval_expr(X) --> eval_term(X).

eval_term(eval_term(X, Y)) --> ['('], eval_expr(X), [')'], eval_term(Y).
eval_term(mul_term(X, Y)) --> eval_new_term(X), [*], eval_term(Y).
eval_term(div_term(X, Y)) --> number(X), [/], eval_term(Y).
eval_term(num(X)) --> eval_new_term(X).

eval_new_term(new_term_val(X)) --> identifier(X); number(X).

identifier(u) --> [u].
identifier(v) --> [v].
identifier(x) --> [x].
identifier(y) --> [y].
identifier(z) --> [z].



% number(num(X, Y)) --> digit(X), number(Y).
% number(num()) --> []
number(num(X, Y)) --> digit(X),number(Y).
number(num(X)) --> digit(X).

digit(0) --> [0].
digit(1) --> [1].
digit(2) --> [2].
digit(3) --> [3].
digit(4) --> [4].
digit(5) --> [5].
digit(6) --> [6].
digit(7) --> [7].
digit(8) --> [8].
digit(9) --> [9].


% L = [begin, boolean, x, ';', int, y, ';', int, z, ;, z, =, 0, ';', if, x, ~, x, '{', print, x, ';', '}', else, '{', z, '=', 5, ';', x, =, y, +, 2, ';', '}', while, not, x, ~, z, '{', z, =, z, +, 2, ';', print, x,~,x,';', '}', end,'.'], program(G, L, []).
*/
