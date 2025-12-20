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
