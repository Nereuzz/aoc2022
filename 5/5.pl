/* Noob-log */

read_file(Stream,[]) :-
    at_end_of_stream(Stream).

read_file(Stream,[X|L]) :-
    \+ at_end_of_stream(Stream),
    read_line_to_string(Stream,String),
    split_string(String, " ", "", Res),
    nth0(1, Res, T1),
    nth0(3, Res, T2),
    nth0(5, Res, T3),
    number_string(TT1, T1),
    number_string(TT2, T2),
    number_string(TT3, T3),
    X = [TT1, TT2, TT3],
    read_file(Stream,L), !.

lastN(L,N,R):- length(L,X), X1 is X-N, lastT(L,X1,R).
lastT(L,0,L).
lastT([H|T],X,L):- X2 is X-1, lastT(T,X2,L).

list_butlast([X|Xs], Ys) :-
   list_butlast_prev(Xs, Ys, X).

list_butlast_prev([], [], _).
list_butlast_prev([X1|Xs], [X0|Ys], X0) :-  
    list_butlast_prev(Xs, Ys, X1).

List_butLastN(L, 0, NL) :-
    NL = L.
list_butLastN(L, Count, NL) :-
    list_butlast(L, Y),
    NewCount is Count - 1,
    list_butLastN(Y, NewCount, NL).

append([],X,X).
append([X|Y],Z,[X|W]) :- append(Y,Z,W).

moveBox(S, T, 0, NS, NT) :-
    NS = S,
    NT = T.
moveBox(S, T, Count, NS, NT) :-
    last(S, X),
    append(T, [X], Y),
    list_butlast(S, S11),
    NewCount is Count - 1,
    moveBox(S11, Y, NewCount, NS, NT).
    
moveBoxes(S, T, Count, NS, NT) :-
    lastN(S, Count, Tail),
    append(T, Tail, Y),
    list_butLastN(S, Count, Z),
    NS = Z,
    NT = Y.

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
    nth0(0, H, Count),
    nth0(1, H, Source),
    nth0(2, H, Target),
    ( Source is 1, Target is 2 -> moveBox(S1, S2, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 3 -> moveBox(S1, S3, Count, T1, T2), doMoves(T, T1, S2, T2, S4, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 4 -> moveBox(S1, S4, Count, T1, T2), doMoves(T, T1, S2, S3, T2, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 5 -> moveBox(S1, S5, Count, T1, T2), doMoves(T, T1, S2, S3, S4, T2, S6, S7, S8, S9); true),
    ( Source is 1, Target is 6 -> moveBox(S1, S6, Count, T1, T2), doMoves(T, T1, S2, S3, S4, S5, T2, S7, S8, S9); true),
    ( Source is 1, Target is 7 -> moveBox(S1, S7, Count, T1, T2), doMoves(T, T1, S2, S3, S4, S5, S6, T2, S8, S9); true),
    ( Source is 1, Target is 8 -> moveBox(S1, S8, Count, T1, T2), doMoves(T, T1, S2, S3, S4, S5, S6, S7, T2, S9); true),
    ( Source is 1, Target is 9 -> moveBox(S1, S9, Count, T1, T2), doMoves(T, T1, S2, S3, S4, S5, S6, S7, S8, T2); true),

    ( Source is 2, Target is 1 -> moveBox(S2, S1, Count, T1, T2), doMoves(T, T2, T1, S3, S4, S5, S6, S7, S8, S9); true),
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
    
    ( Source is 4, Target is 1 -> moveBox(S4, S1, Count, T1, T2), doMoves(T, T2, S2, S3, T1, S5, S6, S7, S8, S9); true),
    ( Source is 4, Target is 2 -> moveBox(S4, S2, Count, T1, T2), doMoves(T, S1, T2, S3, T1, S5, S6, S7, S8, S9); true),
    ( Source is 4, Target is 3 -> moveBox(S4, S3, Count, T1, T2), doMoves(T, S1, S2, T2, T1, S5, S6, S7, S8, S9); true),
    ( Source is 4, Target is 5 -> moveBox(S4, S5, Count, T1, T2), doMoves(T, S1, S2, S3, T1, T2, S6, S7, S8, S9); true),
    ( Source is 4, Target is 6 -> moveBox(S4, S6, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, T2, S7, S8, S9); true),
    ( Source is 4, Target is 7 -> moveBox(S4, S7, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, S6, T2, S8, S9); true),
    ( Source is 4, Target is 8 -> moveBox(S4, S8, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, S6, S7, T2, S9); true),
    ( Source is 4, Target is 9 -> moveBox(S4, S9, Count, T1, T2), doMoves(T, S1, S2, S3, T1, S5, S6, S7, S8, T2); true),
    
    ( Source is 5, Target is 1 -> moveBox(S5, S1, Count, T1, T2), doMoves(T, T2, S2, S3, S4, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 2 -> moveBox(S5, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 3 -> moveBox(S5, S3, Count, T1, T2), doMoves(T, S1, S2, T2, S4, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 4 -> moveBox(S5, S4, Count, T1, T2), doMoves(T, S1, S2, S3, T2, T1, S6, S7, S8, S9); true),
    ( Source is 5, Target is 6 -> moveBox(S5, S6, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, T2, S7, S8, S9); true),
    ( Source is 5, Target is 7 -> moveBox(S5, S7, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, S6, T2, S8, S9); true),
    ( Source is 5, Target is 8 -> moveBox(S5, S8, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, S6, S7, T2, S9); true),
    ( Source is 5, Target is 9 -> moveBox(S5, S9, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T1, S6, S7, S8, T2); true),
    
    ( Source is 6, Target is 1 -> moveBox(S6, S1, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 2 -> moveBox(S6, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 3 -> moveBox(S6, S3, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 4 -> moveBox(S6, S4, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, T1, S7, S8, S9); true),
    ( Source is 6, Target is 5 -> moveBox(S6, S5, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, T1, S7, S8, S9); true),
    ( Source is 6, Target is 7 -> moveBox(S6, S7, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T1, T2, S8, S9); true),
    ( Source is 6, Target is 8 -> moveBox(S6, S8, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T1, S7, T2, S9); true),
    ( Source is 6, Target is 9 -> moveBox(S6, S9, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T1, S7, S8, T2); true),
    
    ( Source is 7, Target is 1 -> moveBox(S7, S1, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 2 -> moveBox(S7, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 3 -> moveBox(S7, S3, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 4 -> moveBox(S7, S4, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, S6, T1, S8, S9); true),
    ( Source is 7, Target is 5 -> moveBox(S7, S5, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, S6, T1, S8, S9); true),
    ( Source is 7, Target is 6 -> moveBox(S7, S6, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T2, T1, S8, S9); true),
    ( Source is 7, Target is 8 -> moveBox(S7, S8, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T1, T2, S9); true),
    ( Source is 7, Target is 9 -> moveBox(S7, S9, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T1, S8, T2); true),
    
    ( Source is 8, Target is 1 -> moveBox(S8, S1, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 2 -> moveBox(S8, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 3 -> moveBox(S8, S3, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 4 -> moveBox(S8, S4, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, S6, S7, T1, S9); true),
    ( Source is 8, Target is 5 -> moveBox(S8, S5, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, S6, S7, T1, S9); true),
    ( Source is 8, Target is 6 -> moveBox(S8, S6, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T2, S7, T1, S9); true),
    ( Source is 8, Target is 7 -> moveBox(S8, S7, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T2, T1, S9); true),
    ( Source is 8, Target is 9 -> moveBox(S8, S9, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, S7, T1, T2); true),
    
    ( Source is 9, Target is 1 -> moveBox(S9, S1, Count, T1, T2), doMoves(T, T2, S2, S3, S4, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 2 -> moveBox(S9, S2, Count, T1, T2), doMoves(T, S1, T2, S3, S4, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 3 -> moveBox(S9, S3, Count, T1, T2), doMoves(T, S1, S2, T2, S4, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 4 -> moveBox(S9, S4, Count, T1, T2), doMoves(T, S1, S2, S3, T2, S5, S6, S7, S8, T1); true),
    ( Source is 9, Target is 5 -> moveBox(S9, S5, Count, T1, T2), doMoves(T, S1, S2, S3, S4, T2, S6, S7, S8, T1); true),
    ( Source is 9, Target is 6 -> moveBox(S9, S6, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, T2, S7, S8, T1); true),
    ( Source is 9, Target is 7 -> moveBox(S9, S7, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, T2, S8, T1); true),
    ( Source is 9, Target is 8 -> moveBox(S9, S8, Count, T1, T2), doMoves(T, S1, S2, S3, S4, S5, S6, S7, T2, T1); true).

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
    open('input.txt', read, Str),
    read_file(Str, Moves),
    close(Str),
    doMoves(Moves, S1, S2, S3, S4, S5, S6, S7, S8, S9).
