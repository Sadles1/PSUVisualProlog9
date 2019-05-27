% Copyright Sadles
% Составить список всех трехзначных чисел, в десятичной записи которых нет
% одинаковых цифр (операции деления и нахождения остатка от деления не
% использовать).

implement main
    open core, console

class predicates
    test : (integer, integer, integer) nondeterm.
    number : (integer, integer, integer) nondeterm.

clauses
    run() :-
        First = 1,
        Second = 0,
        Third = 0,
        number(First, Second, Third),
        nl,
        _ = readLine(),
        succeed,
        !
        or
        write("Fail").

    %
    number(F, S, T) :-
        F < 10,
        S < 10,
        T < 10,
        test(F, S, T),
        NewT = T + 1,
        number(F, S, NewT).
    number(F, S, T) :-
        F = 10,
        !.
    number(F, S, T) :-
        S = 10,
        NewF = F + 1,
        NewS = 0,
        NewT = 0,
        number(NewF, NewS, NewT).
    number(F, S, T) :-
        T = 10,
        NewS = S + 1,
        NewT = 0,
        number(F, NewS, NewT).
    test(F, S, T) :-
        F <> S,
        S <> T,
        F <> T,
        Number = F * 100 + S * 10 + T,
        write(Number, "\n").
    test(F, S, T) :-
        F = S
        or
        S = T
        or
        F = T.

end implement main

goal
    console::run(main::run).
