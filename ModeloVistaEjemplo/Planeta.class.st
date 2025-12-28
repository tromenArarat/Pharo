Class {
	#name : 'Planeta',
	#superclass : 'Object',
	#instVars : [
		'continente'
	],
	#category : 'ModeloVistaEjemplo-ModeloAstro',
	#package : 'ModeloVistaEjemplo',
	#tag : 'ModeloAstro'
}

{ #category : 'constructor' }
Planeta class >> nuevo: unContinente [

	^self new continente: unContinente
]

{ #category : 'changes' }
Planeta >> cambiarNombreContinente [

self continente nombre: 'Medio-Oriente' .

self changed 
]

{ #category : 'accessing' }
Planeta >> continente [

	^ continente
]

{ #category : 'accessing' }
Planeta >> continente: anObject [

	continente := anObject
]
