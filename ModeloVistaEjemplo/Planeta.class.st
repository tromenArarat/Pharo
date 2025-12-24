Class {
	#name : #Planeta,
	#superclass : #Object,
	#instVars : [
		'continente'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #constructor }
Planeta class >> nuevo: unContinente [

	^self new continente: unContinente
]

{ #category : #accessing }
Planeta >> continente [

	^ continente
]

{ #category : #accessing }
Planeta >> continente: anObject [

	continente := anObject
]
