Class {
	#name : #Reina,
	#superclass : #Object,
	#instVars : [
		'mundo',
		'hormiguero',
		'comidaMaxima',
		'colExploradoras'
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
Reina >> comidaMaxima [

	^ comidaMaxima
]

{ #category : #accessing }
Reina >> comidaMaxima: anObject [

	comidaMaxima := anObject
]

{ #category : #accessing }
Reina >> hormiguero [

	^ hormiguero
]

{ #category : #accessing }
Reina >> hormiguero: anObject [

	hormiguero := anObject
]

{ #category : #initialization }
Reina >> initialize [

	hormiguero := Hormiguero new.

	comidaMaxima := 3.
	colExploradoras := OrderedCollection new
]

{ #category : #accessing }
Reina >> mundo [

	^ mundo
]

{ #category : #accessing }
Reina >> mundo: anObject [

	mundo := anObject
]
