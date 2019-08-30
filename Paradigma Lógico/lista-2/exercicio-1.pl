:- use_module(library(plunit)).

%% ultimo(+L, +X) is det
%
%% Retorna verdadeiro de X for o último elemento da lista L

:- begin_tests(ultimo).
test(ultimo, [fail]) :- ultimo([], _).
test(ultimo) :- ultimo([1], 1).
test(ultimo) :- ultimo([5, 3, 2], 2).
test(ultimo) :- ultimo([1, 2, 3, 4, 4, 3, 4, 4], 4).
:- end_tests(ultimo).

ultimo([], _) :- fail.

ultimo([H|T], X) :-
    T == [],
    H =:= X, !.

ultimo([_|T], X) :- ultimo(T, X).