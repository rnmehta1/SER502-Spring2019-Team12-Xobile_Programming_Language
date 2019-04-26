grammar XOBILE;

parse :
    (print_stmt | var_declare | if_stmt | while_stmt)*
;

print_stmt :
    'print('Var_name')\n'
;

var_declare :
    Var_name '=' expr'\n'
;

Var_name :
    [a-z]+
;

expr :
    Var_name Op Int
    | Var_name Op Flt
    | Int Op Flt
    | Flt Op Flt
    | Flt Op Int
    | Int Op Int
    | Int
    | Flt
    | Str
;

Int :
    [0-9]+
;

Flt :
    [0-9]+'.'[0-9]+
;

Str :
    '"'[a-zA-Z0-9]*'"''\n'
;

Op :
    '+' | '-' | '*' | '/' | '<' | '>' | '<=' | '>=' | '!=' | '==' | '&&' | '||'
;

if_stmt :
    'if' expr ':\n' Indent parse'\n' ('elif:\n' Indent parse'\n')* ('else:\n' Indent parse'\n')?
;

while_stmt :
    'while' expr ':\n' Indent parse
;

Indent :
    [ \t]+ -> skip
;

Whitespace :
    [ \t\r\n]+ -> skip
;

Comment :
    '#' ~( '\r' | '\n' )* -> skip
;
