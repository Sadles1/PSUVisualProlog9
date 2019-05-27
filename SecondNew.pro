% Copyright Sadles
% Указать минимальный элемент среди нечётных чисел в списке.

implement main
    open core, console

class predicates
    list : (integer*, integer [out]).
    min : (integer, integer, integer [out]).

clauses
    run() :-
        A = [3, 2, 5, 6, 7, 9, 2, 3, 4],
        % Min = 1000,
        list(A, Min),
        write(Min),
        nl,
        _ = readLine(),
        succeed.
        %!
        %or
        %console::write("Fail").
    list([], 1000).
    list([H | T], Min) :-
        H mod 2 <> 0,
        list(T, NewMin),
        min(H, NewMin, Min),
        !.
    list([_ | T], Min) :-
        list(T, Min).
    min(X, Y, X) :-
        X < Y,
        !.
    min(_, Y, Y).

end implement main

goal
    console::run(main::run).
