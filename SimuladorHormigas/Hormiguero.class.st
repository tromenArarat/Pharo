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
		'cantAlimento'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #calculating }
Hormiguero >> bocasAlimentar [

	| exploradorasEnHormiguero |
	exploradorasEnHormiguero := 0.

	self reina colExploradoras do: [ :exploradora | 
		exploradora ubicacion = self ubicacion ifTrue: [ 
			exploradorasEnHormiguero := exploradorasEnHormiguero + 1 ] ].

	^ 1 + exploradorasEnHormiguero + self reina colGuardianas size + self reina colObreras size
]

{ #category : #accessing }
Hormiguero >> cantAlimento [

	^ cantAlimento
]

{ #category : #accessing }
Hormiguero >> cantAlimento: anObject [

	cantAlimento := anObject
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

{ #category : #initialize }
Hormiguero >> inicializarColor: unColor ubicacion: unaUbicacion [

	| reinaBatata |
	reinaBatata := Reina new inicializarUbicacion: unaUbicacion ;colContingencias: OrderedCollection new .

	self color: unColor.
	self ubicacion: unaUbicacion.
	self reina: reinaBatata.

	reinaBatata inicializarExploradora
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
