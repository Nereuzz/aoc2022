list_butlast([X|Xs], Ys) :-                 % use auxiliary predicate ...
   list_butlast_prev(Xs, Ys, X).            % ... which lags behind by one item

list_butlast_prev([], [], _).
list_butlast_prev([X1|Xs], [X0|Ys], X0) :-  
   list_butlast_prev(Xs, Ys, X1).           % lag behind by one

append([],X,X).
append([X|Y],Z,[X|W]) :- append(Y,Z,W).

moveBox(S, T, Count, NS, NT) :-
    last(S, X),
    append(T, [X], Y),
    list_butlast(S, S11),
    NS = S11,
    NT = Y,
    write(NS),
    write("\n"),
    write(NT),
    write("\n"),
    NewCount is Count - 1,
    (NewCount is 0 -> true ; moveBox(NS, NT, NewCount, A, B)).


 main :-
    S1 = ['S', 'T', 'H', 'F', 'W', 'R'],
    S2 = ['S', 'G', 'D', 'Q', 'W'],
    S3 = ['B', 'T', 'W'],
    S4 = [],
    Moves = [[2,1,2]],
    Move = [2,1,2],
    write(S1),
    write("\n"),
    write(S2),
    write("\n"),
    moveBox(S1, S2, 2, NS, NT),
    write("------------\n"),
    write(NS),
    write("\n"),
    write(NT),
    write("\n").
/*    doMoves(Moves, S1, S2, S3, S4, [], [], [], [], []).*/

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
    ( Source is 1, Target is 3 -> moveBox(S1, S3, Count, T1, T2), doMoves(T, T1, S3, T2, S4, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 4 -> moveBox(S1, S4, Count, T1, T2), doMoves(T, T1, S2, S3, T2, S5, S6, S7, S8, S9); true),
    ( Source is 1, Target is 5 -> moveBox(S1, S5, Count, T1, T2), doMoves(T, T1, T2, S3, S4, T2, S6, S7, S8, S9); true),
    ( Source is 1, Target is 6 -> moveBox(S1, S6, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, T2, S7, S8, S9); true),
    ( Source is 1, Target is 7 -> moveBox(S1, S7, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, T2, S8, S9); true),
    ( Source is 1, Target is 8 -> moveBox(S1, S8, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, S7, T2, S9); true),
    ( Source is 1, Target is 9 -> moveBox(S1, S9, Count, T1, T2), doMoves(T, T1, T2, S3, S4, S5, S6, S7, S8, T2); true),

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
