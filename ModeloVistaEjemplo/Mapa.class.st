Class {
	#name : #Mapa,
	#superclass : #Object,
	#instVars : [
		'tablero'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #initialization }
Mapa >> celdaEnFila: fila columna: columna [

	"Return a cell at the given row and column"

	^ (tablero at: fila) at: columna
]

{ #category : #initialization }
Mapa >> initialize [

	| m n |
	m := 10.
	n := 10.

	tablero := (1 to: n) collect: [ :fila | 
		           (1 to: m) collect: [ :columna | 
			           | celda |
			           celda := Celda punto: fila @ columna contenido: 'vacio' ] ].
	^ tablero
]

{ #category : #accessing }
Mapa >> tablero [

	^ tablero
]

{ #category : #accessing }
Mapa >> tablero: anObject [

	tablero := anObject
]
