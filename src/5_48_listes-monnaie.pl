% Somme
sum(X,Y,R) :- R is X+Y.

% Max
max2(X,Y,M) :- X>=Y, M is X, !. % We're done here, don't evaluate any other predicates, don't backtrack.
max2(_,Y,Y).

% Max liste
max([A,B],M) :- max2(A,B,M), !.
max([U,V|T],M) :- max2(U,V,M1), max([M1|T],M).

% Somme liste
somme([A,B],S) :- sum(A,B,S), !.
somme([U,V|T],S) :- sum(U,V,S1), somme([S1|T],S).

% N-ème élément
nth(0,[R|_],R) :- !.
nth(N,[_|T],R) :- N>0, N1 is N-1, nth(N1,T,R).

% Zip
zip([A],[B],[[A,B]]) :- !.
zip([U|M],[V|N],R) :- R1=[U,V], zip(M,N,R2), R=[R1|R2].

% Enumération
enumerate(0,[]). % pas de cut, pour avoir la possibilité d'utiliser w pour afficher toute la liste
enumerate(N,L) :- N1 is N-1, enumerate(N1,L1), append(L1,[N1],L). % Using append/3

% Monnaie
rend_monnaie(Argent,Prix) :- (Argent-Prix)<(0.05), (Argent-Prix)>=0, !. % Aucune dénomination plus petite.
rend_monnaie(Argent,Prix) :- A1 is Argent+(0.001), R is (A1-Prix), R>=2,      M is floor(R/2),      N is A1-2*M,      (M==0;(write(M), write(' piece de 2'), nl)),    rend_monnaie(N,Prix), !.
rend_monnaie(Argent,Prix) :- A1 is Argent+(0.001), R is (A1-Prix), R>=1,      M is floor(R/1),      N is A1-M,        (M==0;(write(M), write(' piece de 1'), nl)),    rend_monnaie(N,Prix), !.
rend_monnaie(Argent,Prix) :- A1 is Argent+(0.001), R is (A1-Prix), R>=(0.50), M is floor(R/(0.50)), N is A1-(0.50)*M, (M==0;(write(M), write(' piece de 0.50'), nl)), rend_monnaie(N,Prix), !.
rend_monnaie(Argent,Prix) :- A1 is Argent+(0.001), R is (A1-Prix), R>=(0.25), M is floor(R/(0.25)), N is A1-(0.25)*M, (M==0;(write(M), write(' piece de 0.25'), nl)), rend_monnaie(N,Prix), !.
rend_monnaie(Argent,Prix) :- A1 is Argent+(0.001), R is (A1-Prix), R>=(0.10), M is floor(R/(0.10)), N is A1-(0.10)*M, (M==0;(write(M), write(' piece de 0.10'), nl)), rend_monnaie(N,Prix), !.
rend_monnaie(Argent,Prix) :- A1 is Argent+(0.001), R is (A1-Prix), R>=(0.05), M is floor(R/(0.05)), N is A1-(0.05)*M, (M==0;(write(M), write(' piece de 0.05'), nl)), rend_monnaie(N,Prix), !. 