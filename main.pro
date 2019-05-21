% Copyright Sadles
% Количество ненулевых элементов в списке

implement main
    open core, console

class predicates
    nz_count : (integer*, integer [out]) determ.
clauses
    run() :-
        A = [3, 0, 3, 9, 2, 0, 1, 4, 0],
        nz_count(A, N),
        write(N),
        nl,
        _ = readLine(),
        succeed,
        !
        or
        console::write("Fail").
    nz_count([], 0) :-
        !.
    nz_count([H | T], N) :-
        H <> 0,
        nz_count(T, N1),
        N = N1 + 1,
        !.
    nz_count([H | T], N) :-
        H = 0,
        nz_count(T, N).

end implement main

goal
    console::run(main::run).
