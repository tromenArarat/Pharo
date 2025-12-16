"
Cada unidad del mapa, definida con un objeto de la clase Point y una descripción
"
Class {
	#name : #Celda,
	#superclass : #Object,
	#instVars : [
		'punto',
		'contenido'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #initialization }
Celda class >> punto: unPunto contenido: unaCadena [
    ^ self new
        punto: unPunto;
        contenido: unaCadena;
        yourself
]

{ #category : #accessing }
Celda >> contenido [

	^ contenido
]

{ #category : #accessing }
Celda >> contenido: unaCadena [

	contenido := unaCadena
]

{ #category : #accessing }
Celda >> punto [

	^ punto
]

{ #category : #accessing }
Celda >> punto: unPunto [

	punto := unPunto
]

{ #category : #accessing }
Celda >> x [

	^ punto x
]

{ #category : #accessing }
Celda >> y [

	^ punto y
]
