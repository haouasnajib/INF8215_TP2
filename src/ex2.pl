% Somme
sum(X,Y,R) :- R is X+Y.

% Max
max2(X,Y,M) :- X>=Y, M is X, !. % We're done here, don't evaluate any other predicates, don't backtrack.
max2(X,Y,M) :- M is Y.
max2(X,Y,Z,M) :- (Z=<X;Z=<Y), max2(X,Y,M), !.
max2(X,Y,Z,M) :- M is Z.

% Dérivée
d(F,X,G) :- atomic(F), F\=X, G is 0, !. % Constante

d(F,X,G) :- F==X, G is 1, !. % Monôme degré 1, coef 1
d(F,X,G) :- F=A*X, atomic(A), G is A, !. % Monôme degré 1, quelconque

d(F,X,G) :- F=X^2, G=2*X, !. % Monôme degré 2, coef 1
d(F,X,G) :- F=A*X^2, atomic(A), T is (A*2), G=T*X, !. % Monôme degré 2, quelconque

d(F,X,G) :- F=X^B, atomic(B), U is (B-1), G=X^U, !. % Monôme degré quelconque, coef 1
d(F,X,G) :- F=A*X^B, atomic(A), atomic(B), T is (A*B), U is (B-1), G=T*X^U, !. % Monôme degré quelconque, coef quelconque

d(F,X,G) :- F=A+B, atomic(B), d(A,X,G), !. % Appel récursif pour polynôme, deuxième terme = constante
d(F,X,G) :- F=A+B, atomic(A), d(B,X,G), !. % Appel récursif pour polynôme, premier terme = constante
d(F,X,G) :- F=A+B, d(A,X,U), d(B,X,V), G=U+V, !. % Appel récursif pour polynôme