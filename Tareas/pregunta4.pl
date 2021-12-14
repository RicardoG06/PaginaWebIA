paraderoanterior(chosica, chaclacayo).
paraderoanterior(chaclacayo, santaclara).
paraderoanterior(santaclara, ate).
paraderoanterior(ate, santaanita).
paraderoanterior(santaanita, evitamiento).
paraderoanterior(evitamiento, arriola).
paraderoanterior(arriola, grau).
paraderoanterior(grau, arica).
paraderoanterior(arica, venezuela).
paraderoanterior(venezuela, unmsm).
hombre(bob).
hombre(carlos).
hombre(diego).
hombre(humberto).
mujer(alicia).
mujer(eliana).
mujer(fernanda).
mujer(gisela).
sube(alicia, santaclara).
sube(bob, evitamiento).
sube(carlos, grau).
sube(diego, venezuela).
sube(eliana, ate).
sube(fernanda, santaanita).
sube(gisela, chosica).
sube(humberto, arriola).
baja(alicia, evitamiento).
baja(bob, venezuela).
baja(diego, unmsm).
baja(carlos, arica).
baja(eliana, grau).
baja(fernanda, arica).
baja(gisela, unsmsm).
baja(humberto, grau).
paraderoposterior(X,Y):-paraderoanterior(Y,X).

antesde(X,Y):-paraderoanterior(X,Y).
antesde(X,Y):-paraderoanterior(X,A),antesde(A,Y).

despuesde(X,Y):-paraderoposterior(X,Y).
despuesde(X,Y):-paraderoposterior(X,A),despuesde(A,Y).

subeentre(X,Y,Z):-subedespuesde(X,Y),subeantesde(X,Z).
subeantesde(X,Y):-sube(X,Z),antesde(Z,Y).
subedespuesde(X,Y):-sube(X,Z),despuesde(Z,Y).

bajaentre(X,Y,Z):-bajadespuesde(X,Y),bajaantesde(X,Z).
bajaantesde(X,Y):-baja(X,Z),antesde(Z,Y).
bajadespuesde(X,Y):-baja(X,Z),despuesde(Z,Y).


mujersubeantesde(X,Y):-mujer(X),subeantesde(X,Y).
mujerbajaantesde(X,Y):-mujer(X),bajaantesde(X,Y).





















