% CD Independente
% Uma banda formada por alunos e alunas da escola está gravando um CD com exatamente sete músicas
% distintas – S, T, V, W, X, Y e Z. Cada música ocupa exatamente uma das sete faixas contidas no
% CD. Algumas das músicas são sucessos antigos de rock; outras são composições da própria banda. As
% seguintes restrições devem ser obedecidas:

% 1 - S ocupa a quarta faixa do CD.
% 2 - Tanto W como Y precedem S no CD (ou seja, W e Y estão numa faixa que é tocada antes de S no CD).
% 3 - T precede W no CD (ou seja, T está numa faixa que á tocada antes de W).
% 4 - Um sucesso de rock ocupa a sexta faixa do CD.
% 5 - Cada sucesso de rock é imediatamente precedido no CD por uma composição da banda
% 6 - Z é um sucesso de rock.

regra1(CD) :-
    nth0(3, CD, musica(s,_)).

regra2(CD) :-
    nth0(Iw, CD, musica(w,_)),
    nth0(Iy, CD, musica(y,_)),
    Iw<3,
    Iy<3.

regra3(CD) :-
    nth0(Iw, CD, musica(w,_)),
    nth0(It, CD, musica(t,_)),
    It<Iw.

regra4(CD) :-
    nth0(5, CD, musica(_,sucesso)).

regra5(CD) :-
    CD = [musica(_,original),musica(_,original),musica(_,original),musica(_,original),musica(_,original),_,musica(_,original)];
    CD = [musica(_,original),musica(_,sucesso),musica(_,original),musica(_,original),musica(_,original),_,musica(_,original)];
    CD = [musica(_,original),musica(_,original),musica(_,sucesso),musica(_,original),musica(_,original),_,musica(_,original)];
    CD = [musica(_,original),musica(_,original),musica(_,original),musica(_,sucesso),musica(_,original),_,musica(_,original)];
    CD = [musica(_,original),musica(_,sucesso),musica(_,original),musica(_,sucesso),musica(_,original),_,musica(_,original)].

regra6(CD) :-
    member(musica(z,sucesso), CD).

membros(CD) :-
    member(musica(s,_), CD),
    member(musica(t,_), CD),
    member(musica(v,_), CD),
    member(musica(w,_), CD),
    member(musica(x,_), CD),
    member(musica(y,_), CD),
    member(musica(z,_), CD).

cdindependente(CD) :-
    CD = [_,_,_,_,_,_,_],
    membros(CD),
    regra1(CD),
    regra2(CD),
    regra3(CD),
    regra4(CD),
    regra5(CD),
    regra6(CD).
    

% Questão 11. Qual das seguintes alternativas poderia
% ser a ordem das músicas no CD, da primeira
% para a sétima faixa?
%
% ?- cdindependente([musica(t,_),musica(w,_),musica(v,_),musica(s,_),musica(y,_),musica(x,_),musica(z,_)]).
% ?- cdindependente([musica(v,_),musica(y,_),musica(t,_),musica(s,_),musica(w,_),musica(z,_),musica(x,_)]).
% ?- cdindependente([musica(x,_),musica(y,_),musica(w,_),musica(s,_),musica(t,_),musica(z,_),musica(s,_)]).
% ?- cdindependente([musica(y,_),musica(t,_),musica(w,_),musica(s,_),musica(x,_),musica(z,_),musica(v,_)]).
% ?- cdindependente([musica(z,_),musica(t,_),musica(x,_),musica(w,_),musica(v,_),musica(y,_),musica(s,_)]).