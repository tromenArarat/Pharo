Class {
	#name : #Mapa,
	#superclass : #Object,
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #initialization }
Mapa >> initialize [

	| m n tablero |
	m := 10.
	n := 10.

	tablero := (1 to: n) collect: [ :fila | 
		           (1 to: m) collect: [ :columna | 
			           Celda punto: fila @ columna contenido: 'vacio' ] ] .
	
^ tablero
]
