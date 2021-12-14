hombre(felix).
hombre(mario).
hombre(paolo).
hombre(daniel).
hombre(juan).
hombre(pedro).
hombre(miguel).
hombre(luis).
hombre(leonardo).

mujer(diana).
mujer(monica).
mujer(julia).
mujer(maribel).

progenitor(felix,mario).
progenitor(felix,paolo).
progenitor(mario,daniel).
progenitor(mario,juan).
progenitor(mario,diana).
progenitor(paolo,monica).
progenitor(daniel,pedro).
progenitor(daniel,miguel).
progenitor(juan,luis).
progenitor(juan,julia).
progenitor(monica,leonardo).
progenitor(monica,maribel).

padre(X,Y):-progenitor(X,Y),hombre(X).
madre(X,Y):-progenitor(X,Y),mujer(X).

% Abuelos
abuelos(X,Y):-progenitor(X,Z),progenitor(Z,Y).
abuelo(X,Y):-abuelos(X,Y),hombre(X).
abuela(X,Y):-abuelos(X,Y),mujer(X).

% Hermanos
hermanos(X,Y):-progenitor(Z,X),progenitor(Z,Y),not(X==Y).

% Sobrinos
sobrinos(X,Y):-hermanos(X,Z),progenitor(Z,Y).
sobrino(X,Y):-sobrinos(X,Y),hombre(Y).
sobrina(X,Y):-sobrinos(X,Y),mujer(Y).

% Bisabuelos
%bisabuelos(X,Y):-progenitor(X,Z),abuelos(Z,Y).
bisabuelos(X,Y):-progenitor(X,A),progenitor(A,B),progenitor(B,Y).

% Descendientes
descendientes(X,Y):-progenitor(X,Y).
descendientes(X,Y):-progenitor(X,Z), descendientes(Z,Y).

% Nietos
nietos(X,Y):-abuelos(Y,X).
nieto(X,Y):-abuelos(Y,X),hombre(X).
nieta(X,Y):-abuelos(Y,X),mujer(X).

% ---CONTADORES---

% SOBRINOS

% Cantidad de sobrinos (hombres y mujeres)
lista_sobrinos(X,Y):-findall(Z,sobrinos(X,Z),Y).
cantidad_sobrinos(X,Y):-lista_sobrinos(X,Z),length(Z,Y).

% Cantidad de sobrinos (hombres)
lista_sobrino(X,Y):-findall(Z,sobrino(X,Z),Y).
cantidad_sobrino(X,Y):-lista_sobrino(X,Z),length(Z,Y).

% Cantidad de sobrinas (mujeres)
lista_sobrina(X,Y):-findall(Z,sobrina(X,Z),Y).
cantidad_sobrina(X,Y):-lista_sobrina(X,Z),length(Z,Y).

% DESCENDIENTES

% Cantidad de total de descendientes
lista_descendientes(X,Y):-findall(Z,descendientes(X,Z),Y).
cantidad_descendientes(X,Y):-lista_descendientes(X,Z),length(Z,Y).

% HERMANOS

% Cantidad de hermanos
lista_hermanos(X,Y):-findall(Z,hermanos(X,Z),Y).
cantidad_hermanos(X,Y):-lista_hermanos(X,Z),length(Z,Y).

% NIETOS

% Cantidad de nietos (hombres y mujeres)
lista_nietos(X,Y):-findall(Z,nietos(Z,Y),X).
cantidad_nietos(X,Y):-lista_nietos(Z,Y),length(Z,X).

% Cantidad de nietos (hombres)
lista_nieto(X,Y):-findall(Z,nieto(Z,Y),X).
cantidad_nieto(X,Y):-lista_nieto(Z,Y),length(Z,X).

% Cantidad de nietas (mujeres)
lista_nieta(X,Y):-findall(Z,nieta(Z,Y),X).
cantidad_nieta(X,Y):-lista_nieta(Z,Y),length(Z,X).

% ---PORCENTAJES---

% SOBRINOS

% Porcentaje de sobrinos (hombres)
porcentaje_sobrino(X,Y):-cantidad_sobrinos(X,W),
			cantidad_sobrino(X,Z),
			Y is Z/W.

% Porcentaje de sobrinas (hombres)
porcentaje_sobrina(X,Y):-cantidad_sobrinos(X,W),
			cantidad_sobrina(X,Z),
			Y is Z/W.

		