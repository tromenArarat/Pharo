"
Juego de la vida es un código provisto por la cátedra Programación Orientada a Objetos - Facultad de Informática - Universidad Nacional del Comahue.
"
Class {
	#name : #Celula,
	#superclass : #Object,
	#instVars : [
		'estadoActual',
		'estadoSiguiente',
		'posicion'
	],
	#category : #'Juego-de-la-Vida-modelos'
}

{ #category : #'instance creation' }
Celula class >> crear: estado en: latitud y: longitud [
"Se crea una celula con el estado inicial recibido por parámetro"
^(self new) inicializar: estado en: latitud y: longitud.
]

{ #category : #'instance creation' }
Celula class >> crearAleatoria: latitud y: longitud [
"se crea una celula con estado inicial 0 (muerta) o 1 (viva) aleatoriamente"
|unaCelula estadoInicial|
unaCelula := self new.
estadoInicial := 2 atRandom -1.
unaCelula inicializar: estadoInicial en: latitud y: longitud.
^unaCelula.
]

{ #category : #method }
Celula >> cambiarEstado [
estadoActual := estadoSiguiente.
"cuando se produce un cambio en el estado de la celula, se avisa para que sus dependientes se actualicen"
self changed.
]

{ #category : #method }
Celula >> evolucionar [
"se efectiviza la evolucion de la celula"
(estadoActual = estadoSiguiente)
ifFalse: [self cambiarEstado].
]

{ #category : #method }
Celula >> inicializar: estado [

	"Se mantiene un estado actual y un estado siguiente para poder pasar por todas las celulas antes
de modificar su estado. La inicializacion se refleja en la parte visual"

	estadoActual := estado.
	estadoSiguiente := estado .
	self changed.
]

{ #category : #method }
Celula >> inicializar: estado en: latitud y: longitud [
"Se mantiene un estado actual y un estado siguiente para poder pasar por todas las celulas antes
de modificar su estado. La inicializacion se refleja en la parte visual"
estadoActual := estado.
estadoSiguiente := estado.
posicion:= Point x: latitud y: longitud.
self changed.
]

{ #category : #method }
Celula >> prepararEvolucion: juego con: reglas [
"cantidad representa la cantidad de celulas vecinas vivas. En este método se define el proximo estado en que se
encontrará la celula dependiendo de su estado actual, la cantidad de celulas vecinas vivas y las reglas del juego. Las
variables latitud y longitud no son necesarias pero se utilizan por claridad"
|cantidad latitud longitud|
latitud:= posicion x.
longitud:= posicion y.
cantidad := juego buscarVecinasVivas: latitud y: longitud.
estadoSiguiente := estadoActual.
(self verificarVida)
ifTrue: [ (reglas puedeVivir: cantidad)
ifFalse: [estadoSiguiente := 0]
]
ifFalse: [ (reglas puedeRenacer: cantidad)
ifTrue: [estadoSiguiente := 1.]
]
]

{ #category : #method }
Celula >> verificarVida [
"se verifica si la celula esta viva"
^(estadoActual = 1)
]
