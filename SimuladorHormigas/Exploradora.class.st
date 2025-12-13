Class {
	#name : #Exploradora,
	#superclass : #Hormiga,
	#instVars : [
		'colMensajes',
		'colRecorridas'
	],
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Exploradora >> colMensajes [

	^ colMensajes
]

{ #category : #accessing }
Exploradora >> colMensajes: anObject [

	colMensajes := anObject
]

{ #category : #accessing }
Exploradora >> colRecorridas [

	^ colRecorridas
]

{ #category : #accessing }
Exploradora >> colRecorridas: anObject [

	colRecorridas := anObject
]

{ #category : #moves }
Exploradora >> mover [
(self ubicacion contenido: 'hormiguero') ifTrue: [ self ubicacion x: self ubicacion x +1 ]
]
