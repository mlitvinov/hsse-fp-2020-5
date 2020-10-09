% определить предикаты:
	% and(A,B)
	% or(A, B)
	% xor(A, B)
	% not(A)
	% equ(A,B)
% ипользовать предикат truth_table(A,B, expression) для построения таблиц истинности, например:
% truth_table(A,B,and(A,or(A,B))).
% true true true
% true fail true
% fail true fail
% fail fail fail
and(A,B) :- A,B.
or(A,_) :- A.
or(_,B) :-B.
not(A) :- not(A).
equ(A,B) :- or(and(A,B), and(not(A),not(B))).
xor(A,B) :- not(equ(A,B)).
bind(true).
bind(fail).
expression(A,B,_) :- write(A), write('   '), write(B), write('   ').
expression(_,_,Expr) :- Expr, !, write(true), nl.
expression(_,_,_) :- write(fail), nl.

table(A,B,Expr) :- bind(A), bind(B), expression(A,B,Expr), fail.


