masgrande(elefante,caballo).
masgrande(caballo,perro).
masgrande(perro,raton).
masgrande(raton,hormiga).

muchomasgrande(A,B):-masgrande(A,B).
muchomasgrande(A,B):-masgrande(A,X),muchomasgrande(X,B).
















