%1. Defina um predicado zeroInit(L) que é verdadeiro se L for uma lista que inicia com o número 0 (zero).

zeroInit(L) :- 
    L = [H|_],
    H =:= 0.

%2. Defina um predicado has5(L) que é verdadeiro se L for uma lista de 5 elementos.
% Resolva este exercício sem usar um predicado auxiliar.

has5(L) :-
    L = [_,_,_,_,_].

%3. Defina um predicado hasN(L,N) que é verdadeiro se L for uma lista de N elementos.

hasN(L,N):-
    length(L,N).

%4. Defina um predicado potN0(N,L), de forma que L seja uma lista de potências de 2, com expoentes de N a 0.

potN0(0,[1]).
potN0(N,L) :- 
    N > 0,
    X is 2^N,
    L = [X|T],
    N1 is N-1,
    potN0(N1,T).

%5. Defina um predicado zipmult(L1,L2,L3), de forma que cada elemento da lista L3 seja o produto dos elementos 
%de L1 e L2 na mesma posição do elemento de L3.

zipmult([],[],[]).
zipmult(L1,L2,L3) :-
    L1 = [H1|T1],
    L2 = [H2|T2],
    H is H1*H2,
    zipmult(T1,T2,T),
    L3 = [H|T].

%6. Defina um predicado potencias(N,L), de forma que L seja uma lista com as N primeiras potências de 2,
% sendo a primeira 2^0 e assim por diante.

potencias(N,L) :-
    potN0(N,L1),
    reverse(L1,L).

%7. Defina um predicado positivos(L1,L2),
% de forma que L2 seja uma lista só com os elementos positivos de L1.
    
positivos([],[]).
positivos([H|T],L2) :- 
    H > 0,
    L2 = [H|X],
    positivos(T,X);
    positivos(T,L2).

%8. Considere que L1 e L2 sejam permutações de uma lista de elementos distintos, sem repetições. 
%Sabendo disso, defina um predicado mesmaPosicao(A,L1,L2) para verificar 
%se um elemento A está na mesma posição nas listas L1 e L2.

mesmaPosicao(A,L1,L2) :-
    L1 = [H1|T1],
    L2 = [H2|T2],
    H1 = A,
    H2 = A;
    mesmaPosicao(A,T1,T2).

%10. Tem-se N azulejos 10cm x 10cm e, com eles, deve-se montar um conjunto
% de quadrados de modo a utilizar todos os azulejos dados, sem sobrepô-los.
%  Inicialmente, deve-se montar o maior quadrado possível; então, com os azulejos
%   que sobraram, deve-se montar o maior quadrado possível, e assim
%    sucessivamente.

azulejos(0,0).
azulejos(NA, NQ) :-
    NA > 0,
    N is floor(sqrt(NA)),
    X is NA - N*N,
    azulejos(X, Q),
    NQ is Q + 1.