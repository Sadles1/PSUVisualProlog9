% Copyright
/*Пять детей - Алик, Боря, Витя, Лена и Даша - приехали в лагерь

из 5 разных городов: Харькова, Умани, Полтавы, Славянска и Краматорска. Есть 4 высказывания:

1) Если Алик не из Умани, то Боря из Краматорска.
2) Или Боря, или Витя приехали из Харькова.
3) Если Витя не из Славянска, то Лена приехала из Харькова.
4) Или Даша приехала из Умани, или Лена из Краматорска.

Кто откуда приехал?*/

implement main
    open core, console

class predicates
    proposition : (integer, string, string) determ.
    city : (string Город [out]) multi.
    solution : (string [out], string [out], string [out], string [out], string [out]) nondeterm.

clauses
    city("Харьков").
    city("Умань").
    city("Полтава").
    city("Славянск").
    city("Краматорск").

    proposition(1, А, Б) :-
        if А <> "Умань" then
            Б = "Краматорск"
        end if.
    proposition(2, Б, В) :-
        if Б <> "Харьков" then
            В = "Харьков"
        end if.
    proposition(3, В, Л) :-
        if В <> "Славянск" then
            Л = "Харьков"
        end if.
    proposition(4, Л, Д) :-
        if Л <> "Крамоторск" then
            Д = "Умань"
        end if.

    solution(А, Б, В, Л, Д) :-
        city(А),
        city(Б),
        proposition(1, А, Б),
        city(В),
        proposition(2, Б, В),
        city(Л),
        proposition(3, В, Л),
        city(Д),
        proposition(4, Л, Д).

    run() :-
        solution(А, Б, В, Л, Д),
        write("Aлик - ", А, ", Боря - ", Б, ", \nВитя - ", В, ", Лена - ", Л, ", Даша - ", Д),
        nl,
        nl,
        fail
        or
        _ = readLine().

end implement main

goal
    console::run(main::run).
