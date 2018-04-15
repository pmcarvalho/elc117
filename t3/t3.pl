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