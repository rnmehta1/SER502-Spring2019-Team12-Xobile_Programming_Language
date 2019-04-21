
/* Generate parse tree for the DCG defined */


:-use_rendering(svgtree).

/* The program takes an input list of tokens to generate a parse tree */

program(parse_tree(X)) --> K(X).

/* The parse tree begins by executing a set of statements in a block. [.]
is mentioned as the the input program block ends with '.' */

K(block(Y)) --> [begin], CL(Y), [end], [.].



/* checks the syntax of identifier expressions, if-then-else, while loops
and recursively calls cmd */

CL(command(X,Y))--> Fd(X), CL(Y).
CL(command(X,Y))--> C(X), CL(Y).
CL(command(ε)) --> ε.


Fd(def(X,Y,Z)) --> [define], Name(X), ['('], Param(Y), [')'], [':'], ['{'], C(Z) ['}'].
Name(name(X)) --> I(X).

C(cond(X,Y)) --> D(X), C(Y), [';'].
C(if_cond(X,Y,Z)) --> [if], B(X), ['{'], C(Y), ['}'],  C(Z).
C(else_cond(W,X,Y,Z)) --> [if], B(W), ['{'], C(X), ['}'], [else], ['{'], C(Y), ['}'], C(Z).
C(elif_cond(U,V,W,X,Y,Z)) --> [if], B(U), ['{'], C(V), ['}'], [elif], ['{'], C(W), ['}'], Elif(X), [else], ['{'], C(Y), ['}'], C(Z).
C(while_cond(X,Y,Z)) --> [while], B(X), ['{'], C(Y), ['}'], C(Z).
C(while_else_cond(W,X,Y,Z)) --> [while], B(W), ['{'], C(X), ['}'], [else], ['{'], C(Y), ['}'], C(Z).
C(stop_cond(stop)) --> [stop].
C(return_cond(return)) --> [return].
C(fc_cond(X,Y)) --> Fc(X), C(Y).
C(end_cond(ε)) --> ε.


D(bool(X)) --> [boolean], I(X), ['='], B1(Y), [';'].
D(data_equate(X,Y,Z)) --> Dt(X), I(Y), ['='], E(Z), [';'].
D(date_init(X,Y)) --> Dt(X), I(Y), [';'].
D(equate(X,Y)) --> I(X), ['='], E(Y), [';'].

Dt(datatype(int)) --> [int].
Dt(datatype(float)) --> [float].
Dt(datatype(string)) --> [string]. 
Dt(datatype(boolean)) -->[boolean].
Bl(bool(true)) --> [true].
Bl(bool(false)) --> [false].

Elif(else_if(X,Y)) --> [elif], ['{'], C(X), ['}'], Elif(Y).
Elif(stop(ε)) --> ε.

Fc(name_param(X,Y)) --> Name(X), ['('], Param(Y), [')'].
Param(param(X,Y)) --> I(X), [','], Param(Y).
Param(id(X)) --> I(X).
Param(stop(ε)) --> ε.

B(boolean(true)) --> [true].
B(boolean(false)) --> [false].
B(expr_equate(X,Y)) --> E(X), ['~'], E(Y).
B(not(X)) --> [not], B(X).
B(not(X)) --> ['!'], B(X).
B(zero(X)) --> ['0'].
B(one(X)) --> ['1'].

E(expr_add(X,Y)) --> T(X), ['+'], E(Y).
E(expr_sub(X,Y)) --> T(X), ['-'], E(Y).
E(term(X)) --> T(X).

T(term_expression(X,Y)) --> ['('], E(X), [')'], T(Y).
T(term_mult(X,Y)) --> Nt(X), ['*'], T(Y).
T(term_div(X,Y)) --> Nt(X), ['/'], T(Y).
T(terminal(X)) --> Nt(X).

Nt(terminal_id(X)) --> I(X).
Nt(terminal_num(X)) --> N(X).

I(X) --> [X].

N(num(X,Y)) --> D(X), [','], N(Y).
N(num(ε)) --> ε.

D(digit(0)) --> ['0'].
D(digit(1)) --> ['1'].
D(digit(2)) --> ['2'].
D(digit(3)) --> ['3'].
D(digit(4)) --> ['4'].
D(digit(5)) --> ['5'].
D(digit(6)) --> ['6'].
D(digit(7)) --> ['7'].
D(digit(8)) --> ['8'].
D(digit(9)) --> ['9'].









