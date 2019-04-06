
/* Generate parse tree for the DCG defined */


%:-use_rendering(svgtree).

/* identifier and digit values that the parse tree takes,
they are mentioned before the program predicate as these are facts 
that are already known to us */

i(identifier(x)) --> [x].
i(identifier(y)) --> [y].
i(identifier(z)) --> [z].
i(identifier(u)) --> [u].
i(identifier(v)) --> [v].

num(number(0)) --> [0].
num(number(1)) --> [1].
num(number(2)) --> [2].
num(number(3)) --> [3].
num(number(4)) --> [4].
num(number(5)) --> [5].
num(number(6)) --> [6].
num(number(7)) --> [7].
num(number(8)) --> [8].
num(number(9)) --> [9].


/* The program takes an input list of tokens to generate a parse tree */
 
program(parse_tree(X)) --> k(X).

/* The parse tree begins by executing a set of statements in a block. [.]
is mentioned as the the input program block ends with '.' */

k(block(X,Y)) --> [begin], dec(X), [;], cmd(Y), [end], [.].


/* Checks for constants, identifiers and variables and recursively calls dec */

dec(declaration(X,Y)) --> dec1(X), [;], dec(Y).
dec(declaration(X)) --> dec1(X).

dec1(const(X,Y)) --> [const], i(X), [=], num(Y).
dec1(var(X)) --> [var], i(X).


/* checks the syntax of identifier expressions, if-then-else, while loops 
and recursively calls cmd */
  
cmd(command(X,Y)) --> cmd1(X), [;], cmd(Y).
cmd(command(X)) --> cmd1(X).

cmd1(equate(X,Y)) --> i(X), [:=], expr(Y).
cmd1(if_condition(X,Y,Z)) --> [if], bool(X), [then], cmd(Y), [else], cmd(Z), [endif].
cmd1(while_condition(X,Y)) --> [while], bool(X), [do], cmd(Y), [endwhile].
cmd1(X) --> k(X).


/* evaluates the boolean values- true, false, equalto and not equal to */

bool(boolean(true)) --> [true].
bool(boolean(false)) --> [false].
bool(boolean_Expr(X,Y)) --> expr(X), [=], expr(Y).
bool(booleanl_NotExpr(X)) --> [not], bool(X).

/* syntax for expressions that add, subtract, multiply and divide two terms
with precedence rules incorporated */

expr(expression(X,Y)) --> termT(X), [+], expr(Y).
expr(expression(X,Y)) --> termT(X), [-], expr(Y).
expr(expression(X)) --> termT(X).

termT(term_expression(X,Y)) --> termF(X), [*], termT(Y).
termT(term_expression(X,Y)) --> termF(X), [/], termT(Y).
termT(term_expression(X)) --> termF(X).

/* the expression can also take an identifier or a number */

termF(X) --> num(X).
termF(X) --> i(X).
