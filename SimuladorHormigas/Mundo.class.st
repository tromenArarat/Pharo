Class {
	#name : #Mundo,
	#superclass : #Object,
	#instVars : [
		'colHormigueros',
		'colFuentesAlimento',
		'm',
		'n'
	],
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Mundo >> colFuentesAlimento [

	^ colFuentesAlimento
]

{ #category : #accessing }
Mundo >> colFuentesAlimento: anObject [

	colFuentesAlimento := anObject
]

{ #category : #accessing }
Mundo >> colHormigueros [

	^ colHormigueros
]

{ #category : #accessing }
Mundo >> colHormigueros: anObject [

	colHormigueros := anObject
]

{ #category : #initialization }
Mundo >> initialize [ 
n:= 10 .
m:= 10

]

{ #category : #accessing }
Mundo >> m [

	^ m
]

{ #category : #accessing }
Mundo >> m: anObject [

	m := anObject
]

{ #category : #accessing }
Mundo >> n [

	^ n
]

{ #category : #accessing }
Mundo >> n: anObject [

	n := anObject
]
