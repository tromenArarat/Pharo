Class {
	#name : #Hormiga,
	#superclass : #Object,
	#instVars : [
		'ubicacion'
	],
	#category : #SimuladorHormigas
}

{ #category : #moves }
Hormiga >> moverHormiga: hormiga [

	| tablero |
	tablero := self mapa.

	hormiga ubicacion contenido = 'hormiguero' ifTrue: [ 
		hormiga ubicacion = (tablero at: 1) at: 2 ]
]

{ #category : #accessing }
Hormiga >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Hormiga >> ubicacion: anObject [

	ubicacion := anObject
]
