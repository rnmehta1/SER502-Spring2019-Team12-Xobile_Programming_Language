/*
Mapping
P --> Program
K --> Block
D --> Declaration
C --> CommandLines (Statements)
NC --> New CommandLine
ND --> New Declaration
PL --> printLine
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

C ::= NC ; C | NC
NC ::= ID [=] E
    | print PL
    | if BE { C } else { C }
    | while BE { C }
    | K

PL ::= E | BE

BE ::= true | false | E ~ E | not BE

E ::=  T + E | T - E | T
T ::= ( E ) T
T ::=  Nt * T | Nt / T | Nt
Nt ::=  I | N

I ::= u,v,x,y,z

N ::= D N | []
D ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
