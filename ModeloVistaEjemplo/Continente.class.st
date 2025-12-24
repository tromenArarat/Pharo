Class {
	#name : #Continente,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'ubicacion'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #accessing }
Continente >> nombre [

	^ nombre
]

{ #category : #accessing }
Continente >> nombre: anObject [

	nombre := anObject
]

{ #category : #accessing }
Continente >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Continente >> ubicacion: anObject [

	ubicacion := anObject
]
