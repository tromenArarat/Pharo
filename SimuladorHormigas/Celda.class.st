"
Cada unidad del mapa, definida con un objeto de la clase Point y una descripción.



"
Class {
	#name : 'Celda',
	#superclass : 'Object',
	#instVars : [
		'punto',
		'contenido',
		'x',
		'y'
	],
	#category : 'SimuladorHormigas-Base',
	#package : 'SimuladorHormigas',
	#tag : 'Base'
}

{ #category : 'initialization' }
Celda class >> punto: unPunto contenido: unaCadena [
    ^ self new
        punto: unPunto;
        contenido: unaCadena;
        yourself
]

{ #category : 'accessing' }
Celda >> contenido [

	^ contenido
]

{ #category : 'accessing' }
Celda >> contenido: unaCadena [

	contenido := unaCadena .
	self changed
]

{ #category : 'accessing' }
Celda >> punto [

	^ punto
]

{ #category : 'accessing' }
Celda >> punto: unPunto [

	punto := unPunto .
	self changed
]

{ #category : 'accessing' }
Celda >> x [

	^ punto x
]

{ #category : 'accessing' }
Celda >> x:unNumero [

	x:= unNumero .
	self changed .
]

{ #category : 'accessing' }
Celda >> y [

	^ punto y
]

{ #category : 'accessing' }
Celda >> y:unNumero [

	y := unNumero .
	self changed
]
