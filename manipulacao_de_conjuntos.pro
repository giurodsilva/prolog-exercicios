lista_para_conjunto(Xs, Cs) :-
    lista_para_conjunto(Xs, [], Cs).
lista_para_conjunto([], _, []).
lista_para_conjunto([X|Xs], Ys, [X|Cs]) :-
    \+ member(X, Ys),
    lista_para_conjunto(Xs, [X|Ys], Cs).
lista_para_conjunto([X|Xs], Ys, Cs) :-
    member(X, Ys),
    lista_para_conjunto(Xs, Ys, Cs).

mesmo_conjunto(Cs, Ds) :-
    lista_para_conjunto(Cs, Cs1),
    permutation(Cs1, Ds),
    lista_para_conjunto(Ds, Ds1),
    msort(Cs1, Zs),
    msort(Ds1, Zs).

uniao_conjunto(Cs, Ds, Es) :-
    lista_para_conjunto(Cs, Xs),
    lista_para_conjunto(Ds, Ys),
    append(Xs, Ys, Zs),
    lista_para_conjunto(Zs, Es).

inter_conjunto([], _, []).
inter_conjunto([X|Cs], Ds, [X|Es]) :-
    member(X, Ds),
    inter_conjunto(Cs, Ds, Es).
inter_conjunto([X|Cs], Ds, Es) :-
    \+ member(X, Ds),
    inter_conjunto(Cs, Ds, Es).

diferenca_conjunto([], _, []).
diferenca_conjunto([X|Cs], Ds, [X|Es]) :-
    \+ member(X, Ds),
    diferenca_conjunto(Cs, Ds, Es).
diferenca_conjunto([X|Cs], Ds, Es) :-
    member(X, Ds),
    diferenca_conjunto(Cs, Ds, Es).

%%%%%%%% Fim dos predicados adicionados
%%%%%%%% Os testes começam aqui.
%%%%%%%% Para executar os testes, use a consulta:   ?- run_tests.

:- begin_tests(conjuntos).
test(lista_para_conjunto, all(Xs=[[1,a,3,4]]) ) :-
    lista_para_conjunto([1,a,3,3,a,1,4], Xs).
test(lista_para_conjunto2,fail) :-
    lista_para_conjunto([1,a,3,3,a,1,4], [a,1,3,4]).

test(mesmo_conjunto, set(Xs=[[1,a,3],[1,3,a],[a,1,3],[a,3,1],[3,a,1],[3,1,a]])) :-
    mesmo_conjunto([1,a,3], Xs).
test(uniao_conjunto2,fail) :-
    mesmo_conjunto([1,a,3,4], [1,3,4]).

test(uniao_conjunto, set(Ys==[[1,a,3],[1,3,a],[a,1,3],[a,3,1],[3,a,1],[3,1,a]])) :-
    uniao_conjunto([1,a], [a,3], Xs),
    mesmo_conjunto(Xs,Ys).
test(uniao_conjunto2,fail) :-
    uniao_conjunto([1,a,3,4], [1,2,3,4], [1,1,a,2,3,3,4,4]).

test(inter_conjunto, all(Xs==[[1,3,4]])) :-
    inter_conjunto([1,a,3,4], [1,2,3,4], Xs).
test(inter_conjunto2,fail) :-
    inter_conjunto([1,a,3,4], [1,2,3,4], [1,1,3,3,4,4]).

test(diferenca_conjunto, all(Xs==[[2]])) :-
    diferenca_conjunto([1,2,3], [3,a,1], Xs).
test(diferenca_conjunto2,fail) :-
    diferenca_conjunto([1,3,4], [1,2,3,4], [_|_]).

:- end_tests(conjuntos).
