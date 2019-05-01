%:-use_rendering(svgtree).

program(start(X)) --> rend_block(X).

rend_block(block(X, Y)) --> [begin], rend_declaration(X), rend_command(Y), [end], [.].
rend_block(block(X)) --> [begin], rend_declaration(X), [end], [.].
rend_block(block(X)) --> [begin], rend_command(X), [end], [.].
rend_block(block()) --> [begin], [end], [.].


rend_declaration(declaration(X, Y)) --> next_declaration(X), rend_declaration(Y).
rend_declaration(declaration(X)) --> next_declaration(X).

next_declaration(boolean(X)) --> [boolean], identifier(X), [;].
next_declaration(integer(X)) --> [int], identifier(X), [;].


rend_command(command(X,Y)) --> next_command(X), rend_command(Y).
rend_command(command(X)) --> next_command(X).

next_command(assign(X, Y)) --> identifier(X), [=], expression(Y), [;].
next_command(assign(X, Y)) --> identifier(X), [=], bool_expr(Y), [;].
next_command(print(X)) --> [print], element(X), [;].
next_command(if(X, Y, Z)) --> [if], bool_expr(X), ['{'], rend_command(Y), ['}'], [else], ['{'], rend_command(Z), ['}'].
next_command(while(X, Y)) --> [while], bool_expr(X), ['{'], rend_command(Y), ['}'].
next_command(new_block(X)) --> rend_block(X).

element(printExpr(X)) --> expression(X) ; bool_expr(X).
element(printString(X)) --> ['"'], [X],['"'].

bool_expr(bool_expr(X, Y)) --> bool_term(X), [~], bool_expr(Y).
bool_expr(bool_greater_expr(X, Y)) --> term(X), [>], term(Y).
bool_expr(bool_less_expr(X, Y)) --> term(X), [<], term(Y).

bool_expr(not_bool(X)) --> [not], bool_expr(X); [!], bool_expr(X).
bool_expr(just_bool(X)) --> bool_term(X).

bool_term(bool_true(true)) --> [true].
bool_term(bool_false(false)) --> [false].
bool_term(bool_expr_single(X)) --> ['('], bool_expr(X), [')'].
bool_term(bool_expr_multi(X, Y)) --> ['('], bool_expr(X), [')'], [~], bool_term(Y).
bool_term(new_term(X)) --> new_term(X).

expression(add_expr(X, Y)) --> term(X), [+], expression(Y).
expression(sub_expr(X, Y)) --> term(X), [-], expression(Y).
expression(just_term(X)) --> term(X).

term(term(X, Y)) --> ['('], expression(X), [')'], term(Y).
term(mul_term(X, Y)) --> new_term(X), [*], term(Y).
term(div_term(X, Y)) --> new_term(X), [/], term(Y).
term(new_term(X)) --> new_term(X).

new_term(new_term_val(X)) --> identifier(X); number(X).

identifier(a) --> [a].
identifier(b) --> [b].
identifier(c) --> [c].
identifier(d) --> [d].
identifier(e) --> [e].
identifier(f) --> [f].
identifier(g) --> [g].
identifier(h) --> [h].
identifier(i) --> [i].
identifier(j) --> [j].
identifier(k) --> [k].
identifier(l) --> [l].
identifier(m) --> [m].
identifier(n) --> [n].
identifier(o) --> [o].
identifier(p) --> [p].
identifier(q) --> [q].
identifier(r) --> [r].
identifier(s) --> [s].
identifier(t) --> [t].
identifier(u) --> [u].
identifier(v) --> [v].
identifier(w) --> [w].
identifier(x) --> [x].
identifier(y) --> [y].
identifier(z) --> [z].



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
