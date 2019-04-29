%:-use_rendering(svgtree).
:-use_module(library(clpfd)).

lookup(Var, [[_Type, Var, Val]| _], Val).
lookup(Var, [_ | T], Val):- lookup(Var, T, Val).

update(Var, [[Type, Var, _OldVal] | T], Val, [[Type, Var, Val] | T]).
update(Var, [H | T], Val, [H | Env]):- update(Var, T, Val, Env).

add_Env([Type, Var, Val], Env, Result):- Temp = [[Type, Var, Val]], append(Env, Temp, Result).

eval_program(start(X), Op):- eval_block(X, [], Op), lookup(_Z,Op,_New).

eval_block(block(), _Env, _OpEnv):- write('empty Program').
eval_block(block(X), Env, OpEnv):- eval_dec(X, NewOp), append(Env, NewOp, OpEnv).
eval_block(block(X), Env, OpEnv):- eval_command(X,Env,Env1), append(Env, Env1, OpEnv).
eval_block(block(X,Y), Env, OpEnv):- eval_dec(X, NewOp), append(Env, NewOp, Temp), eval_command(Y, Temp, OpEnv).

eval_dec(declaration(X), OpEnv):- eval_next_dec(X, OpEnv).
eval_dec(declaration(X, Y), OpEnv):- eval_next_dec(X, NewOp1), eval_dec(Y, NewOp2), append(NewOp1, NewOp2, OpEnv).

eval_next_dec(boolean(X), Env):- L = [], add_Env([boolean, X, nil], L, Env).
eval_next_dec(integer(X), Env):- L = [], add_Env([int, X, nil], L, Env).

eval_command(command(X), Env, OpEnv):- eval_next_cmd(X, Env, OpEnv).
eval_command(command(X, Y), Env, OpEnv):- eval_next_cmd(X, Env, Temp), eval_command(Y, Temp, OpEnv).

eval_next_cmd(assign(I, V), Env, OpEnv) :- is_identifier(I), eval_expr(V, Env, Val), update(I, Env, Val, OpEnv).
eval_next_cmd(assign(I, V), Env, OpEnv) :- is_identifier(I), eval_bool_expr(V, R, Env, OpEnv), update(I, Env, R, OpEnv).

eval_next_cmd(print(X), Env, OpEnv) :- eval_print(X, Env,Val), update(I, Env, Val, OpEnv).

eval_print(printExpr(X), Env, Val):- eval_expr(X, Env,Val),write(Val).
eval_print(printExpr(X), Env, Val):- eval_print_expr(X, Env,Val).
eval_print_expr(just_term(X), Env, Val):- eval_new_expr(X, Env, Val),write(Val).

eval_next_cmd(if(X,Y,Z), Env, OpEnv):- eval_bool_expr(X, Result, Env, OpEnv), evaluate_if(Result, Y, Z, Env, OpEnv).

evaluate_if(true,Y,_Z,Env, OpEnv):- eval_command(Y, Env, OpEnv).
evaluate_if(false, _Y, Z, Env, OpEnv):- eval_command(Z, Env, OpEnv).

eval_bool_expr(bool_expr(X,Y),true,Env,OpEnv):- eval_bool_term(X, R1, Env, OpEnv), eval_bool_expr(Y, R2, Env, OpEnv), R1 = R2.
eval_bool_expr(bool_expr(X,Y),false,Env,OpEnv):- eval_bool_term(X, R1, Env, OpEnv), eval_bool_expr(Y, R2, Env, OpEnv), \+(R1 = R2).

eval_bool_expr(just_bool(X), R, Env, OpEnv):- eval_bool_term(X, R, Env, OpEnv).
eval_bool_expr(not_bool(X), false, Env, OpEnv):- eval_bool_expr(X, Temp, Env, OpEnv), Temp = true.
eval_bool_expr(not_bool(X), true, Env, OpEnv):- eval_bool_expr(X, Temp, Env, OpEnv), Temp = false.

eval_bool_term(new_term(X), R, Env, OpEnv):- eval_Term(X, Env, R).
eval_bool_term(bool_true(true), true, _Env, _OpEnv).
eval_bool_term(bool_false(false), false, _Env, _OpEnv).

/*
eval_next_cmd(while(X,Y), Env, OpEnv):- eval_bool_expr(X, false, Env,OpEnv).
eval_next_cmd(while(X,Y), Env, OpEnv):- write(Env), eval_bool_expr(X, true, Env,OpEnv), eval_command(Y,Env,OpEnv), eval_next_cmd(while(X,Y), Env, OpEnv).

eval_next_cmd(print(X), Env, _OpEnv) :- eval_print(X, Env).

eval_print(printExpr(X), Env):- eval_print_expr(X, Env).
eval_print_expr(just_term(X), Env):- eval_new_expr(X, Env, Val),write(Val).
*/

eval_expr(add_expr(A,B), Env, Val):- eval_new_expr(A,Env,Val1), eval_expr(B,Env,Val2), Val is Val1 + Val2.
eval_expr(sub_expr(A,B),Env, Val):- eval_new_expr(A,Env,Val1), eval_expr(B,Env, Val2), Val is Val1 - Val2.
eval_expr(just_term(V),Env, Val):- eval_new_expr(V,Env, Val).

eval_new_expr(new_term(T),Env, Val):- eval_Term(T,Env,Val).
eval_new_expr(mul_term(A,B),Env, Val):- eval_Term(A,Env,Val1), eval_new_expr(B,Env, Val2), Val is Val1 * Val2.
eval_new_expr(div_term(A,B),Env, Val):- eval_Term(A,Env,Val1), eval_new_expr(B,Env, Val2), Val is Val1 / Val2.

eval_Term(new_term_val(F), Env, Val) :- eval_digit(F, Val).
eval_Term(new_term_val(F), Env, Val) :- is_identifier(F), lookup(F,Env,Val).

eval_digit(num(N), Val):- is_digit(N), Val = N.
eval_digit(num(N,Y), Val):- New #= N * Place * 10, check(Y, Place,Newnew), Val is New + Newnew.

check(num(Y),Place, Newnew):- Place = 1, Newnew is Y * Place.
check(num(N,Y), Temp, Val):- New #= N * Place * 10, Temp #= Place * 10, check(Y, Place, Newnew), Val is New + Newnew.

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



