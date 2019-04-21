
/* Generate parse tree for the dcG defined */


:-use_rendering(svgtree).

/* the program takes an input list of tokens to generate a parse tree */

program(parse_tree(X)) --> k(X).

/* the parse tree begins by executing a set of statements in a block. [.]
is mentioned as the the input program block ends with '.' */

k(block(Y)) --> [begin], cl(Y), [end], [.].



/* checks the syntax of identifier expressions, if-then-else, while loops
and recursively calls cmd */

cl(command(X,Y))--> fd(X), cl(Y).
cl(command(X,Y))--> c(X), cl(Y).
%cl(command(ε)) --> ε.


fd(def(X,Y,Z)) --> [define], name(X), ['('], param(Y), [')'], [':'], ['{'], c(Z) ['}'].
name(name(X)) --> i(X).

c(cond(X,Y)) --> d(X), c(Y), [';'].
c(if_cond(X,Y,Z)) --> [if], b(X), ['{'], c(Y), ['}'],  c(Z).
c(else_cond(W,X,Y,Z)) --> [if], b(W), ['{'], c(X), ['}'], [else], ['{'], c(Y), ['}'], c(Z).
c(elif_cond(U,V,W,X,Y,Z)) --> [if], b(U), ['{'], c(V), ['}'], [elif], ['{'], c(W), ['}'], elif(X), [else], ['{'], c(Y), ['}'], c(Z).
c(while_cond(X,Y,Z)) --> [while], b(X), ['{'], c(Y), ['}'], c(Z).
c(while_else_cond(W,X,Y,Z)) --> [while], b(W), ['{'], c(X), ['}'], [else], ['{'], c(Y), ['}'], c(Z).
c(stop_cond(stop)) --> [stop].
c(return_cond(return)) --> [return].
c(fc_cond(X,Y)) --> fc(X), c(Y).
%c(end_cond(ε)) --> ε.


d(bool(X)) --> [boolean], i(X), ['='], b1(Y), [';'].
d(data_equate(X,Y,Z)) --> dt(X), i(Y), ['='], e(Z), [';'].
d(date_init(X,Y)) --> dt(X), i(Y), [';'].
d(equate(X,Y)) --> i(X), ['='], e(Y), [';'].

dt(datatype(int)) --> [int].
dt(datatype(float)) --> [float].
dt(datatype(string)) --> [string]. 
dt(datatype(boolean)) -->[boolean].
b1(bool(true)) --> [true].
b1(bool(false)) --> [false].

elif(else_if(X,Y)) --> [elif], ['{'], c(X), ['}'], elif(Y).
%elif(stop(ε)) --> ε.

fc(name_param(X,Y)) --> name(X), ['('], param(Y), [')'].
param(param(X,Y)) --> i(X), [','], param(Y).
param(id(X)) --> i(X).
%param(stop(ε)) --> ε.

b(boolean(true)) --> [true].
b(boolean(false)) --> [false].
b(expr_equate(X,Y)) --> e(X), ['~'], e(Y).
b(not(X)) --> [not], b(X).
b(not(X)) --> ['!'], b(X).
b(zero(X)) --> ['0'].
b(one(X)) --> ['1'].

e(expr_add(X,Y)) --> t(X), ['+'], e(Y).
e(expr_sub(X,Y)) --> t(X), ['-'], e(Y).
e(term(X)) --> t(X).

t(term_expression(X,Y)) --> ['('], e(X), [')'], t(Y).
t(term_mult(X,Y)) --> nt(X), ['*'], t(Y).
t(term_div(X,Y)) --> nt(X), ['/'], t(Y).
t(terminal(X)) --> nt(X).

nt(terminal_id(X)) --> i(X).
nt(terminal_num(X)) --> n(X).

i(X) --> [X].

n(num(X,Y)) --> d(X), [','], n(Y).
%n(num(ε)) --> ε.

d(digit(0)) --> ['0'].
d(digit(1)) --> ['1'].
d(digit(2)) --> ['2'].
d(digit(3)) --> ['3'].
d(digit(4)) --> ['4'].
d(digit(5)) --> ['5'].
d(digit(6)) --> ['6'].
d(digit(7)) --> ['7'].
d(digit(8)) --> ['8'].
d(digit(9)) --> ['9'].









