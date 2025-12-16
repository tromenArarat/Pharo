"
Si la reina alcanza su punto de alimentación máxima, engendra una exploradora, una obrera o una guardiana, en proporción: 20, 50, 30 respectivamente.
"
Class {
	#name : #Reina,
	#superclass : #Hormiga,
	#instVars : [
		'colExploradoras',
		'colGuardianas',
		'colObreras'
	],
	#category : #'SimuladorHormigas-Base'
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
