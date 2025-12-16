"
Las exploradoras se mueven de 3 celdas en cada turno.
"
Class {
	#name : #Exploradora,
	#superclass : #Hormiga,
	#instVars : [
		'colRecorridas'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #updating }
Exploradora >> actualizarRecorridas [

	colRecorridas add: self ubicacion
]

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

{ #category : #checking }
Exploradora >> estaEnRecorridas: unaCelda [

^ self colRecorridas includes: unaCelda .
]
