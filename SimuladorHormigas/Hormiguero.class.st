"
El hormiguero es el único lugar donde las hormigas comen una unidad de comida por turno.
"
Class {
	#name : #Hormiguero,
	#superclass : #Object,
	#instVars : [
		'color',
		'colHormigas',
		'ubicacion'
	],
	#category : #'SimuladorHormigas-Base'
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
Hormiguero >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Hormiguero >> ubicacion: anObject [

	ubicacion := anObject
]
