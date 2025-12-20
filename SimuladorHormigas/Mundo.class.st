"
El mundo es donde la simulación comienza. Es la clase encargada de crear hormigueros y fuentes de alimento

Los primeros comandos para crear el mapa del mundo, crear un hormiguero y completar sus atributos de instancia son los siguientes:

mundo := Mundo new .

## Ejemplo de testeo del algoritmo para moverExploradora:

- ""Estoy buscando la ratio recorridas/repetidas""

mundo moverExploradora: robinson contador: 0 .

71 timesRepeat: [ mundo moverExploradora: robinson contador: 0  ] .

robinson ubicacion .

robinson colRecorridas .

unPunto := robinson colRecorridas at:23.

robinson colRecorridas select:  [ :x |  (x = unPunto) ] .

- ""cómo hago para traer la ubicacion más repetida y cómo cuenta la cantidad de ubicaciones repetidas en total""

coleccionOrdenada := robinson colRecorridas asOrderedCollection  .

OrderedCollection selectors .

contador := Dictionary new.

coleccionOrdenada do: [:punto |  contador at: punto put: ((contador at: punto ifAbsent: [0]) + 1)] .

contador  .

contador size .

maxRepeticiones := 0.
puntoMasRepetido := nil.

contador keysAndValuesDo: [:punto :cantidad | cantidad > maxRepeticiones ifTrue: [ maxRepeticiones := cantidad. 	puntoMasRepetido := punto]].

maxRepeticiones .
puntoMasRepetido .

masRepetidoRecord := robinson colRecorridas select:  [ :x |  (x = puntoMasRepetido) ]  .

masRepetidoRecord size .


## Otros comandos

mundo inicializarMundoConFilas: 10 columnas: 10 .

hormiguero := Hormiguero new .

mundo colHormigueros: OrderedCollection new.

mundo colHormigueros add: hormiguero .

hormiguero mundo: mundo.

hormiguero .

hormiguero color: 'rojo' .

hormiguero ubicacion  .

mundo mapa .

((mundo mapa at:1 ) at:1) .

((mundo mapa at:1 ) at:1) contenido: 'hormiguero'.

hormiguero ubicacion: ((mundo mapa at:1 ) at:1).


OrderedCollection selectors .

(mundo colHormigueros removeAt: 2) .

((mundo mapa at:1 ) at:2) .

hormiguero colHormigas: OrderedCollection new .

hormiguero colHormigas add: Reina new .

reinaRoja := hormiguero colHormigas at:1 .

reinaRoja ubicacion: hormiguero ubicacion .

reinaRoja colExploradoras: OrderedCollection new .

reinaRoja colExploradoras add: Exploradora new .

robinson := reinaRoja colExploradoras at: 1 .

robinson ubicacion: reinaRoja ubicacion .

robinson ubicacion .

hormiguero ubicacion .

reinaRoja ubicacion .

fuenteAlimentos := mundo colAlimentos: OrderedCollection new .

mundo colAlimentos add: Alimento new .

(mundo colAlimentos at: 1) cantidad: 15 .

(mundo colAlimentos at: 1) ubicacion: ((mundo mapa at:1) at:3) .

((mundo mapa at:1) at:3) contenido: 'alimento' .

Transcript clear .

celdaIzqInf := ((mundo mapa at:1) at:1) .

celdaFueraDelMapa := Celda new .
celdaFueraDelMapa x:11 ; y:1 .

mundo estaEnMapa: celdaIzqInf .

celdaFueraDelMapa .

mundo estaEnMapa: celdaFueraDelMapa .

celdaFueraDelMapa x <= ((mundo mapa at: 10) at: 10) x .

(mundo mapa at:1) size .


"
Class {
	#name : #Mundo,
	#superclass : #Object,
	#instVars : [
		'colHormigueros',
		'mapa',
		'colAlimentos'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #accessing }
Mundo class >> posRandom: unaUbicacion enMapa: unMapa [

	| x y ejeRandom movimientoRandom nuevaUbicacion mundo |
	x := unaUbicacion x.
	y := unaUbicacion y.

	ejeRandom := Random new nextInteger: 2.

	movimientoRandom := Random new nextInteger: 2.
	nuevaUbicacion := Celda new.

	mundo := self.

	ejeRandom = 1
		ifTrue: [ 
			x := movimientoRandom = 1
				     ifTrue: [ x - 1 ]
				     ifFalse: [ x + 1 ] ]
		ifFalse: [ 
			y := movimientoRandom = 1
				     ifTrue: [ y - 1 ]
				     ifFalse: [ y + 1 ] ].


	nuevaUbicacion
		x: x;
		y: y.
		
"(mundo estaEnMapa: nuevaUbicacion)
		ifTrue: [ 
		nuevaUbicacion contenido: ((unMapa at: x) at: y) contenido ]
		ifFalse: [ self class posRandom: unaUbicacion enMapa: unMapa ].
"
	
	^ nuevaUbicacion
]

{ #category : #accessing }
Mundo class >> ubicacionAleatoria: unaUbicacion [

	| movPosibles nuevaUbicacion |
	movPosibles := unaUbicacion fourNeighbors.

	nuevaUbicacion := movPosibles atRandom.

	^ nuevaUbicacion
]

{ #category : #'game logic' }
Mundo class >> volverExploradora: unaExploradora [

	| ubicacionExploradora ubicacionHormiguero candidatas puntoMasCercano distanciaMinima |
	ubicacionExploradora := unaExploradora ubicacion.

	ubicacionHormiguero := unaExploradora colRecorridas at: 1.

	candidatas := ubicacionExploradora asPoint fourNeighbors.

	puntoMasCercano := candidatas first.

	distanciaMinima := puntoMasCercano distanceTo: ubicacionHormiguero.

	candidatas allButFirst do: [ :punto | 
		| distanciaActual |
		distanciaActual := punto distanceTo: ubicacionHormiguero.
		distanciaActual < distanciaMinima ifTrue: [ 
			distanciaMinima := distanciaActual.
			puntoMasCercano := punto ].
		unaExploradora ubicacion: puntoMasCercano ]
]

{ #category : #accessing }
Mundo >> celdaEnMapa: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.

	^ (self mapa at:fila) at:columna  .
]

{ #category : #accessing }
Mundo >> colAlimentos [

	^ colAlimentos
]

{ #category : #accessing }
Mundo >> colAlimentos: anObject [

	colAlimentos := anObject
]

{ #category : #accessing }
Mundo >> colHormigueros [

	^ colHormigueros
]

{ #category : #accessing }
Mundo >> colHormigueros: anObject [

	colHormigueros := anObject
]

{ #category : #random }
Mundo >> colorAleatorio [

	| colores indice |
	colores := #( 'rojo' 'negro' ).
	indice := (1 to: 2) atRandom.

	^ colores at: indice

	"Más sencillo:
		^ #('rojo' 'negro') atRandom
	"
]

{ #category : #decoding }
Mundo >> decodificarMensaje: unaExploradora [

	| ubicacionMensaje fila columna |
	ubicacionMensaje := unaExploradora colMensajes at: 1.

	fila := ubicacionMensaje x.
	columna := ubicacionMensaje y.

	^ ((self mapa at: fila) at: columna )contenido
]

{ #category : #accessing }
Mundo >> encontrarReinaEn: unaUbicacion [

	"Retorna la reina que se encuentra en la ubicación especificada, o nil si no hay ninguna"

	self colHormigueros do: [ :hormiguero |
        hormiguero reina ifNotNil: [ :reina |
            (reina ubicacion = unaUbicacion) ifTrue: [ ^ reina ] ] ].
]

{ #category : #checking }
Mundo >> estaEnMapa: celda [

	| x y m n |
	x := celda x.
	y := celda y.
	m := mapa size.
	n := (mapa at: 1) size.

	^ celda x <= ((mapa at: m) at: n) x
	  & (celda y <= ((mapa at: m) at: n) y) & (celda x > 0)
	  & (celda y > 0)
]

{ #category : #checking }
Mundo >> estaUbicacionEnMapa: unaUbicacion [

	| x y m n |
	x := unaUbicacion x.
	y := unaUbicacion y.
	m := self mapa size.
	n := (self mapa at: 1) size.

	^ unaUbicacion x <= ((self mapa at: m) at: n) x
	  & (unaUbicacion y <= ((mapa at: m) at: n) y) & (unaUbicacion x > 0)
	  & (unaUbicacion y > 0)
]

{ #category : #initalize }
Mundo >> inicializarFuenteAlimentos [

	| numAlimentos posicionesUsadas m n |
	numAlimentos := 10.
	posicionesUsadas := Set new.
	n := self mapa size.
	m := (self mapa at: 1) size.

	self colAlimentos: OrderedCollection new.

	numAlimentos timesRepeat: [ 
		| filaRandom columnaRandom posicion alimento |
		[ filaRandom := (1 to: n) atRandom.
		columnaRandom := (1 to: m) atRandom.
		posicion := filaRandom @ columnaRandom.
		posicionesUsadas includes: posicion ] whileTrue.

		posicionesUsadas add: posicion.

		alimento := Alimento new
			            ubicacion: posicion;
			            cantidad: (10 to: 20) atRandom;
			            yourself.

		colAlimentos add: alimento.

		((mapa at: filaRandom) at: columnaRandom) contenido: 'alimento' ]
]

{ #category : #initalize }
Mundo >> inicializarHormigueros [

	| numHormigueros posicionesUsadas m n cantAlimentoPorHormiguero  |
	numHormigueros := 2.
	posicionesUsadas := self posicionesUsadasConAlimentoHormiguero.

	n := self mapa size.
	m := (self mapa at: 1) size.

	cantAlimentoPorHormiguero := 50.
	self colHormigueros: OrderedCollection new.

	numHormigueros timesRepeat: [ 
		| filaRandom columnaRandom posicion hormiguero color |
		"Si el bloque es verdadero se ejecuta de vuelta"
		[ 
		filaRandom := (1 to: n) atRandom.
		columnaRandom := (1 to: m) atRandom.
		posicion := filaRandom @ columnaRandom.
		posicionesUsadas includes: posicion ] whileTrue.

		posicionesUsadas add: posicion.

		color := self colorAleatorio.

		hormiguero := Hormiguero new
			              inicializarColor: color
			              ubicacion: posicion.


		hormiguero alimento: cantAlimentoPorHormiguero.

		self colHormigueros add: hormiguero.

		((mapa at: filaRandom) at: columnaRandom) contenido: 'hormiguero' ]
]

{ #category : #initalize }
Mundo >> inicializarMundoConFilas: n columnas: m [

	| tablero |
	tablero := (1 to: n) collect: [ :fila | 
		           (1 to: m) collect: [ :columna | 
			           Celda punto: fila @ columna contenido: 'vacio' asString ] ].

	self mapa: tablero .
	self colHormigueros: OrderedCollection new .
	self colAlimentos: OrderedCollection new .
]

{ #category : #initialization }
Mundo >> initialize [

	| m n tablero |
	m := 10.
	n := 10.

	tablero := (1 to: n) collect: [ :fila | 
		           (1 to: m) collect: [ :columna | 
			           Celda punto: fila @ columna contenido: 'vacio' ] ].

	self mapa: tablero.

	self inicializarFuenteAlimentos.

	self inicializarHormigueros
]

{ #category : #accessing }
Mundo >> mapa [

	^ mapa
]

{ #category : #accessing }
Mundo >> mapa: anObject [

	mapa := anObject
]

{ #category : #'game logic' }
Mundo >> moverExploradora: unaExploradora contador: unNumero [

	| posActual celdaMapa recorridas posAleatoria contador |
	posActual := unaExploradora ubicacion.
	recorridas := unaExploradora colRecorridas.
	posAleatoria := self class ubicacionAleatoria:
		                unaExploradora ubicacion.
	contador := unNumero.

	(self estaUbicacionEnMapa: posAleatoria)
		ifTrue: [ 
			(unaExploradora estaEnRecorridas: posAleatoria) & (contador < 7)
				ifTrue: [ 
					contador := contador + 1.
					self moverExploradora: unaExploradora contador: contador ]
				ifFalse: [ 
					celdaMapa := self celdaEnMapa: posAleatoria.


					unaExploradora ubicacion: posAleatoria.
					unaExploradora actualizarRecorridas ] ]
		ifFalse: [ self moverExploradora: unaExploradora contador: contador ]
]

{ #category : #checking }
Mundo >> posicionesUsadasConAlimentoHormiguero [

	| posicionesUsadas |
	posicionesUsadas := Set new.

	self mapa do: [ :fila | 
		fila do: [ :celda | 
			(celda contenido = 'alimento' or: ( celda contenido = 'hormiguero' )) 
				ifTrue: [ posicionesUsadas add: celda punto ] ] ].

	^ posicionesUsadas
]

{ #category : #checking }
Mundo >> tieneAlimento: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.
	
	^ ((self mapa at: fila) at: columna ) contenido = 'alimento'

	
]

{ #category : #checking }
Mundo >> tieneVacio: unPuntoDeUbicacion [

	| fila columna celda |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.

	celda := (self mapa at: fila) at: columna.

	^ celda contenido = 'vacio' or: (celda contenido = 'hormiguero')
]

{ #category : #'game logic' }
Mundo >> turnoExploradora: unaExploradora [

	| ubicacionHormiguero reina |
	ubicacionHormiguero := unaExploradora colRecorridas at: 1.
	reina := self encontrarReinaEn: ubicacionHormiguero.
	unaExploradora estado = 'explorando'
		ifTrue: [ self turnoExploradoraExplorando: unaExploradora ]
		ifFalse: [ self turnoExploradoraVolviendo: unaExploradora ].

	unaExploradora ubicacion = ubicacionHormiguero ifFalse: [ ^ self ].
	unaExploradora estado: 'explorando'.
	reina
		actualizarContingencias:
		(unaExploradora colMensajes at: 1) contenido
		ubicacion: (unaExploradora colMensajes at: 1) punto
]

{ #category : #'game logic' }
Mundo >> turnoExploradoraExplorando: unaExploradora [

	| movimientos ubicacionHormiguero |
	ubicacionHormiguero := unaExploradora colRecorridas at: 1.
	movimientos := 0.
	[ 
	unaExploradora estado = 'explorando' & (movimientos < 4)
	& (self tieneVacio: unaExploradora ubicacion) ] whileTrue: [ 
		self moverExploradora: unaExploradora contador: 0.
		movimientos := movimientos + 1 ].
	(self tieneAlimento: unaExploradora ubicacion)
	& (unaExploradora colMensajes allSatisfy: [ :mensaje | 
			 mensaje punto ~= unaExploradora ubicacion ]) ifFalse: [ 
		^ self ].
	unaExploradora estado: 'volviendo'.
	unaExploradora actualizarMensajes:
		(self celdaEnMapa: unaExploradora ubicacion).
	unaExploradora colRecorridas removeAllSuchThat: [ :each | 
		(unaExploradora colRecorridas indexOf: each) > 1 ].
	movimientos := 4
]

{ #category : #accessing }
Mundo >> turnoExploradoraVolviendo: unaExploradora [

	| ubicacionHormiguero movimientos |
	ubicacionHormiguero := unaExploradora colRecorridas at: 1.
	movimientos := 0.
	[ 
	unaExploradora ubicacion ~= ubicacionHormiguero & (movimientos < 4) ] 
		whileTrue: [ 
			self class volverExploradora: unaExploradora.
			movimientos := movimientos + 1 ].

]
