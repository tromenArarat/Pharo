"
El hormiguero es el único lugar donde las hormigas comen una unidad de comida por turno.
"
Class {
	#name : #Hormiguero,
	#superclass : #Object,
	#instVars : [
		'color',
		'reina',
		'ubicacion',
		'alimento'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #accessing }
Hormiguero >> alimento [

	^ alimento
]

{ #category : #accessing }
Hormiguero >> alimento: anObject [

	alimento := anObject
]

{ #category : #calculating }
Hormiguero >> bocasAlimentar [

	| exploradorasEnHormiguero obrerasEnHormiguero guardianasEnHormiguero |
	exploradorasEnHormiguero := 0.
	obrerasEnHormiguero := 0.
	guardianasEnHormiguero := 0.

	self reina colExploradoras do: [ :exploradora | 
		exploradora ubicacion = self ubicacion ifTrue: [ 
			exploradorasEnHormiguero := exploradorasEnHormiguero + 1 ] ].

	self reina colObreras do: [ :obrera | 
		obrera ubicacion = self ubicacion ifTrue: [ 
			obrerasEnHormiguero := obrerasEnHormiguero + 1 ] ].

	self reina colGuardianas do: [ :guardiana | 
		guardiana ubicacion = self ubicacion ifTrue: [ 
			obrerasEnHormiguero := guardianasEnHormiguero + 1 ] ].


	^ 1 + exploradorasEnHormiguero + obrerasEnHormiguero + guardianasEnHormiguero
]

{ #category : #accessing }
Hormiguero >> color [

	^ color
]

{ #category : #accessing }
Hormiguero >> color: anObject [

	color := anObject
]

{ #category : #random }
Hormiguero >> colorAleatorio [

	^ #('rojo' 'negro') atRandom
]

{ #category : #reducing }
Hormiguero >> darAlimento [

| comensales |

comensales := self bocasAlimentar .

	self alimento: self alimento 
]

{ #category : #initialize }
Hormiguero >> inicializarColor: unColor ubicacion: unaUbicacion [

	| njingaMbandi |
	njingaMbandi := Reina new
		                inicializarUbicacion: unaUbicacion;
		                comidaMaxima: 3;
		semillero: self inicializarSemillero ;
		                colContingencias: OrderedCollection new.

	self color: unColor.
	self ubicacion: unaUbicacion.
	self reina: njingaMbandi.

	njingaMbandi inicializarExploradora.
	njingaMbandi inicializarObrera.
	njingaMbandi inicializarGuardiana
]

{ #category : #initialize }
Hormiguero >> inicializarSemillero [

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
		add: nil .
		
^ crias .
]

{ #category : #accessing }
Hormiguero >> reina [

	^ reina
]

{ #category : #accessing }
Hormiguero >> reina: anObject [

	reina := anObject
]

{ #category : #accessing }
Hormiguero >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Hormiguero >> ubicacion: anObject [

	ubicacion := anObject
]
