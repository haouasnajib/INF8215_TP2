:- use_module(library(clpfd)). % Using CLPFD library

/* L'idée est d'avoir toutes les informations comme variables et de vérifier par la suite la valeur numérique de chacune,
 * la solution au problème sera de s'assurer que les valeurs concordent entre chaque variable souhaitée.
 */

probleme1(Anglais,Espagnol,Japonais,Serpent) :-
% Définition de la liste de toutes les variables, par ordre d'apparition.
P1VarList = [Anglais,MaisonRouge,
             Jaguar,Espagnol,
             Japonais,Escargot,
             MaisonBleue,
             Serpent],

% Domaine des variables.
P1VarList ins 1..3, % 3 types par famille.

% L’Anglais vit dans la maison rouge.
Anglais #= MaisonRouge,

% Le jaguar est l’animal de l’espagnol.
Jaguar #= Espagnol,

% Le Japonais vit à droite de la maison du possesseur de l’escargot, CONVENTION 1 à gauche, 3 à droite.
Japonais #= Escargot+1,

% Le possesseur de l’escargot vit à gauche de la maison bleue.
Escargot #= MaisonBleue-1,

% Contrainte supplémentaire : les variables en référence à une même famille d'objets doivent être toutes différentes.
all_different([Anglais,Espagnol,Japonais]),
all_different([MaisonRouge,MaisonBleue]),
all_different([Jaguar,Escargot,Serpent]),

% Résolution.
label(P1VarList), !. % “Assign a value to each variable in P1VarList.”

/**************************************************
 **************************************************
 **************************************************/

probleme2(Anglais,Espagnol,Ukrainien,Norvegien,Japonais,Eau,Zebre) :- 
% Définition de la liste de toutes les variables, par ordre d'apparition.
P2VarList = [Anglais,MaisonRouge,
             Espagnol,Chien,
             MaisonVerte,Cafe,
             Ukrainien,The,
             MaisonBlanche,
             Sculpteur,Escargots,
             Diplomate,MaisonJaune,
             Lait,
             Norvegien,
             Medecin,Renard,
             Cheval,
             Violoniste,Jus,
             Japonais,Acrobate,
             MaisonBleue,
             Zebre,Eau],

% Domaine des variables.
P2VarList ins 1..5, % 5 types par famille.

% L’Anglais habite la maison rouge.
Anglais #= MaisonRouge,

% L’Espagnol a un chien.
Espagnol #= Chien,

% Dans la maison verte, on boit du café.
MaisonVerte #= Cafe,

% L’Ukrainien boit du thé.
Ukrainien #= The,

% La maison verte est immédiatement à droite de la maison blanche, CONVENTION 1 à gauche, 5 à droite.
MaisonVerte #= MaisonBlanche+1,

% Le sculpteur élève des escargots.
Sculpteur #= Escargots,

% Le diplomate habite la maison jaune.
Diplomate #= MaisonJaune,

% Dans la maison du milieu, on boit du lait, CONVENTION 1 à gauche, 5 à droite.
Lait #= 3,

% Le Norvégien habite la première maison à gauche, CONVENTION 1 à gauche, 5 à droite.
Norvegien #= 1,

% Le médecin habite une maison voisine de celle où demeure le propriétaire du renard.
Medecin #= Renard-1 #\/ Medecin #= Renard+1,

% La maison du diplomate est à côté de celle où il y a un cheval.
Diplomate #= Cheval-1 #\/ Diplomate #= Cheval+1,

% Le violoniste boit du jus d’orange.
Violoniste #= Jus,

% Le Japonais est acrobate.
Japonais #= Acrobate,

% Le Norvégien habite à côté de la maison bleue.
Norvegien #= MaisonBleue-1 #\/ Norvegien #= MaisonBleue+1,

% Contrainte supplémentaire : les variables en référence à une même famille d'objets doivent être toutes différentes.
all_different([Anglais,Espagnol,Ukrainien,Norvegien,Japonais]), % Nationalité
all_different([MaisonRouge,MaisonVerte,MaisonBlanche,MaisonJaune,MaisonBleue]), % Maison
all_different([Chien,Escargots,Renard,Cheval,Zebre]), % Animal
all_different([Cafe,The,Lait,Jus,Eau]), % Boisson
all_different([Sculpteur,Diplomate,Medecin,Violoniste,Acrobate]), % Profession

% Résolution.
label(P2VarList), !. % “Assign a value to each variable in P2VarList.”