Class {
	#name : #Hormiguero,
	#superclass : #Object,
	#instVars : [
		'color',
		'hormiga'
	],
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Hormiguero >> color [

	^ color
]

{ #category : #accessing }
Hormiguero >> color: anObject [

	color := anObject
]

{ #category : #accessing }
Hormiguero >> hormiga [

	^ hormiga
]

{ #category : #accessing }
Hormiguero >> hormiga: anObject [

	hormiga := anObject
]
