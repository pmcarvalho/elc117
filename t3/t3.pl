%1. Defina um predicado zeroInit(L) que � verdadeiro se L for uma lista que inicia com o n�mero 0 (zero).

zeroInit(L) :- 
    L = [H|_],
    H =:= 0.

