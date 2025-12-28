"
Clase madre de todas las hormigas

"
Class {
	#name : 'Hormiga',
	#superclass : 'Object',
	#instVars : [
		'ubicacion'
	],
	#category : 'SimuladorHormigas-Base',
	#package : 'SimuladorHormigas',
	#tag : 'Base'
}

{ #category : 'accessing' }
Hormiga >> ubicacion [

	^ ubicacion
]

{ #category : 'accessing' }
Hormiga >> ubicacion: anObject [

	ubicacion := anObject
]
