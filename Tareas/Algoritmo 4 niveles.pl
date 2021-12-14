hombre(juan).
vertebrado(perro).
servivo(animal).
mamifero(leon).

mamifero(X):- hombre(X).
vertebrado(M):- mamifero(M).
cordado(V):- vertebrado(V).
servivo(C):- cordado(C).
necesitaAlimento(S):- servivo(S).
