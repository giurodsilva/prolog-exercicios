%%%%% Insira aqui os seus predicados.
%%%%% Use quantos predicados auxiliares julgar necessário

%sentenca(...) --> ...

sentenca(s(SN, SV)) -->
	sintagma_nominal(SN),
	sintagma_verbal(SV).
	
sintagma_nominal(sn(D, N, Gen, Num)) -->
    determinante(d(D, Gen, Num)),
    nome(n(N, Gen, _)).

sintagma_verbal(sv(V, SN)) -->
    verbo_transitivo(V),
    sintagma_nominal(SN).

nome(n(N, Gen, Num))--> [N], {nome(N, Gen, Num)}.
nome(cara, m, _).
nome(mina, f, _).
nome(caras, m, _).
nome(minas, f, _).
nome(gente, _, _).

determinante(d(D, Gen, Num))--> [D], {det(D, Gen, Num)}.
det(a, f, s).
det(o, m, s).
det(as, f, p).
det(os, m, p).

verbo_transitivo(vt(V, Num)) --> [V], {vt(V, Num)}.
vt(encaro, s).


%%%%%%%% Fim dos predicados adicionados
%%%%%%%% Os testes começam aqui.
%%%%%%%% Para executar os testes, use a consulta:   ?- run_tests.

%%%%%%%%% Help %%%%%%%%%
gramatical( S ) :-
    sentenca( A, S, [] ),
    imprime_arvore(A),
    !.  % evita warnings do tipo: Test succeeded with choicepoint

imprime_arvore( A ) :-
	imprime_arvore( A, 0 ).

imprime_arvore( A, N ) :-
    var( A ),
    tab( N ),
	write( A ),
	nl.
imprime_arvore( A, N ) :-
	A =.. [ X | As ],
	tab( N ),
	write( X ),
	nl,
	N1 is N+2,
	imprime_lista( As, N1 ).

imprime_lista( [], _ ).
imprime_lista( [ A | As ], N ) :-
	imprime_arvore( A, N ),
	imprime_lista( As, N ).



%%%%%%%%  Tests %%%%%%%%%%

:- begin_tests(sentencas).
test(gramatica1, true ) :-
    gramatical([as, mina, encaro, os, cara]).
test(gramatica2, true ) :-
    gramatical([o,cara,encaro,as,mina]).
test(gramatica2, true ) :-
    gramatical([o,cara,encaro,a,mina]).

test(rejeita1, fail ) :-
    gramatical([os,caras, encararam, as, minas]).
test(rejeita2, fail ) :-
    gramatical([os,mina, encaro, os, cara]).
test(rejeita3, fail ) :-
    gramatical([a,mina,encaro,as, cara]).

:- end_tests(sentencas).
