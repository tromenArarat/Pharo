"
""Soy una fábrica. Creo autos""
"
Class {
	#name : #Fabrica,
	#superclass : #Object,
	#instVars : [
		'nombre'
	],
	#category : #'POO-modelos'
}

{ #category : #'referencing methods' }
Fabrica class >> ensureClassIsReferenced [
    "Dummy method to prevent removal warning"
    ^ self
]

{ #category : #creating }
Fabrica >> crearAuto [
	^ Auto new
]

{ #category : #'referencing methods' }
Fabrica >> ensureClassIsReferenced [

	"Dummy method to prevent removal warning"

	^ self
]

{ #category : #accessing }
Fabrica >> nombre [

	^ nombre
]

{ #category : #accessing }
Fabrica >> nombre: anObject [

	nombre := anObject
]
