Class {
	#name : #JuegoVida,
	#superclass : #Object,
	#instVars : [
		'mundo',
		'reglas'
	],
	#category : #'Juego-de-la-Vida-modelos'
}

{ #category : #initialization }
JuegoVida class >> crearMundoFilas: dimFilas columnas: dimColumnas reglas: cadenaReglas [
"Se crea e inicializa el juego vida con la regla y las dimensiones para el mundo dadas por parametro"
^self new inicializar: cadenaReglas conFilas: dimFilas conColumnas: dimColumnas.
]

{ #category : #search }
JuegoVida >> buscarVecinasVivas: fil y: col [

	" vivas mantendrá la cantidad de celulas vecinas vivas .
		- filaIni y filaFin marcan los límites horizontales de la búsqueda
		- colIni y colFin marcan los límites verticales de la búsqueda "

	| vivas filaIni filaFin colIni colFin |
	
	vivas := 0.
	fil > 1
		ifTrue: [ filaIni := fil - 1 ]
		ifFalse: [ filaIni := fil ].
	col > 1
		ifTrue: [ colIni := col - 1 ]
		ifFalse: [ colIni := col ].
	fil < mundo rowCount
		ifTrue: [ filaFin := fil + 1 ]
		ifFalse: [ filaFin := fil ].
	col < mundo columnCount
		ifTrue: [ colFin := col + 1 ]
		ifFalse: [ colFin := col ].
	filaIni to: filaFin do: [ :i | 
		colIni to: colFin do: [ :j | 
			(mundo at: i at: j) verificarVida ifTrue: [ vivas := vivas + 1 ] ] ].
	"aqui se controla la situación de la celula en la posicion recibida por parametro"
	(mundo at: fil at: col) verificarVida ifTrue: [ vivas := vivas - 1 ].
	^ vivas
]

{ #category : #search }
JuegoVida >> ejecutarTurno [

	"se realiza una recorrida por el mundo, se prepara cada celula para su evolución y finalmente se efectiviza la evolucion"

	| filas columnas vecinasVivas |
	self prepararEvolucion.
	self evolucionar
	" faltaria trabajar el tema del estado estable del mundo"
]

{ #category : #search }
JuegoVida >> evolucionar [

	"se efectiviza la evolución del mundo"

	| filas columnas |
	filas := mundo rowCount.
	columnas := mundo columnCount.
	1 to: filas do: [ :f | 
	1 to: columnas do: [ :c | (mundo at: f at: c) evolucionar ] ]
]

{ #category : #search }
JuegoVida >> fila: f columna: c [

	^ mundo at: f at: c
]

{ #category : #search }
JuegoVida >> fila: f columna: c estado: e [

	(mundo at: f at: c) inicializar: e
]

{ #category : #search }
JuegoVida >> inicializar: cadReglas conFilas: dimFil conColumnas: dimCol [

	
]

{ #category : #search }
JuegoVida >> inicializarMundo [

	"se crean las celulas con su estado y se agregan al mundo. Se crean todas las celulas muertas, pero tambien
podrian crearse todas las celulas con un estado inicial aleatorio utilizando el método de creación 'crearAleatoria' "

	| filas columnas |
	filas := mundo rowCount.
	columnas := mundo columnCount.
	1 to: filas do: [ :f | 
		1 to: columnas do: [ :c | 
		mundo at: f at: c put: (Celula crear: 0 en: f y: c) ] ]
]

{ #category : #search }
JuegoVida >> prepararEvolucion [

	"Se preparan las celulas del munod para evolucionar si corresponde"

	| filas columnas |
	filas := mundo rowCount.
	columnas := mundo columnCount.
	1 to: filas do: [ :f | 
		1 to: columnas do: [ :c | 
		(mundo at: f at: c) prepararEvolucion: self con: reglas ] ]
]

{ #category : #search }
JuegoVida >> verificarEstabilidad [
"En este metodo deberia verificarse si el juego esta en un estado estable, es decir sin cambios."
]
