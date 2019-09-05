:- use_module(library(plunit)).

%% palindrome(+L) is det
%
%% returns true when list "L" is a palindrome

:- begin_tests(palindrome).
test(palindrome) :- palindrome([]).
test(palindrome) :- palindrome(['a']).
test(palindrome) :- palindrome(['a', 'a']).
test(palindrome) :- palindrome(['a', 'r', 'a', 'r', 'a']).
test(palindrome, [fail]) :- palindrome(['a', 'r', 'a', 'r']).
:- end_tests(palindrome).

reverse_acc([H|T], A, R) :- reverse_acc(T, [H|A], R).
reverse_acc([], A, A).

reverse(L, R) :- reverse_acc(L, [], R).

same_list([], []).
same_list([H|TA], [H|TB]) :- same_list(TA, TB).

palindrome(L) :-
    reverse(L, R),
    same_list(L, R).
