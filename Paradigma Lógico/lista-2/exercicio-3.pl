:- use_module(library(plunit)).

%% lista_soma(+XS, +A, ?YS)
%
%% retorna verdadeiro se YS é a lista XS somado com A em cada elemento

:- begin_tests(lista_soma).
test(lista_soma, YS = []) :- lista_soma([], _, YS).
test(lista_soma, YS = [2, 3, 4]) :- lista_soma([1, 2, 3], 1, YS).
test(lista_soma, YS = [4, 8, 16, 32]) :- lista_soma([2, 6, 14, 30], 2, YS).
test(lista_soma) :- lista_soma([0], 1, [1]).
:- end_tests(lista_soma).

lista_soma([], _, []).
lista_soma([HX|TX], A, [HY|TY]) :-
	HY is HX + A,
    lista_soma(TX, A, TY).