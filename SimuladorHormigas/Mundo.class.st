Class {
	#name : #Mundo,
	#superclass : #Object,
	#instVars : [
		'colHormigueros',
		'hormigas',
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

{ #category : #'game logic' }
Mundo >> encontrarReinaEn: unaUbicacion [

	"Retorna la reina que se encuentra en la ubicación especificada"

	^ self hormigas
		  detect: [ :hormiga | 
			  (hormiga isKindOf: Reina) and: [ hormiga ubicacion = unaUbicacion ] ]
		  ifNone: [ nil ]
]

{ #category : #accessing }
Mundo >> hormigas [

	^ hormigas
]

{ #category : #accessing }
Mundo >> hormigas: anObject [

	hormigas := anObject
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
