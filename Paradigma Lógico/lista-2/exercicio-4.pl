:- use_module(library(plunit)).

%% maior(+A, +B, ?C) is det
%
%% retorna verdadeiro se C é o maior elemento entre A e B

:- begin_tests(maior).
test(maior) :- maior(1, 2, 2).
test(maior, [fail]) :- maior(1.111, 1.121, 1.111).
test(maior, M == 4) :- maior(4, 2, M).
:- end_tests(maior).

maior(A, B, A) :- A >= B, !.
maior(A, B, B) :- B > A.

%% maximo(+XS, ?M) is det
%
%% verdadeiro se M é maior elemento da lista XS

:- begin_tests(maximo).
test(maximo, [fail]) :- maximo([], _).
test(maximo, M == 0) :- maximo([0], M).
test(maximo, M == 4) :- maximo([1, 4, 3, 0, 2], M). 
:- end_tests(maximo).

maximo([M], M) :- !.
maximo([H|T], M) :-
    maximo(T, X0),
    maior(H, X0, M).