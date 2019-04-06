/* To check the given syntax and generate a parse tree for the same */ 

P ::=  K.
K ::=  begin D; C end

D ::=   const I = N; D
           | var I ; D
           | const I = N
           | var I

C ::=   I : = E; C
           | if B then C else C endif ; C
           | while B do C endwhile ; C
           | K ; C
           | I := E
           | if B then C else C endif
           | while B do C endwhile
           | K

B ::=  true | false | E = E | not B

E ::=  T + E | T - E | T
T ::=  F * T | F / T | F
F ::=  I | N 

I ::=  x | y | z | u | v

N ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9  */

