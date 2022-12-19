list_butlast([X|Xs], Ys) :-                 % use auxiliary predicate ...
   list_butlast_prev(Xs, Ys, X).            % ... which lags behind by one item

list_butlast_prev([], [], _).
list_butlast_prev([X1|Xs], [X0|Ys], X0) :-  
   list_butlast_prev(Xs, Ys, X1).           % lag behind by one

append([],X,X).
append([X|Y],Z,[X|W]) :- append(Y,Z,W).

read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read_line_to_string(Stream,String),
    string_code(6, String, T1),
    char_code(TT1, T1),
    
    string_code(13, String, T2),
    char_code(TT2, T2),
    
    string_code(18, String, T3),
    char_code(TT3, T3),
    
    string_chars([TT1, TT2, TT3], X),
    read_file(Stream,L), !.

moveBox(S, T, 0, NS, NT) :-
    NS = S,
    NT = T.
moveBox(S, T, Count, NS, NT) :-
    write("in movebox"),write("\n"),
    last(S, X),
    append(T, [X], Y),
    list_butlast(S, S11),
    write(NS),
    write("\n"),
    write(NT),
    write("\n"),
    NewCount is Count - 1,
    moveBox(S11, Y, NewCount, NS, NT).


main :-
    S1 = ['S', 'T', 'H', 'F', 'W', 'R'],
    S2 = ['S', 'G', 'D', 'Q', 'W'],
    S3 = ['B', 'T', 'W'],
    S4 = ['D', 'R', 'W', 'T', 'N', 'Q', 'Z', 'J'],
    S5 = ['F', 'B', 'H', 'G', 'L', 'V', 'T', 'Z'],
    S6 = ['L', 'P', 'T', 'C', 'V', 'B', 'S', 'G'],
    S7 = ['Z', 'B','R','T','W','G','P'],
    S8 = ['N','G','M','T','C','J','R'],
    S9 = ['L','G','B','W'],
    open('small_input.txt', read, Str),
    write("hehe"),
    read_file(Str, Moves),
    close(Str),
    doMoves(Moves, S1, S2, S3, S4, S5, S6, S7, S8, S9).

doMoves([], S1, S2, S3, S4, S5, S6, S7, S8, S9) :-
    write("S1: "),write(S1),write("\n"),
    write("S2: "),write(S2),write("\n"),
    write("S3: "),write(S3),write("\n"),
    write("S4: "),write(S4),write("\n"),
    write("S5: "),write(S5),write("\n"),
    write("S6: "),write(S6),write("\n"),
    write("S7: "),write(S7),write("\n"),
    write("S8: "),write(S8),write("\n"),
    write("S9: "),write(S9),write("\n").
doMoves([H|T], S1, S2, S3, S4, S5, S6, S7, S8, S9) :-
    write(H),
    nth0(0, H, C),
    nth0(1, H, S),
    nth0(2, H, T),
    number_chars(Count, C),
    write(Count),
    number_chars(Source, S),
    number_chars(Target, T),
    ( Source is 1, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 3 -> moveBox(S1, S3, Count, T1, T2), doMoves(T, T1, S3, T2, S4, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 4 -> moveBox(S1, S4, Count, T1, T2), doMoves(T, T1, S2, S3, T2, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 5 -> moveBox(S1, S5, Count, T1, T2), doMoves(T, T1, T2, S3, S4, T2, S6, S7, S8, S9); true),
    ( Source is 1, Target is 6 -> moveBox(S1, S6, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, T2, S7, S8, S9); true),
    ( Source is 1, Target is 7 -> moveBox(S1, S7, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, T2, S8, S9); true),
    ( Source is 1, Target is 8 -> moveBox(S1, S8, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, S7, T2, S9); true),
    ( Source is 1, Target is 9 -> moveBox(S1, S9, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, S7, S8, T2); true),

    ( Source is 2, Target is 1 -> write("yes yes"), moveBox(S2, S1, Count, T1, T2), doMoves(T, T2, T1, S3, S4, S5, S6, S7, S8, S9); true),
    ( Source is 2, Target is 3 -> moveBox(S2, S3, Count, T1, T2), doMoves(T, S1, T1, T2, S4, S5, S6, S7, S8, S9); true),
    ( Source is 2, Target is 4 -> moveBox(S2, S4, Count, T1, T2), doMoves(T, S1, T1, S3, T2, S5, S6, S7, S8, S9); true),
    ( Source is 2, Target is 5 -> moveBox(S2, S5, Count, T1, T2), doMoves(T, S1, T1, S3, S4, T2, S6, S7, S8, S9); true),
    ( Source is 2, Target is 6 -> moveBox(S2, S6, Count, T1, T2), doMoves(T, S1, T1, S3, S4, S5, T2, S7, S8, S9); true),
    ( Source is 2, Target is 7 -> moveBox(S2, S7, Count, T1, T2), doMoves(T, S1, T1, S3, S4, S5, S6, T2, S8, S9); true),
    ( Source is 2, Target is 8 -> moveBox(S2, S8, Count, T1, T2), doMoves(T, S1, T1, S3, S4, S5, S6, S7, T2, S9); true),
    ( Source is 2, Target is 9 -> moveBox(S2, S9, Count, T1, T2), doMoves(T, S1, T1, S3, S4, S5, S6, S7, S8, T2); true),
    
    ( Source is 3, Target is 1 -> moveBox(S3, S1, Count, T1, T2), doMoves(T, T2, S2, T1, S4, S5, S6, S7, S8, S9); true),
    ( Source is 3, Target is 2 -> moveBox(S3, S2, Count, T1, T2), doMoves(T, S1, T2, T1, S4, S5, S6, S7, S8, S9); true),
    ( Source is 3, Target is 4 -> moveBox(S3, S4, Count, T1, T2), doMoves(T, S1, S2, T1, T2, S5, S6, S7, S8, S9); true),
    ( Source is 3, Target is 5 -> moveBox(S3, S5, Count, T1, T2), doMoves(T, S1, S2, T1, S4, T2, S6, S7, S8, S9); true),
    ( Source is 3, Target is 6 -> moveBox(S3, S6, Count, T1, T2), doMoves(T, S1, S2, T1, S4, S5, T2, S7, S8, S9); true),
    ( Source is 3, Target is 7 -> moveBox(S3, S7, Count, T1, T2), doMoves(T, S1, S2, T1, S4, S5, S6, T2, S8, S9); true),
    ( Source is 3, Target is 8 -> moveBox(S3, S8, Count, T1, T2), doMoves(T, S1, S2, T1, S4, S5, S6, S7, T2, S9); true),
    ( Source is 3, Target is 9 -> moveBox(S3, S9, Count, T1, T2), doMoves(T, S1, S2, T1, S4, S5, S6, S7, S8, T2); true),
    
    ( Source is 4, Target is 1 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T2, S2, S3, T1, S5, S6, S7, S8, S9); true),
    ( Source is 4, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, T2, S3, T1, S5, S6, S7, S8, S9); true),
    ( Source is 4, Target is 3 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, T2, T1, S5, S6, S7, S8, S9); true),
    ( Source is 4, Target is 5 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T1, T2, S6, S7, S8, S9); true),
    ( Source is 4, Target is 6 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, T2, S7, S8, S9); true),
    ( Source is 4, Target is 7 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, S6, T2, S8, S9); true),
    ( Source is 4, Target is 8 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, S6, S7, T2, S9); true),
    ( Source is 4, Target is 9 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, S6, S7, S8, T2); true),
    
    ( Source is 5, Target is 1 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T2, S2, S3, S4, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 3 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, T2, S4, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 4 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T2, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 6 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, T2, S7, S8, S9); true),
    ( Source is 5, Target is 7 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, S6, T2, S8, S9); true),
    ( Source is 5, Target is 8 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, S6, S7, T2, S9); true),
    ( Source is 5, Target is 9 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, S6, S7, S8, T2); true),
    
    ( Source is 6, Target is 1 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 3 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 4 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 5 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, T1, S7, S8, S9); true),
    ( Source is 6, Target is 7 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T1, T2, S8, S9); true),
    ( Source is 6, Target is 8 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T1, S7, T2, S9); true),
    ( Source is 6, Target is 9 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T1, S7, S8, T2); true),
    
    ( Source is 7, Target is 1 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 3 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 4 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 5 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, S6, T1, S8, S9); true),
    ( Source is 7, Target is 6 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T2, T1, S8, S9); true),
    ( Source is 7, Target is 8 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T1, T2, S9); true),
    ( Source is 7, Target is 9 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T1, S8, T2); true),
    
    ( Source is 8, Target is 1 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 3 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 4 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 5 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, S6, S7, T1, S9); true),
    ( Source is 8, Target is 6 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T2, S7, T1, S9); true),
    ( Source is 8, Target is 7 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T2, T1, S9); true),
    ( Source is 8, Target is 9 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, S7, T1, T2); true),
    
    ( Source is 9, Target is 1 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 3 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 4 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 5 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, S6, S7, S8, T1); true),
    ( Source is 9, Target is 6 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T2, S7, S8, T1); true),
    ( Source is 9, Target is 7 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T2, S8, T1); true),
    ( Source is 9, Target is 8 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, S7, T2, T1); true).
