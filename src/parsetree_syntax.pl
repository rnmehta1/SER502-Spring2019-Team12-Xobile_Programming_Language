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
L --> any alphabetic character A..Z or a..z
ANY --> any alphabetic character or any digit
N --> Number
D --> Digit
*/


/* To check the given syntax and generate a parse tree for the same */

P ::=  K

K ::=  begin C end [.] /* dot(.) is used as terminal and will be provided by the user while programming*/

C ::= D C;
    | if B { C } C
    | if B { C } else { C } C
    | if B { C } elif { C } Elif C
    | if B { C } elif { C } Elif else { C } C
    | while B { C } C
    | while B { C } else { C } C
    | stop
    | ε

D ::= boolean I = Bl;
    | Dt I = E;
    | Dt I;
    | I = E;

Dt ::= int | float | string | boolean
Bl ::= true | false


Elif ::= elif { C } Elif | ε

B ::=  true | false | E ~ E |E ! E | E | not B | ! B | 0 | 1

E ::=  T + E | T - E | T
T ::= ( E ) T
T ::=  Nt * T | Nt / T | Nt
Nt ::=  I | N

I ::= L ANY
L ::= A..Z | a..z
ANY ::= L D | D L | ε


N ::= D, N | ε
D ::= 0..9
