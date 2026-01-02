Class {
	#name : #Casilla,
	#superclass : #Object,
	#instVars : [
		'estadoActual',
		'estadoSiguiente',
		'posicion'
	],
	#category : #'SimuladorHormigas-Modelo'
}

{ #category : #'instance creation' }
Casilla class >> crear: estado en: latitud y: longitud [

	"Se crea una casilla con el estado inicial recibido por parámetro"

	^ self new inicializar: estado en: latitud y: longitud
]

{ #category : #method }
Casilla >> actualizar [

	"se efectiviza el update de la casilla"

	estadoActual = estadoSiguiente ifFalse: [ self cambiarEstado ]
]

{ #category : #method }
Casilla >> cambiarEstado [

	estadoActual := estadoSiguiente.
	"cuando se produce un cambio en el estado de la casilla, se avisa para que sus dependientes se actualicen"
	self changed
]

{ #category : #accessing }
Casilla >> estadoActual [

	^ estadoActual
]

{ #category : #accessing }
Casilla >> estadoActual: anObject [

	estadoActual := anObject
]

{ #category : #accessing }
Casilla >> estadoSiguiente [

	^ estadoSiguiente
]

{ #category : #accessing }
Casilla >> estadoSiguiente: anObject [

	estadoSiguiente := anObject
]

{ #category : #method }
Casilla >> inicializar: estado [

	"Se mantiene un estado actual y un estado siguiente para poder pasar por todas las casillas antes
de modificar su estado. La inicializacion se refleja en la parte visual"

	estadoActual := estado.
	estadoSiguiente := estado.
	self changed
]

{ #category : #method }
Casilla >> inicializar: estado en: latitud y: longitud [


	estadoActual := estado.
	estadoSiguiente := estado.
	posicion := Point x: latitud y: longitud.
	self changed
]

{ #category : #accessing }
Casilla >> posicion [

	^ posicion
]

{ #category : #accessing }
Casilla >> posicion: anObject [

	posicion := anObject
]

{ #category : #method }
Casilla >> verificarVacia [

	"se verifica si la casilla está vacía"

	^ estadoActual = 'vacia'
]
