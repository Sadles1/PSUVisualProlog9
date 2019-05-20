% Copyright

implement main
    open core, console

class predicates
    f : (real, real, real, real, real [out]).
    task : (real, real, real [out]).

clauses
    run() :-
        N = 10,
        K = 2,
        task(N, K, R),
        write(R),
        nl,
        _ = readLine(),
        succeed.
    f(N, K, P, NN, R) :-
        N < 10,
        R = NN * 10 + K + K * P * 10,
        !.
    f(N, K, P, NN, R) :-
        N1 = N / 10,
        P1 = P * 10,
        f(N1, K, P1, NN, R).

    task(N, K, R) :-
        f(N, K, 10, N, R).

end implement main

goal
    console::run(main::run).
