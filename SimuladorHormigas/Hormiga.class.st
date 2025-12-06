Class {
	#name : #Hormiga,
	#superclass : #Object,
	#instVars : [
		'ubicacion',
		'colRecorridas'
	],
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Hormiga >> colRecorridas [

	^ colRecorridas
]

{ #category : #accessing }
Hormiga >> colRecorridas: anObject [

	colRecorridas := anObject
]

{ #category : #accessing }
Hormiga >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Hormiga >> ubicacion: anObject [

	ubicacion := anObject
]
