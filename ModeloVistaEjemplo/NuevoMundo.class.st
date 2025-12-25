Class {
	#name : #NuevoMundo,
	#superclass : #Object,
	#instVars : [
		'mapa'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #constructor }
NuevoMundo class >> nuevo: unMapa [

	^ self new mapa: unMapa
]

{ #category : #accessing }
NuevoMundo >> mapa [

	^ mapa
]

{ #category : #accessing }
NuevoMundo >> mapa: anObject [

	mapa := anObject
]
