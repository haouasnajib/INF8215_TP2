% Somme
sum(X,Y,R) :- R is X+Y.

% Max
max2(X,Y,X) :- X>=Y, !. % We're done here, don't evaluate any other predicates, don't backtrack.
max2(_,Y,Y).
max2(X,Y,Z,M) :- (Z=<X;Z=<Y), max2(X,Y,M), !.
max2(_,_,Z,Z).

% Dérivée
d(F,X,0) :- atomic(F), F\==X, !. % Constante

d(F,X,1) :- F==X, !. % Monôme degré 1, coef 1
d(F,X,G) :- F=A*X, atomic(A), G is A, !. % Monôme degré 1, quelconque

d(F,X,G) :- F=X^2, G=2*X, !. % Monôme degré 2, coef 1
d(F,X,G) :- F=A*X^2, atomic(A), T is (A*2), G=T*X, !. % Monôme degré 2, quelconque

d(F,X,G) :- F=X^B, atomic(B), U is (B-1), G=B*X^U, !. % Monôme degré quelconque, coef 1
d(F,X,G) :- F=A*X^B, atomic(A), atomic(B), T is (A*B), U is (B-1), G=T*X^U, !. % Monôme degré quelconque, coef quelconque

d(F,X,G) :- F=A+B, B\==X, ((B\=X^_,B\=_*X,B\=_*X^_,B\=_+_);atomic(B)), d(A,X,G), !. % Appel récursif pour polynôme, deuxième terme = constante ou non reconnu selon la var de dériv
d(F,X,G) :- F=A+B, A\==X, ((A\=X^_,A\=_*X,A\=_*X^_,A\=_+_);atomic(A)), d(B,X,G), !. % Appel récursif pour polynôme, premier terme = constante ou non reconnu selon la var de dériv
d(F,X,G) :- F=A+B, d(A,X,U), d(B,X,V), G=U+V, !. % Appel récursif pour polynôme

d(_,_,0). % Monome non reconnu.