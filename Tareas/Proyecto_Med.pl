%declaracion de librerias para la interfaz

:-use_module(library(pce)).
:-use_module(library(pce_style_item)).

% metodo principal para iniciar la interfaz grafica, declaracion de
% botones, labels, y la pocicion en pantalla.
inicio:-
	new(Menu, dialog('Proyecto_Med', size(1000,800))),
	new(L,label(nombre,'SISTEMA DE DIAGN�STICO M�DICO')),
	new(@texto,label(nombre,'responde un breve cuestionario para su diagnostico')),
	new(@respl,label(nombre,'')),
	new(Salir,button('SALIR',and(message(Menu, destroy),message(Menu,free)))),
	new(@boton,button('Iniciar Test',message(@prolog,botones))),


	send(Menu,append(L)),new(@btncarrera,button('Diagnostico?')),
	send(Menu,display,L,point(125,20)),
	%send(Menu,display,A,point(80,360)),
	send(Menu,display,@boton,point(100,150)),
	send(Menu,display,@texto,point(20,100)),
	send(Menu,display,Salir,point(20,400)),
	send(Menu,display,@respl,point(20,130)),
	send(Menu,open_centered).

%enfermedad que presenta y tratamiento de acuerdo a las reglas de diagnostico

fallas('USTED PADECE PAPERAS:
	TRATAMIENTO:
 Aplicar compresas fr�as o calientes en la zona del cuello.
Tomar paracetamol (Tylenol) para aliviar el dolor. (No le d� �cido acetilsalic�lico
a los ni�os con una enfermedad viral debido al riesgo del s�ndrome de Reye).
Tomar l�quidos adicionales.
Comer alimentos blandos.
Hacer g�rgaras con agua tibia con sal.
'):-paperas,!.

fallas('USTED PADECE VARICELA:
       TRATAMIENTO:
lociones para aliviar la picaz�n, paracetamol para la fiebre y el f�rmaco antiv�rico
aciclovir.  el aciclovir reduce el n�mero de d�as de fiebre de la varicela en ni�os
sin otra enfermedad,'):-varicela,!.

fallas('USTED PADECE SARAMPION:
TRATAMIENTO:
El descanso y el aislamiento junto con el tratamiento de s�ntomas se pueden emprender
para permitir el paso del episodio lejos en sus los propio. cremas hidratantes Locales
de la piel se prescriben en caso de la erupci�n que pica. '):-sarampion,!.

fallas('USTED PADECE ANEMIA:
TRATAMIENTO:
Tratamiento para detener el sangrado. Si la p�rdida de sangre est� causando
anemia por deficiencia de hierro, el tratamiento depender� de la causa del sangrado.
Por ejemplo, si usted tiene una �lcera sangrante,
el m�dico puede recetarle antibi�ticos y otras medicinas para tratar la �lcera.
	 '):-anemia,!.

fallas('USTED PADECE RESFRIADO:
TRATAMIENTO:
El tratamiento de los s�ntomas no har� desaparecer el resfriado,
pero le ayudar� a sentirse mejor.
Los antibi�ticos casi nunca se necesitan para tratar un resfriado com�n.
El paracetamol (Tylenol) y el ibuprofeno (Advil, Motrin) ayudan a disminuir
la fiebre y aliviar los dolores musculares.
         '):-resfriado,!.

fallas('USTED PADECE INFLUENZA:
TRATAMIENTO:
Se recomiendan tres medicamentos antivirales para la influenza aprobados por
la Administraci�n de Alimentos y Medicamentos de EE. UU. (FDA) para usar en
los Estados Unidos durante la temporada de influenza 2015-2016: oseltamivir
(Tamiflu�) por v�a oral, zanamivir (Relenza�) para inhalar y peramivir
(Rapivab�) por v�a intravenosa. Estos medicamentos son antivirales qu�micamente
relacionados, conocidos como inhibidores de neuraminidasa que act�an contra los
virus de la influenza A y B.
         '):-influenza,!.

fallas('USTED PADECE HEPATITIS B:
TRATAMIENTO:
Actualmente disponemos del interfer�n alfa en forma pegilada denominada Peg-IFN,
f�rmaco que estimula la inmunidad y que act�a sobre el sistema inmunol�gico para
que �ste elimine las c�lulas hep�ticas infectadas. Tambi�n podemos utilizar dos
tipos de sustancias antivirales: los an�logos de los nucle�sidos a los que
pertenecen lamivudina, telbivudina y entecavir y los an�logos del nucle�tidos
como son adefovir y tenofovir.
         '):-hepatitisb,!.

fallas('USTED PADECE HEPATITIS C:
TRATAMIENTO:
El tratamiento de la hepatitis C se basa en medicamentos antivirales.
El tratamiento indicado es la combinaci�n de dos medicamentos,
el interfer�n alfa y la ribavirina y, actualmente, se emplea una nueva
formulaci�n del interfer�n alfa, el interfer�n alfa pegilado,
cuya eficacia en combinaci�n con ribavirina es a�n mayor.
'):-hepatitisc,!.

fallas('sin resultados, usted no dio la informacion necesaria o suficiente
ERROR p560c4!').

% preguntas para dirigir a la enfermedad adecuada con su respectivo
% identificador de enfermedad

paperas:- spaperas,
	pregunta('tienes fiebre?'),
	pregunta('tienes perdida de apetito'),
	pregunta('tienes dolor de oido?');
	pregunta('tienes dificultad para hablar?');
	pregunta('tienes dificultad para masticar?');
        pregunta('tienes dolor de cabeza? ').

varicela:- svaricela,
        pregunta('tienes fiebre? '),
	pregunta('tienes dolor de cabeza?'),
	pregunta('tienes cansancio');
	pregunta('tienes p�rdida de apetito?').

sarampion:- ssarampion,
	pregunta('tienes tos?'),
        pregunta('tienes moqueo?');
	pregunta('tienes puntos blancos en la boca?');
	pregunta('tienes fiebre?').

anemia:- sanemia,
	pregunta('tienes dolor de cabeza?'),
	pregunta('tienes palidez?');
	pregunta('tienes dolor en pecho?');
	pregunta('tienes frio en manos y pies? ');
        pregunta('tienes mareo?').

resfriado:- sresfriado,
	pregunta('tienes dolor de garganta?'),
	pregunta('tienes escalofrios?'),
	pregunta('tienes fiebre?'),
	pregunta('tienes dificultad para tragar?');
	pregunta('tienes cansancio? ').

influenza:- sinfluenza,
	pregunta('tienes fiebre?'),
	pregunta('tienes escalofrios?'),
	pregunta('tienes tos'),
	pregunta('tienes dolor de garganta? '),
	pregunta('tienes moqueo?'),
	pregunta('tienes dolor muscular?');
	pregunta('tienes diarrea?').

hepatitisb:- shepatitisb,
	pregunta('tienes coloracion amarillenta?'),
	pregunta('tienes orina oscura?'),
	pregunta('tienes cansancio'),
	pregunta('tienes vomito? '),
	pregunta('tienes dolor abdominal?');
	pregunta('tienes diarrea?').

hepatitisc:- shepatitisc,
	pregunta('tienes cansancio?'),
	pregunta('tienes coloracion amarilenta?'),
	pregunta('tienes perdida de apetito'),
	pregunta('tienes heces blanquecinas?');
	pregunta('tienes picores generalizados');
	pregunta('tienes alteraciones en coagulacion');
	pregunta('tienes hinchazon en piernas y abdomen?');
	pregunta('tienes orina oscura? ').

%identificador de falla que dirige a las preguntas correspondientes

spaperas:-pregunta('malestar general?'),!.
svaricela:-pregunta('tienes erupciones en la piel?'),!.
ssarampion:-pregunta('tienes ojos llorosos?'),!.
sanemia:-pregunta('tienes dificultad para respirar?'),!.
sresfriado:-pregunta('area blanca o grisacea en parte posterior de garganta?'),!.
sinfluenza:-pregunta('tienes dolor muscular?'),!.
shepatitisb:-pregunta('tienes nauseas?'),!.
shepatitisc:-pregunta('tienes hematomas?'),!.

% proceso del diagnostico basado en preguntas de si y no, cuando el
% usuario dice si, se pasa a la siguiente pregunta del mismo ramo, si
% dice que no se pasa a la pregunta del siguiente ramo


:-dynamic si/1,no/1.
preguntar(Problema):- new(Di,dialog('Diagnostico medico')),
     new(L2,label(texto,'Responde las siguientes preguntas')),
     new(La,label(prob,Problema)),
     new(B1,button(si,and(message(Di,return,si)))),
     new(B2,button(no,and(message(Di,return,no)))),

         send(Di,append(L2)),
	 send(Di,append(La)),
	 send(Di,append(B1)),
	 send(Di,append(B2)),

	 send(Di,default_button,si),
	 send(Di,open_centered),get(Di,confirm,Answer),
	 write(Answer),send(Di,destroy),
	 ((Answer==si)->assert(si(Problema));
	 assert(no(Problema)),fail).

% cada vez que se conteste una pregunta la pantalla se limpia para
% volver a preguntar

pregunta(S):-(si(S)->true; (no(S)->fail; preguntar(S))).
limpiar :- retract(si(_)),fail.
limpiar :- retract(no(_)),fail.
limpiar.

% proceso de eleccion de acuerdo al diagnostico basado en las preguntas
% anteriores

botones :- lim,
	send(@boton,free),
	send(@btncarrera,free),
	fallas(Falla),
	send(@texto,selection(' ')),
	send(@respl,selection(Falla)),
	new(@boton,button('inicia procedimiento mecanico',message(@prolog,botones))),
        send(Menu,display,@boton,point(40,50)),
        send(Menu,display,@btncarrera,point(20,50)),
limpiar.
lim :- send(@respl, selection('')).
