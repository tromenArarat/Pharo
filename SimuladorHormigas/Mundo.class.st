Class {
	#name : #Mundo,
	#superclass : #Object,
	#instVars : [
		'hormigueros',
		'mapa'
	],
	#category : #SimuladorHormigas
}

{ #category : #'game logic' }
Mundo >> encontrarReinaEn: unaUbicacion [

	"Retorna la reina que se encuentra en la ubicación especificada"

	^ self hormigas
		  detect: [ :hormiga | 
			  (hormiga class: Hormiga) and: [ 
				  hormiga ubicacion = unaUbicacion ] ]
		  ifNone: [ nil ]
]

{ #category : #accessing }
Mundo >> hormigueros [

	^ hormigueros
]

{ #category : #accessing }
Mundo >> hormigueros: anObject [

	hormigueros := anObject
]

{ #category : #initalize }
Mundo >> inicializarMundoConFilas: n columnas: m [

	| tablero |
	tablero := OrderedCollection new.

	1 to: n do: [ :fila | 
		| filaCeldas |
		filaCeldas := OrderedCollection new.

		1 to: m do: [ :columna | 
			filaCeldas add: (Celda new
					 x: fila;
					 y: columna;
					 contenido: 'vacío';
					 yourself) ].

		tablero add: filaCeldas ].

	self mapa: tablero
]

{ #category : #accessing }
Mundo >> mapa [

	^ mapa
]

{ #category : #accessing }
Mundo >> mapa: anObject [

	mapa := anObject
]
