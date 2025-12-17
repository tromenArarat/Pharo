"
El hormiguero es el único lugar donde las hormigas comen una unidad de comida por turno.
"
Class {
	#name : #Hormiguero,
	#superclass : #Object,
	#instVars : [
		'color',
		'reina',
		'ubicacion'
	],
	#category : #'SimuladorHormigas-Base'
}

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
	reinaBatata := Reina new inicializarUbicacion: unaUbicacion.

	self color: unColor.
	self ubicacion: unaUbicacion.
	self reina: reinaBatata .
	
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
