Class {
	#name : #Hormiguero,
	#superclass : #Object,
	#instVars : [
		'color',
		'colHormigas',
		'ubicacion',
		'mundo'
	],
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Hormiguero >> colHormigas [

	^ colHormigas
]

{ #category : #accessing }
Hormiguero >> colHormigas: anObject [

	colHormigas := anObject
]

{ #category : #accessing }
Hormiguero >> color [

	^ color
]

{ #category : #accessing }
Hormiguero >> color: anObject [

	color := anObject
]

{ #category : #accessing }
Hormiguero >> mundo [

	^ mundo
]

{ #category : #accessing }
Hormiguero >> mundo: anObject [

	mundo := anObject
]

{ #category : #accessing }
Hormiguero >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Hormiguero >> ubicacion: anObject [

	ubicacion := anObject
]
