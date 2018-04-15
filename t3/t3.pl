%1. Defina um predicado zeroInit(L) que � verdadeiro se L for uma lista que inicia com o n�mero 0 (zero).

zeroInit(L) :- 
    L = [H|_],
    H =:= 0.

%2. Defina um predicado has5(L) que � verdadeiro se L for uma lista de 5 elementos.
% Resolva este exerc�cio sem usar um predicado auxiliar.

has5(L) :-
    L = [_,_,_,_,_].

%3. Defina um predicado hasN(L,N) que � verdadeiro se L for uma lista de N elementos.

hasN(L,N):-
    length(L,N).