Class {
	#name : #Reina,
	#superclass : #Hormiga,
	#instVars : [
		'colMensajes',
		'colExploradoras',
		'colGuardianas',
		'colObreras'
	],
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Reina >> colExploradoras [

	^ colExploradoras
]

{ #category : #accessing }
Reina >> colExploradoras: anObject [

	colExploradoras := anObject
]

{ #category : #accessing }
Reina >> colGuardianas [

	^ colGuardianas
]

{ #category : #accessing }
Reina >> colGuardianas: anObject [

	colGuardianas := anObject
]

{ #category : #accessing }
Reina >> colMensajes [

	^ colMensajes
]

{ #category : #accessing }
Reina >> colMensajes: anObject [

	colMensajes := anObject
]

{ #category : #accessing }
Reina >> colObreras [

	^ colObreras
]

{ #category : #accessing }
Reina >> colObreras: anObject [

	colObreras := anObject
]
