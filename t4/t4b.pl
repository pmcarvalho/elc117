% Rodoviária
% Exatamente sete ônibus chegam à Rodoviária Municipal aos sábados.
% Cada ônibus vem de uma cidade diferente: Quirino, Rochinha, Sampaio, Tombo,
% Vitória, Xexéu e Zacarias. As seguintes condições existem sobre suas chegadas:
%
% Os ônibus chegam um de cada vez.
% Ou o ônibus de Zacarias ou de Xexéu é o quarto a chegar.
% O ônibus de Sampaio chega em algum momento depois do de Xexéu mas antes do
% de Zacarias.
% Tanto o ônibus de Tombo como o de Vitória chegam em algum momento após o de 
% Rochinha.
% O ônibus de Tombo não é o próximo a chegar depois do ônibus de Vitória; 
% nem o ônibus de Vitória é o próximo a chegar depois do ônibus de Tombo.

regra1(Chegada) :-
    nth0(3, Chegada, zacarias);
    nth0(3, Chegada, xexeu).

regra2(Chegada) :-
    nth0(Ts, Chegada, sampaio),
    nth0(Tx, Chegada, xexeu),
    nth0(Tz, Chegada, zacarias),
    Ts > Tx,
    Ts < Tz.

regra3(Chegada) :-
    nth0(Tt, Chegada, tombo),
    nth0(Tv, Chegada, vitoria),
    nth0(Tr, Chegada, rochinha),
    Tt > Tr,
    Tv > Tr.

regra4(Chegada) :-
    nth0(Tt, Chegada, tombo),
    nth0(Tv, Chegada, vitoria),
    Dif is abs(Tt - Tv),
    Dif > 1.

membros(Chegada) :-
    member(quirino, Chegada),
    member(rochinha, Chegada),
    member(sampaio, Chegada),
    member(tombo, Chegada),
    member(vitoria, Chegada),
    member(xexeu, Chegada),
    member(zacarias, Chegada).

ordem(Chegada) :-
    Chegada = [_,_,_,_,_,_,_],
    membros(Chegada),
    regra1(Chegada),
    regra2(Chegada),
    regra3(Chegada),
    regra4(Chegada).

% Questão 1. Qual das seguintes alternativas é uma ordem em que os ônibus poderiam chegar, do primeiro para o último? 
%
% ?- ordem([rochinha,tombo,vitoria,xexeu,sampaio,zacarias,quirino]).
% ?- ordem([rochinha,xexeu,quirino,zacarias,tombo,sampaio,vitoria]).
% ?- ordem([rochinha,tombo,quirino,xexeu,sampaio,zacarias,vitoria]).
% ?- ordem([quirino,rochinha,xexeu,sampaio,vitoria,zacarias,tombo]).
% ?- ordem([tombo,rochinha,quirino,xexeu,sampaio,zacarias,vitoria]).