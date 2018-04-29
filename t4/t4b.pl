% Rodovi�ria
% Exatamente sete �nibus chegam � Rodovi�ria Municipal aos s�bados.
% Cada �nibus vem de uma cidade diferente: Quirino, Rochinha, Sampaio, Tombo,
% Vit�ria, Xex�u e Zacarias. As seguintes condi��es existem sobre suas chegadas:
%
% Os �nibus chegam um de cada vez.
% Ou o �nibus de Zacarias ou de Xex�u � o quarto a chegar.
% O �nibus de Sampaio chega em algum momento depois do de Xex�u mas antes do
% de Zacarias.
% Tanto o �nibus de Tombo como o de Vit�ria chegam em algum momento ap�s o de 
% Rochinha.
% O �nibus de Tombo n�o � o pr�ximo a chegar depois do �nibus de Vit�ria; 
% nem o �nibus de Vit�ria � o pr�ximo a chegar depois do �nibus de Tombo.

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

% Quest�o 1. Qual das seguintes alternativas � uma ordem em que os �nibus poderiam chegar, do primeiro para o �ltimo? 
%
% ?- ordem([rochinha,tombo,vitoria,xexeu,sampaio,zacarias,quirino]).
% ?- ordem([rochinha,xexeu,quirino,zacarias,tombo,sampaio,vitoria]).
% ?- ordem([rochinha,tombo,quirino,xexeu,sampaio,zacarias,vitoria]).
% ?- ordem([quirino,rochinha,xexeu,sampaio,vitoria,zacarias,tombo]).
% ?- ordem([tombo,rochinha,quirino,xexeu,sampaio,zacarias,vitoria]).