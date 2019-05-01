/*
Mapping
P --> Program
K --> Block
D --> Declaration
C --> CommandLines (Statements)
NC --> New CommandLine
ND --> New Declaration
PL --> printLine
Str --> String Expression
X --> any char or string
I --> identifier
BE --> Boolean Expression
E --> Expression
T --> Term
Nt --> Next Term
I --> Identifier
N --> Number
D --> Digit
*/


P ::=  K

K ::=  begin D ; C end.
    | begin D end.
    | begin C end.
    | begin end.

D ::= ND ; D | D
ND ::= boolean I | int I

C ::= NC C | NC
NC ::= ID = E;
    | ID = BE;
    | print PL ;
    | if BE { C } else { C }
    | while BE { C }
    | K

PL ::= E | BE | " Str "
Str ::= " [X] "

BE ::= Bt ~ BE
    | T > T
    | T < T
    | not BE
    | ! BE
    | Bt

Bt ::= true
	| false
	| ( BE )
	| ( BE ) ~ Bt
	| I

E ::=  T + E | T - E | T
T ::= ( E ) T
T ::=  Nt * T | Nt / T | Nt
Nt ::=  I | N

I ::= u | v | x | y | z

N ::= D N | N
D ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
