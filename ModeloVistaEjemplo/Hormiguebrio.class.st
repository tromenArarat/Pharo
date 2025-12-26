Class {
	#name : #Hormiguebrio,
	#superclass : #Object,
	#instVars : [
		'color',
		'reina',
		'ubicacion',
		'alimento'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #accessing }
Hormiguebrio >> alimento [

	^ alimento
]

{ #category : #accessing }
Hormiguebrio >> alimento: anObject [

	alimento := anObject
]

{ #category : #accessing }
Hormiguebrio >> color [

	^ color
]

{ #category : #accessing }
Hormiguebrio >> color: anObject [

	color := anObject
]

{ #category : #initialize }
Hormiguebrio >> inicializarColor: unColor ubicacion: unaUbicacion [

	| njingaMbandi |
	njingaMbandi := Reina new
		                inicializarUbicacion: unaUbicacion;
		                comidaMaxima: 3;
		                semillero: self inicializarSemillero;
		                colContingencias: OrderedCollection new.

	self color: unColor.
	self ubicacion: unaUbicacion.
	self reina: njingaMbandi.

	njingaMbandi inicializarExploradora.
	njingaMbandi inicializarObrera.
	njingaMbandi inicializarGuardiana
]

{ #category : #initialize }
Hormiguebrio >> inicializarSemillero [

	| crias margaretMead mujerKurda lucyParsons |
	margaretMead := Exploradora new
		                ubicacion: self ubicacion;
		                colMensajes: OrderedCollection new;
		                estado: 'explorando'.

	mujerKurda := Guardiana new ubicacion: self ubicacion.

	lucyParsons := Obrera new
		               ubicacion: self ubicacion;
		               mochila: 0.

	crias := OrderedCollection new.
	crias
		add: margaretMead;
		add: lucyParsons;
		add: mujerKurda;
		add: nil;
		add: mujerKurda;
		add: lucyParsons;
		add: margaretMead;
		add: lucyParsons;
		add: mujerKurda;
		add: nil.

	^ crias
]

{ #category : #accessing }
Hormiguebrio >> reina [

	^ reina
]

{ #category : #accessing }
Hormiguebrio >> reina: anObject [

	reina := anObject
]

{ #category : #accessing }
Hormiguebrio >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Hormiguebrio >> ubicacion: anObject [

	ubicacion := anObject
]
