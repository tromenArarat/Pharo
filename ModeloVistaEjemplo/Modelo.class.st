Class {
	#name : #Modelo,
	#superclass : #Object,
	#instVars : [
		'mapa'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #constructor }
Modelo class >> nuevo: unMapa [

	^ self new mapa: unMapa
]

{ #category : #accessing }
Modelo >> mapa [

	^ mapa
]

{ #category : #accessing }
Modelo >> mapa: anObject [

	mapa := anObject
]
