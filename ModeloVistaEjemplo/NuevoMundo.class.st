Class {
	#name : #NuevoMundo,
	#superclass : #Object,
	#instVars : [
		'mapa',
		'colHormigueros',
		'colAlimentos'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #constructor }
NuevoMundo class >> nuevo: unMapa [

	^ self new mapa: unMapa
]

{ #category : #search }
NuevoMundo >> cambiar [

	| filas columnas |
	filas := mapa rowCount.
	columnas := mapa columnCount.
	1 to: filas do: [ :i | 
	1 to: columnas do: [ :j | (mapa at: i at: j) actualizar ] ]
]

{ #category : #'old - ffi backend support' }
NuevoMundo >> cambiarContenidoCasilla: posicion [

	| casilla |
	casilla := self casillaEnMapa: posicion.

	casilla estado: 'hormiguero'.
	self changed
]

{ #category : #'old - ffi backend support' }
NuevoMundo >> cambiarContenidoCelda: ubicacion [

|celda |
celda := self celdaEnMapa: ubicacion .

celda contenido: 'hormiguero'.
self changed
]

{ #category : #accessing }
NuevoMundo >> cambiarEstadoCasilla: ubicacion [

	| casilla |
	casilla := self casillaEnMapa: ubicacion.

	casilla estadoSiguiente: 'hormiguero'.
	self changed
]

{ #category : #accessing }
NuevoMundo >> casillaEnMapa: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.

	^ (self mapa at: fila) at: columna
]

{ #category : #'old - ffi backend support' }
NuevoMundo >> celdaEnMapa: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.

	^ (self mapa at: fila) at: columna
]

{ #category : #accessing }
NuevoMundo >> colAlimentos [

	^ colAlimentos
]

{ #category : #accessing }
NuevoMundo >> colAlimentos: anObject [

	colAlimentos := anObject
]

{ #category : #accessing }
NuevoMundo >> colHormigueros [

	^ colHormigueros
]

{ #category : #accessing }
NuevoMundo >> colHormigueros: anObject [

	colHormigueros := anObject
]

{ #category : #initialization }
NuevoMundo >> colorAleatorio [

	| colores indice |
	colores := #( 'rojo' 'negro' ).
	indice := (1 to: 2) atRandom.

	^ colores at: indice
]

{ #category : #search }
NuevoMundo >> ejecutarTurno [

	"se realiza una recorrida por el mundo, se prepara cada celda para su cambio y finalmente se efectiviza el cambio"

	"self prepararCambios."
	self cambiar
	" faltaria trabajar el tema del estado estable del mundo"
]

{ #category : #accessing }
NuevoMundo >> encontrarAlimentoEn: unaUbicacion [

	^ self colAlimentos detect: [ :alimento | 
		  alimento ubicacion = unaUbicacion ]
]

{ #category : #initalize }
NuevoMundo >> inicializarFuenteAlimentos [

	| numAlimentos posicionesUsadas m n |
	numAlimentos := 10.
	posicionesUsadas := Set new.
	n := self mapa size.
	m := (self mapa at: 1) size.

	self colAlimentos: OrderedCollection new.

	numAlimentos timesRepeat: [ 
		| filaRandom columnaRandom posicion alimento |
		[ 
		filaRandom := (1 to: n) atRandom.
		columnaRandom := (1 to: m) atRandom.
		posicion := filaRandom @ columnaRandom.
		posicionesUsadas includes: posicion ] whileTrue.

		posicionesUsadas add: posicion.

		alimento := Alimento new
			            ubicacion: posicion;
			            cantidad: (10 to: 20) atRandom;
			            yourself.

		colAlimentos add: alimento.

		((mapa at: filaRandom) at: columnaRandom) estadoActual: 'alimento' ]
]

{ #category : #initialization }
NuevoMundo >> inicializarHormigueros [

	| numHormigueros ubicacionesUsadas m n cantAlimentoPorHormiguero |
	numHormigueros := 2.
	ubicacionesUsadas := self ubicacionesUsadasConAlimentoHormiguero.

	n := self mapa size.
	m := (self mapa at: 1) size.

	cantAlimentoPorHormiguero := 50.
	self colHormigueros: OrderedCollection new.

	numHormigueros timesRepeat: [ 
		| filaRandom columnaRandom ubicacion hormiguero color |
		"Si el bloque es verdadero se ejecuta de vuelta"
		[ 
		filaRandom := (1 to: n) atRandom.
		columnaRandom := (1 to: m) atRandom.
		ubicacion := filaRandom @ columnaRandom.
		ubicacionesUsadas includes: ubicacion ] whileTrue.

		ubicacionesUsadas add: ubicacion.

		color := self colorAleatorio.

		hormiguero := Hormiguero new.
		hormiguero inicializarColor: color ubicacion: ubicacion.


		hormiguero alimento: cantAlimentoPorHormiguero.

		self colHormigueros add: hormiguero.

		((mapa at: filaRandom) at: columnaRandom) estadoActual: 'hormiguero' ]
]

{ #category : #accessing }
NuevoMundo >> mapa [

	^ mapa
]

{ #category : #accessing }
NuevoMundo >> mapa: anObject [

	mapa := anObject
]

{ #category : #initialization }
NuevoMundo >> ubicacionesUsadasConAlimentoHormiguero [

	| ubicacionesUsadas |
	ubicacionesUsadas := Set new.

	self mapa do: [ :fila | 
		fila do: [ :casilla | 
			(casilla estadoActual = 'alimento' or: casilla estadoActual = 'hormiguero') 
				ifTrue: [ ubicacionesUsadas add: casilla posicion ] ] ].

	^ ubicacionesUsadas
]
