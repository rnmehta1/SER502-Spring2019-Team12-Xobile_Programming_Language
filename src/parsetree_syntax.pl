/*
Mapping
P --> Program
K --> Block
D --> Declaration
C --> CommandLines (Statements)
Dt --> Data Type
Bl --> Boolean Value
B --> Boolean Expression
E --> Expression
T --> Term
Nt --> Next Term     % To assign Identifier or Number to Term
I --> Identifier
N --> Number
D --> Digit
*/


/* To check the given syntax and generate a parse tree for the same */

P ::=  K

K ::=  begin CL end [.] /*. is used as terminal and will be provided by the user while programming*/
CL ::= Fd CL | C CL | ε

Fd ::= define Name ( Param ) : { C }
Name ::= I


C ::= D, C;
    | if B { C } C
    | if B { C } else { C } C
    | if B { C } elif { C } Elif else { C } C
    | if B { C } elif { C } Elif C
    | while B { C } C
    | while B { C } else { C } C
    | stop
    | return
    | Fc C
    | ε

D ::= boolean I = Bl;
    | Dt I = E;
    | Dt I;
    | I = E;

Dt ::= int | float | string | boolean
Bl ::= true | false


Elif ::= elif { C } Elif | ε

Fc ::= Name ( Param );

Param ::= I, Param
Param ::= I


B ::=  true | false | E ~ E | not B | ! B | 0 | 1

E ::=  T + E | T - E | T
T ::= ( E ) T
T ::=  Nt * T | Nt / T | Nt
Nt ::=  I | N

I(X) ::= [X]

N ::= D, N | ε

D ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
