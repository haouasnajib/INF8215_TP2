homme(hugo).
homme(loic).
homme(gabriel).
homme(maxime).
homme(mathieu).
homme(alexis).
femme(catherine).
femme(justine).
femme(lea).
femme(alice).
femme(rose).
femme(emma).
% Hugo et Catherine
parent(hugo,lea).
parent(hugo,gabriel).
parent(catherine,lea).
parent(catherine,gabriel).
% Loic et Justine
parent(loic,alice).
parent(loic,maxime).
parent(loic,mathieu).
parent(justine,alice).
parent(justine,maxime).
parent(justine,mathieu).
% Gabriel et Alice
parent(gabriel,alexis).
parent(gabriel,rose).
parent(gabriel,emma).
parent(alice,alexis).
parent(alice,rose).
parent(alice,emma).
% Regles
enfant(X,Y) :- parent(Y,X).
fille(X,Y) :- enfant(X,Y),femme(X).
fils(X,Y) :- enfant(X,Y),homme(X).
mere(X,Y) :- parent(X,Y),femme(X).
pere(X,Y) :- parent(X,Y),homme(X).
oncle(X,Y) :- frere(X,Z),parent(Z,Y).
tante(X,Y) :- soeur(X,Z),parent(Z,Y).
grand_parent(X,Y) :- parent(X,Z),parent(Z,Y).
grand_mere(X,Y) :- mere(X,Z),parent(Z,Y).
grand_pere(X,Y) :- pere(X,Z),parent(Z,Y).
petit_enfant(X,Y) :- grand_parent(Y,X).
petite_fille(X,Y) :- petit_enfant(X,Y),femme(X).
petit_fils(X,Y) :- petit_enfant(X,Y),homme(X).
niece(X,Y) :- (oncle(Y,X);tante(Y,X)),femme(X).
neveu(X,Y) :- (oncle(Y,X);tante(Y,X)),homme(X).
frere(X,Y) :- parent(Z,X),parent(Z,Y),X \== Y,homme(X),homme(Z). % parent vient deux fois et rien ne dit que X et Y doivent être différent. On a aussi deux parents, so on choisit juste le mec
soeur(X,Y) :- parent(Z,X),parent(Z,Y),X \== Y,femme(X),homme(Z).
