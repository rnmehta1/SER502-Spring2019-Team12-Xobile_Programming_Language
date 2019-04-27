%:-use_rendering(svgtree).

lookup(Var, [(Var, Val)| _], Val).
lookup(Var, [_ | T], Val):- lookup(Var, T, Val).

update(Var, [(Var, _)|T], Val, [(Var, Val) | T]).
update(Var, [H | T], Val, [H | Env]):- update(Var, T, Val, Env).

eval_program(e_p(X),_Op):-
    eval_block(X, [], OpEnv).
    lookup(Z, Env, Op).

eval_block(e_b(X, Y), Env, Openv):- [begin], eval_dec(X), eval_cmd(Y), [end], [.].
eval_block(X, Env, Openv):- [begin], eval_dec(X), [end], [.].
eval_block(X, Env, Openv):- [begin], eval_cmd(X), [end], [.].

eval_dec(e_d(X, Y)) --> eval_next_dec(X), eval_dec(Y).
eval_dec(e_d(X)) --> eval_next_dec(X).

eval_next_dec(e_n_d(X)) --> [boolean], eval_ID(X), [;].
eval_next_dec(e_n_i(X)) --> [int], eval_ID(X), [;].
