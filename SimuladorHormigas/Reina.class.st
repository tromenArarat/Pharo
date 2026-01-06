"
Esta hormiga tiene por tarea dar a luz a otras hormigas, con el objetivo de hacer crecer la población.

Existe una sola reina por hormiguero y nunca sale de éste.

La reina come todos los días una unidad de comida y al llegar a COMIDA_MAXIMA_REINA da a luz a
una hormiga nueva que se incorpora inmediatamente a sus labores en la colonia.

El tipo de hormiga que nace es aleatorio y diversos estudios coinciden en que la distribución de
probabilidades es la siguiente:

Obreras: 30%
Exploradoras: 20%
Guardianas: 30%
Nacimiento fallido: 20% (no nace ninguna hormiga)
"
Class {
	#name : 'Reina',
	#superclass : 'Hormiga',
	#instVars : [
		'colExploradoras',
		'colGuardianas',
		'colObreras',
		'comidaMaxima',
		'colContingencias',
		'semillero'
	],
	#category : 'SimuladorHormigas-Base',
	#package : 'SimuladorHormigas',
	#tag : 'Base'
}

{ #category : 'update' }
Reina >> actualizarContingencias: unaContingencia ubicacion: unaUbicacion [

	| celda |
	celda := Celda new.

	celda punto: unaUbicacion.
	celda contenido: unaContingencia.
	celda x: celda punto x .
	celda y: celda punto y .

	self colContingencias add: celda
]

{ #category : 'accessing' }
Reina >> colContingencias [

	^ colContingencias
]

{ #category : 'accessing' }
Reina >> colContingencias: anObject [

	colContingencias := anObject
]

{ #category : 'accessing' }
Reina >> colExploradoras [

	^ colExploradoras
]

{ #category : 'accessing' }
Reina >> colExploradoras: anObject [

	colExploradoras := anObject
]

{ #category : 'accessing' }
Reina >> colGuardianas [

	^ colGuardianas
]

{ #category : 'accessing' }
Reina >> colGuardianas: anObject [

	colGuardianas := anObject
]

{ #category : 'accessing' }
Reina >> colObreras [

	^ colObreras
]

{ #category : 'accessing' }
Reina >> colObreras: anObject [

	colObreras := anObject
]

{ #category : 'accessing' }
Reina >> comidaMaxima [

	^ comidaMaxima
]

{ #category : 'accessing' }
Reina >> comidaMaxima: anObject [

	comidaMaxima := anObject
]

{ #category : 'update' }
Reina >> eliminarContingencia [

	self colContingencias removeFirst .
]

{ #category : 'creation' }
Reina >> engendrar [

	| bendi |
	comidaMaxima = 3 ifFalse: [ ^ self ].
	bendi := semillero removeFirst.
	semillero addLast: bendi.
	self inicializarSegunClaseDeBendi: bendi.
	self comidaMaxima: 0
]

{ #category : 'initalize' }
Reina >> inicializarExploradora [

	| margaretMead |
	margaretMead := Exploradora new
		                ubicacion: self ubicacion;
		                colMensajes: OrderedCollection new;
							colVecinos: OrderedCollection new;
		                estado: 'explorando';
		                yourself.
	self colExploradoras add: margaretMead.
	margaretMead actualizarRecorridas .
	self changed .
	 
^ margaretMead
]

{ #category : 'initalize' }
Reina >> inicializarGuardiana [

	| mujerKurda |
	mujerKurda := Guardiana new ubicacion: self ubicacion; estado: 'yendo'.
	self colGuardianas add: mujerKurda .
	
	mujerKurda actualizarRecorridas .
	
	^ mujerKurda
	

]

{ #category : 'initalize' }
Reina >> inicializarObrera [

	| lucyParsons |
	lucyParsons := Obrera new
		               ubicacion: self ubicacion;
		               mochila: 0;
		               estado: 'ida';
		               yourself.
	self colObreras add: lucyParsons.
	lucyParsons actualizarRecorridas.

	^ lucyParsons
]

{ #category : 'initalize' }
Reina >> inicializarSegunClaseDeBendi: unaBendi [

	unaBendi class
		caseOf: { 
				([ Exploradora ] -> [ self inicializarExploradora ]).
				([ Guardiana ] -> [ self inicializarGuardiana ]).
				([ Obrera ] -> [ self inicializarObrera ]) }
		otherwise: [  ]
]

{ #category : 'initalize' }
Reina >> inicializarUbicacion: unaUbicacion [

	self ubicacion: unaUbicacion.
	self colExploradoras: OrderedCollection new.
	self colGuardianas: OrderedCollection new.
	self colObreras: OrderedCollection new
]

{ #category : 'accessing' }
Reina >> semillero [

	

	^ semillero
]

{ #category : 'accessing' }
Reina >> semillero: anObject [

	semillero := anObject
]
