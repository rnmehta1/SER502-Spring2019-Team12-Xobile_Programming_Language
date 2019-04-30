/*readFile(File):-
    open(File, read, Stream),
    get_char(Stream, Char),
    process(Char, Stream),
    close(Stream).

process(end_of_file, _):-!.

process(Char, Stream):-
    \+(Char = '\n'),
    get_char(Stream, NextChar),
    process(NextChar, Stream).

process(Char, Stream):-
    Char = '\n',
    write('kkk'),
    get_char(Stream, NextChar),
    process(NextChar, Stream).
*/

readFile(File,Final):-
    open(File, read, Stream),
    get_char(Stream, Char),
    Temp = '',
    process(Char, Stream, Temp, Final),
    close(Stream).

process(end_of_file, _,_,_):-!.

process(Char, Stream, Temp, Final):-
    \+(Char = '\n'),
    atom_concat(Temp, Char, NewTemp),
    get_char(Stream, NextChar),
    process(NextChar, Stream, NewTemp, Final).

process(Char, Stream, Temp, Final):-
    Char = '\n',
    append(Final, Temp, NewFinal),
    get_char(Stream, NextChar),
    NewTemp = '',
    process(NextChar, Stream, NewTemp, NewFinal).
