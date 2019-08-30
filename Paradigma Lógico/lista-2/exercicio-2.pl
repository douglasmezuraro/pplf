:- use_module(library(plunit)).

%% par(+X) is det
%
%% retorna verdadeiro se X é par

:- begin_tests(par).
test(par) :- par(-2).
test(par, [fail]) :- par(-1). 
test(par) :- par(0).
test(par, [fail]) :- par(1).
test(par) :- par(2).
:- end_tests(par).

par(X) :- X mod 2 =:= 0.

%% listas_iguais(+A, ?B) is det
%
%% retorna verdadeiro se a lista A e B são iguais

:- begin_tests(listas_iguais).
test(listas_iguais) :- listas_iguais([], []).
test(listas_iguais, B = [1, 2, 3]) :- listas_iguais([1, 2, 3], B).
test(listas_iguais) :- listas_iguais([-1, 4, -4, 4, 5], [-1, 4, -4, 4, 5]).
test(listas_iguais, [fail]) :- listas_iguais([0, -1, 2], [0, 1, 2]).
:- end_tests(listas_iguais).

listas_iguais([], []).
listas_iguais([A|T1], [A|T2]) :-
	listas_iguais(T1, T2).

%% filtrar_pares(+A, -B) is det
%
%% retorna em B uma lista com os elementos pares de A na mesma ordem

:- begin_tests(filtrar_pares).
test(filtrar_pares, B = []) :- filtrar_pares([], B).
test(filtrar_pares, B = [0, 2, 4]) :- filtrar_pares([0, 1, 2, 3, 4, 5], B).
test(filtrar_pares, B = [-2, 0, 2]) :- filtrar_pares([-3, -2, -1, 0, 1, 2, 3], B).
:- end_tests(filtrar_pares).

filtrar_pares([], []).
filtrar_pares([H|T1], [H|T2]) :-
    par(H), !,
    filtrar_pares(T1, T2).
filtrar_pares([_|T], L) :-
    filtrar_pares(T, L).
    

%% pares(+L, +P) is det
%
%% retorna verdadeiro se P é uma lista com os elementos pares de L na mesma sequência

:- begin_tests(pares).
test(pares) :- pares([0, 1, 2, 3, 4, 5], [0, 2, 4]).
test(pares, [fail]) :- pares([2, 1, 4, 5, 6], [2]).
:- end_tests(pares).

pares(P, L) :-
    filtrar_pares(P, X),
    listas_iguais(X, L).