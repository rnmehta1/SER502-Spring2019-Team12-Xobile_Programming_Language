
/* Generate parse tree for the DCG defined */


%:-use_rendering(svgtree).

/* The program takes an input list of tokens to generate a parse tree */

program(parse_tree(X)) --> rend_block(X).

/* The parse tree begins by executing a set of statements in a block. [.]
is mentioned as the the input program block ends with '.' */

rend_block(block(Y)) --> [begin], rend_command(Y), [end], [.].



/* checks the syntax of identifier expressions, if-then-else, while loops
and recursively calls cmd */

rend_command(command(X,Y))--> rend_declaration(X), [;], rend_command(Y).
rend_command(command(X))--> rend_declaration(X).

rend_command(command(X,Y)) --> next_command(X), [;], rend_command(Y).
rend_command(command(X)) --> next_command(X).
	
next_command(equate(X,Y)) --> identifier(X), [~], expr(Y).

next_command(println(X)) --> [println], ['('], printVal(X), [')'].

next_command(println(X, Y)) --> [println], printVal(X), [;], next_command(Y).

next_command(if_condition(X,Y)) --> [if], ['('], bool(X), [')'], [:], ['{'], rend_command(Y), ['}'].
next_command(if_else_condition(X,Y,Z)) --> [if], ['('], bool(X), [')'], [:], ['{'], rend_command(Y), ['}'], [else], ['{'], rend_command(Z), ['}'].
next_command(if_elif_condition(V,W,X,Y,Z)) --> [if], ['('], bool(V), [')'], [:], ['{'], rend_command(W), ['}'], [elif], ['('], bool(X), [')'],[:], ['{'],rend_command(Y), ['}'], [else], ['{'], rend_command(Z), ['}'].

next_command(while_condition(X,Y)) --> [while], ['('], bool(X), [')'], [:], ['{'], rend_command(Y), ['}'].

next_command(while_condition(X, Y, Z)) --> [while], ['('], bool(X), [')'], [:],['{'], rend_command(Y), ['}'], [else], ['{'], rend_command(Z), ['}'].

next_command(X) --> rend_block(X).

printVal('"', _X, '"').
printVal(_X).


/* Checks for constants, identifiers and variables and recursively calls ren */

% rend_declaration(declaration(X,Y)) --> next_declaration(X), [;], rend_declaration(Y).
rend_declaration(declaration(X)) --> next_declaration(X), [;].

next_declaration(const(X, Y)) --> dataType(X), identifier(X), [=], number(Y).
next_declaration(var(X, Y)) --> dataType(X), identifier(Y).

dataType(dataType(int)) --> [int].
dataType(dataType(float)) --> [float].
dataType(dataType(boolean)) --> [boolean].
dataType(dataType(string)) --> [string].


/* evaluates the boolean values- true, false, equalto and not equal to */

bool(boolean(true)) --> [true].
bool(boolean(false)) --> [false].
bool(boolean_Expr(X,Y)) --> expr(X), [=], expr(Y).
% bool(boolean_Expr(X,Y)) --> expr(X), [!], expr(Y), fail.
bool(booleanl_NotExpr(X)) --> [not], bool(X).

/* syntax for expressions that add, subtract, multiply and divide two terms
with precedence rules incorporated */

expr(add_expr(X,Y)) --> termT(X), [+], expr(Y).
expr(sub_expr(X,Y)) --> termT(X), [-], expr(Y).
expr(expression(X)) --> termT(X).

termT(term_expression(X,Y)) --> termF(X), [*], termT(Y).
termT(term_expression(X,Y)) --> termF(X), [/], termT(Y).
termT(term_expression(X)) --> termF(X).

/* the expression can also take an identifier or a number */

termF(X) --> number(X).
termF(X) --> identifier(X).


/* identifier and digit values that the parse tree takes,
they are mentioned before the program predicate as these are facts
that are already known to us */

identifier(identifier(x)) --> [x].
identifier(identifier(y)) --> [y].
identifier(identifier(z)) --> [z].
identifier(identifier(u)) --> [u].
identifier(identifier(v)) --> [v].

number(number(0)) --> [0].
number(number(1)) --> [1].
number(number(2)) --> [2].
number(number(3)) --> [3].
number(number(4)) --> [4].
number(number(5)) --> [5].
number(number(6)) --> [6].
number(number(7)) --> [7].
number(number(8)) --> [8].
number(number(9)) --> [9].
