P ::=  K

K ::=  begin C end. /*. is used as terminal and will be provided by the user while programming*/

D ::= boolean I = Bl;
    | Dt I = N;
    | Dt I;
    | I = I;
    | I = N;

Dt ::= int | float | string | boolean
Bl ::= true | false

/* Declaration can be done at any point of time in the program by user */
C ::= D, C;
    | I = E
    | if B { C }
    | if B { C } else { C }
    | if B { C } elif { C } Elif else { C }
    | while B { C }
    | while B { C } else { C }
    | stop
    | K
    | ε

Elif ::= elif { C } Elif | ε

B ::=  true | false | E ~ E | not B | ! B | 0 | 1

E ::=  T + E | T - E | T
T ::= ( E ) T
T ::=  F * T | F / T | F
F ::=  I | N

/* we will try to add power, interger divide and modulous for 2 Expressions in
the program, work in progress*/


/*grammar of identifier might be changed in next milestone, to add some
constraints in assigning name to the variable*/
I(X) ::= [X]

N ::= D, N | ε

D ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
