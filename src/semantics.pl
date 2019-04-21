% Semantic interpretations for the grammar defined-
% The grammar for the language has the following functionality implemented-
% 1. Primitive types and operators
% 2. Looping statements-
%       If statement, If - Else statement, if – Elif – Else statement, 
%       While Statement, Print statement
% 3. Variable Assignment Declaration

% Semantics defined for primitve types and operators-

%addition operation

add(X,C,Y):- C = "+", write('Operator used -> '), write(C), nl, computeAdd(X,Y).
computeAdd(X,Y):- R is X+Y, write('Result is ->'), write(R).

%subtraction operation

sub(X,C,Y):- C = "-", write('Operator used -> '), write(C), nl, computeSub(X,Y).
computeSub(X,Y):- R is X-Y, write('Result is ->'), write(R).

%multiplication operation

mul(X,C,Y):- C = "*", write('Operator used -> '), write(C), nl, computeMul(X,Y).
computeMul(X,Y):- R is X*Y, write('Result is ->'), write(R).

%division operation

div(X,C,Y):- C = "/", write('Operator used -> '), write(C), nl, computeDiv(X,Y).
computeDiv(X,Y):- R is X/Y, write('Result is ->'), write(R).

%modulus operation
%syntax can be given as mod or %

mod(X,C,Y):- C = "mod", write('Operator used -> '), write(C), nl, computeMod(X,Y).
computeMod(X,Y):- R is X mod Y, write('Result is ->'), write(R).

mod1(X,C,Y):- C = "'%'", write('Operator used -> '), write(C), nl, computeMod1(X,Y).
computeMod1(X,Y):- R is X '%' Y, write('Result is ->'), write(R).

%not operation
%syntax can be given as not or !

not(X, S):- S = "not", computeNot(X).
computeNot(X):- R is -X, write(R).

not1(X, S):- S = "!", computeNot1(X).
computeNot1(X):- R is -X, write(R).

%Semantics defined for loop statements

%if loop

%if-else loop

%if-elif else loop

%if-elif-elif loop

%while-loop

%while-else
