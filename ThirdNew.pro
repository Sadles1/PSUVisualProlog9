% Copyright Sadles
%Определим множество как список без повторяющихся элементов. Для двух
%заданных множеств определить, является ли одно из них подмножеством другого.

implement main
    open core, console

class predicates
    sub : (integer*, integer*) nondeterm.
    sub_or : (integer*, integer*) nondeterm.

clauses
    run() :-
        A = [1, 2, 3, 4],
        B = [1, 2, 3, 4, 5, 6],
        sub_or(A, B),
        write("True"),
        nl,
        _ = readLine(),
        succeed,
        !
        or
        write("False"),
        nl,
        _ = readLine(),
        succeed,
        !.
    sub_or(X, Y) :-
        sub(X, Y)
        or
        sub(Y, X).
    sub([], []).
    sub([X | Y], [X | B]) :-
        sub(Y, B).
    sub([X | Y], B) :-
        sub(Y, B).

end implement main

goal
    console::run(main::run).
