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
	#name : 'Mundo',
	#superclass : 'Object',
	#instVars : [
		'colHormigueros',
		'mapa',
		'colAlimentos'
	],
	#classInstVars : [
		'colorHormiguero'
	],
	#category : 'SimuladorHormigas-Base',
	#package : 'SimuladorHormigas',
	#tag : 'Base'
}

{ #category : 'random' }
Mundo class >> colorAleatorio [
(self colorHormiguero ='rojo')ifTrue:[self colorHormiguero: 'negro']ifFalse:[ self colorHormiguero: 'rojo' ]
]

{ #category : 'accessing' }
Mundo class >> colorHormiguero [

	^ colorHormiguero
]

{ #category : 'accessing' }
Mundo class >> colorHormiguero: anObject [

	colorHormiguero := anObject
]

{ #category : 'move' }
Mundo class >> moverObrera: unaObrera aUbicacion: unaUbicacion [

	| ubicacionObrera candidatas puntoMasCercano distanciaMinima |
	ubicacionObrera := unaObrera ubicacion.

	candidatas := ubicacionObrera asPoint fourNeighbors.

	puntoMasCercano := candidatas first.

	distanciaMinima := puntoMasCercano distanceTo: unaUbicacion.

	candidatas allButFirst do: [ :punto | 
		| distanciaActual |
		distanciaActual := punto distanceTo: unaUbicacion.
		distanciaActual < distanciaMinima ifTrue: [ 
			distanciaMinima := distanciaActual.
			puntoMasCercano := punto ].
		unaObrera ubicacion: puntoMasCercano ]
]

{ #category : 'move' }
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

{ #category : 'random' }
Mundo class >> ubicacionAleatoria: unaUbicacion [

	| movPosibles nuevaUbicacion |
	movPosibles := unaUbicacion fourNeighbors.

	nuevaUbicacion := movPosibles atRandom.

	^ nuevaUbicacion
]

{ #category : 'move' }
Mundo class >> volverExploradora: unaExploradora [

	| ubicacionExploradora ubicacionHormiguero candidatas puntoMasCercano distanciaMinima |
	ubicacionExploradora := unaExploradora ubicacion.

	ubicacionHormiguero := unaExploradora colRecorridas first.

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

{ #category : 'accessing' }
Mundo >> celdaEnMapa: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.

	^ (self mapa at:fila) at:columna  .
]

{ #category : 'accessing' }
Mundo >> colAlimentos [

	^ colAlimentos
]

{ #category : 'accessing' }
Mundo >> colAlimentos: anObject [

	colAlimentos := anObject
]

{ #category : 'accessing' }
Mundo >> colHormigueros [

	^ colHormigueros
]

{ #category : 'accessing' }
Mundo >> colHormigueros: anObject [

	colHormigueros := anObject
]

{ #category : 'random' }
Mundo >> color: unColor [

	| colores |
	colores := #( 'rojo' 'negro' ).
	(unColor = colores first) ifTrue: [ ^ 'negro' ] ifFalse: [ ^ 'rojo' ]

]

{ #category : 'random' }
Mundo >> colorAleatorio [

	| colores indice |
	colores := #( 'rojo' 'negro' ).
	indice := (1 to: 2) atRandom.

	^ colores at: indice

	"Más sencillo:
		^ #('rojo' 'negro') atRandom
	"
]

{ #category : 'random' }
Mundo >> colorSecuencial [

	| colores |
	colores :=  #('rojo' 'negro') readStream .


	(colores position <2 ) ifTrue:[^colores next]ifFalse:[colores position:0. colores removeAt:colores position. ^colores next].

]

{ #category : 'decoding' }
Mundo >> decodificarMensaje: unaExploradora [

	| ubicacionMensaje fila columna |
	ubicacionMensaje := unaExploradora colMensajes first.

	fila := ubicacionMensaje x.
	columna := ubicacionMensaje y.

	^ ((self mapa at: fila) at: columna) contenido
]

{ #category : 'methods' }
Mundo >> ejecutarUnTurno [
	| reina obrera reina2 obrera2 guardiana guardiana2 mensaje exploradora exploradora2 contingencia contingencia2 |
	
	"Primera colonia"
	reina := self colHormigueros first reina.
	reina colObreras ifEmpty: [ ^ self ]. "validación innecesaria por el momento"
	obrera := reina colObreras first.
	exploradora := self colHormigueros first reina
				               colExploradoras first.
	guardiana := self colHormigueros first reina
				               colGuardianas first.
	
	"Si no hay contingencias y la obrera está en hormiguero se mueve la exploradora"
	((reina colContingencias isEmpty) and: [obrera ubicacion = reina ubicacion]) 
		ifTrue: [ self turnoExploradora:exploradora ] 
		ifFalse: [ 
			contingencia := reina colContingencias ifNotEmpty: [:col | col first] ifEmpty: [nil].
			contingencia ifNil: [ 
				self turnoObrera: obrera. 
			] ifNotNil: [ 
				mensaje := contingencia contenido.
				(mensaje = 'alimento') 
					ifTrue: [ self turnoObrera: obrera .
						"reina colContingencias removeAll"] .
				(mensaje = 'hormiguero') 
					ifTrue: [ self turnoGuardiana: guardiana .
						"reina colContingencias removeAll" ]
			]
		].
		
	"Segunda colonia"
	reina2 := self colHormigueros second reina.
	reina2 colObreras ifEmpty: [ ^ self ]. 
	obrera2 := reina2 colObreras first.
	exploradora2 := reina2 colExploradoras first.
	guardiana2 := reina2 colGuardianas first.
	
	((reina2 colContingencias isEmpty) and: [obrera2 ubicacion = reina2 ubicacion]) 
		ifTrue: [ self turnoExploradora:exploradora2  ] 
		ifFalse: [ 
			contingencia2 := reina2 colContingencias ifNotEmpty: [:col | col first] ifEmpty: [nil].
			contingencia2 ifNil: [ 
				self turnoObrera: obrera2.  
			] ifNotNil: [ 
				mensaje := contingencia2 contenido.
				(mensaje = 'alimento') 
					ifTrue: [ self turnoObrera: obrera2 .
						"reina2 colContingencias removeAll"].
				(mensaje = 'hormiguero') 
					ifTrue: [ self turnoGuardiana: guardiana2 .
						"reina2 colContingencias removeAll"]
			]
		].
]

{ #category : 'accessing' }
Mundo >> encontrarAlimentoEn: unaUbicacion [

| alimento |
	alimento := self colAlimentos detect: [ :a | a ubicacion = unaUbicacion ] ifNone: [ nil ].
	^ alimento ifNil: [ 
		| nuevoAlimento |
		nuevoAlimento := Alimento new.
		nuevoAlimento cantidad: 0.
		nuevoAlimento ubicacion: unaUbicacion.
		nuevoAlimento
	]
	
 
]

{ #category : 'accessing' }
Mundo >> encontrarHormigueroEn: unaUbicacion [

	self colHormigueros do: [ :hormiguero | 
		hormiguero reina ifNotNil: [ :reina | 
			reina ubicacion = unaUbicacion ifTrue: [ ^ hormiguero ] ] ]
]

{ #category : 'accessing' }
Mundo >> encontrarReinaEn: unaUbicacion [

	"Retorna la reina que se encuentra en la ubicación especificada, o nil si no hay ninguna"

	self colHormigueros do: [ :hormiguero |
        hormiguero reina ifNotNil: [ :reina |
            (reina ubicacion = unaUbicacion) ifTrue: [ ^ reina ] ] ].
]

{ #category : 'checking' }
Mundo >> estaEnMapa: celda [

	| x y m n |
	x := celda x.
	y := celda y.
	m := mapa size.
	n := (mapa first) size.

	^ celda x <= ((mapa at: m) at: n) x
	  & (celda y <= ((mapa at: m) at: n) y) & (celda x > 0)
	  & (celda y > 0)
]

{ #category : 'checking' }
Mundo >> estaUbicacionEnMapa: unaUbicacion [

	| x y m n |
	x := unaUbicacion x.
	y := unaUbicacion y.
	m := self mapa size.
	n := (self mapa first) size.

	^ unaUbicacion x <= ((self mapa at: m) at: n) x
	  & (unaUbicacion y <= ((mapa at: m) at: n) y) & (unaUbicacion x > 0)
	  & (unaUbicacion y > 0)
]

{ #category : 'initalize' }
Mundo >> inicializarFuenteAlimentos [

	| numAlimentos posicionesUsadas m n |
	numAlimentos := 10.
	posicionesUsadas := Set new.
	n := self mapa size.
	m := (self mapa first) size.

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

{ #category : 'initalize' }
Mundo >> inicializarHormigueros [

	| numHormigueros posicionesUsadas m n cantAlimentoPorHormiguero |
	numHormigueros := 2.
	posicionesUsadas := self posicionesUsadasConAlimentoHormiguero.

	n := self mapa size.
	m := self mapa first size.

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

			color := self class colorAleatorio colorHormiguero .

			hormiguero := Hormiguero new
				              inicializarColor: color
				              ubicacion: posicion.


			hormiguero alimento: cantAlimentoPorHormiguero.

			self colHormigueros add: hormiguero.

			((mapa at: filaRandom) at: columnaRandom) contenido: 'hormiguero' ]
]

{ #category : 'initialization' }
Mundo >> initialize [

	| tablero m n |
	super initialize .
	m:=10.
	n:=10.
	tablero := (1 to: n) collect: [ :fila | 
		           (1 to: m) collect: [ :columna | 
			           Celda punto: fila @ columna contenido: 'vacio' asString ] ].

	self mapa: tablero .

	self inicializarFuenteAlimentos.

	self inicializarHormigueros
]

{ #category : 'accessing' }
Mundo >> mapa [

	^ mapa
]

{ #category : 'accessing' }
Mundo >> mapa: anObject [

	mapa := anObject
]

{ #category : 'game logic' }
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

{ #category : 'checking' }
Mundo >> posicionesUsadasConAlimentoHormiguero [

	| posicionesUsadas |
	posicionesUsadas := Set new.

	self mapa do: [ :fila |
			posicionesUsadas addAll: (fila select: [ :celda |
					 celda contenido = 'alimento' or: celda contenido = 'hormiguero' ]) ].

	^ posicionesUsadas
]

{ #category : 'checking' }
Mundo >> tieneAlimento: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.
	
	^ ((self mapa at: fila) at: columna ) contenido = 'alimento'

	
]

{ #category : 'checking' }
Mundo >> tieneHormiguero: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.
	
	^ ((self mapa at: fila) at: columna ) contenido = 'hormiguero'

	
]

{ #category : 'checking' }
Mundo >> tieneVacio: unPuntoDeUbicacion [

	| fila columna celda |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.

	celda := (self mapa at: fila) at: columna.

	^ celda contenido = 'vacio' 
]

{ #category : 'game logic' }
Mundo >> turnoExploradora: unaExploradora [

	| ubicacionHormiguero reina contingencia |
	ubicacionHormiguero := unaExploradora colRecorridas first.
	reina := self encontrarReinaEn: ubicacionHormiguero.
	unaExploradora estado = 'explorando'
		ifTrue: [ self turnoExploradoraExplorando: unaExploradora ]
		ifFalse: [ self turnoExploradoraVolviendo: unaExploradora ].

	unaExploradora ubicacion = ubicacionHormiguero ifFalse: [ ^ self ].
	unaExploradora estado: 'explorando'.
	contingencia := unaExploradora reportarContingencia.
	reina
		actualizarContingencias: contingencia contenido
		ubicacion: contingencia punto .
		
	"unaExploradora colMensajes removeAll.
	unaExploradora colVecinos removeAll."
]

{ #category : 'game logic' }
Mundo >> turnoExploradoraExplorando: unaExploradora [

	| movimientos ubicacionHormiguero celdaEnMapa |
	ubicacionHormiguero := unaExploradora colRecorridas first.
	movimientos := 0.
	[
		unaExploradora estado = 'explorando' & (movimientos < 4)
		& ((self tieneVacio: unaExploradora ubicacion)or:(self tieneHormiguero:unaExploradora ubicacion)) ] whileTrue: [
			self moverExploradora: unaExploradora contador: 0.
			movimientos := movimientos + 1 .
			celdaEnMapa := self celdaEnMapa: unaExploradora ubicacion .
	((self tieneAlimento: unaExploradora ubicacion) or: (self tieneHormiguero: unaExploradora ubicacion))ifTrue:[unaExploradora actualizarMensajes:
celdaEnMapa. unaExploradora estado: 'volviendo'. unaExploradora colRecorridas removeAllSuchThat: [ :each |
		(unaExploradora colRecorridas indexOf: each) > 1 ].
	movimientos := 4 . ^self ] ].
	
	
]

{ #category : 'game logic' }
Mundo >> turnoExploradoraVolviendo: unaExploradora [

	| ubicacionHormiguero movimientos |
	ubicacionHormiguero := unaExploradora colRecorridas first.
	movimientos := 0.
	[
	unaExploradora ubicacion ~= ubicacionHormiguero & (movimientos < 4) ]
		whileTrue: [
				self class volverExploradora: unaExploradora.
				movimientos := movimientos + 1 ]
]

{ #category : 'game logic' }
Mundo >> turnoGuardiana: unaGuardiana [

	unaGuardiana estado = 'yendo'
		ifTrue: [ self turnoGuardianaPelea: unaGuardiana ] 
		ifFalse: [ self turnoGuardianaVuelta: unaGuardiana ]
]

{ #category : 'game logic' }
Mundo >> turnoGuardianaPelea: unaGuardiana [

	| reina hormiguero destino contador |
	reina := self encontrarReinaEn: unaGuardiana colRecorridas first.
	hormiguero := self encontrarHormigueroEn: reina ubicacion.
	destino := (reina colContingencias select: [:x | x contenido = 'hormiguero']) first punto.
	contador := 0.
	[ (contador < 2) & (unaGuardiana ubicacion ~= destino) ] whileTrue: [
			self class moverObrera: unaGuardiana aUbicacion: destino.
			contador := contador + 1 ].
	unaGuardiana ubicacion = destino ifFalse: [ ^ self ].
	(self celdaEnMapa: unaGuardiana ubicacion) contenido: 'hormigueroAtacado'.
	unaGuardiana estado: 'volviendo'.
	"reina eliminarContingencia"
]

{ #category : 'game logic' }
Mundo >> turnoGuardianaVuelta: unaGuardiana [

| reina hormiguero contador |
	reina := self encontrarReinaEn: unaGuardiana colRecorridas first.
	hormiguero := self encontrarHormigueroEn: reina ubicacion.
	contador := 0.
	[ contador < 2 & (unaGuardiana ubicacion ~= hormiguero ubicacion) ]
		whileTrue: [
				self class moverObrera: unaGuardiana aUbicacion: hormiguero ubicacion.
				contador := contador + 1 ].
	unaGuardiana ubicacion = hormiguero ubicacion ifFalse: [ ^ self ].
	unaGuardiana estado: 'yendo'
]

{ #category : 'game logic' }
Mundo >> turnoObrera: unaObrera [

	unaObrera estado = 'yendo'
		ifTrue: [ self turnoObreraIda: unaObrera ] 
		ifFalse: [ self turnoObreraVuelta: unaObrera ]
]

{ #category : 'game logic' }
Mundo >> turnoObreraIda: unaObrera [

	| reina hormiguero destino contador alimento celdaAlimento |
	reina := self encontrarReinaEn: unaObrera colRecorridas first.
	hormiguero := self encontrarHormigueroEn: reina ubicacion.
	destino := reina colContingencias first punto.
	contador := 0.
	[ contador < 3 & (unaObrera ubicacion ~= destino) ] whileTrue: [
			self class moverObrera: unaObrera aUbicacion: destino.
			contador := contador + 1 ].
	unaObrera ubicacion = destino ifFalse: [ ^ self ].
	alimento := self encontrarAlimentoEn: destino.
	unaObrera actualizarMochila: alimento.
	unaObrera estado: 'volviendo'.
	alimento cantidad = 0 ifFalse: [ ^ self ].
	celdaAlimento := self celdaEnMapa: alimento ubicacion.
	celdaAlimento contenido: 'vacio'.
	reina eliminarContingencia .
]

{ #category : 'game logic' }
Mundo >> turnoObreraVuelta: unaObrera [

	| reina hormiguero contador |
	reina := self encontrarReinaEn: unaObrera colRecorridas first.
	hormiguero := self encontrarHormigueroEn: reina ubicacion.
	contador := 0.
	unaObrera mochila > 0 ifTrue: [ contador := 2 ].
	[ contador < 3 & (unaObrera ubicacion ~= hormiguero ubicacion) ]
		whileTrue: [
				self class moverObrera: unaObrera aUbicacion: hormiguero ubicacion.
				contador := contador + 1 ].
	unaObrera ubicacion = hormiguero ubicacion ifFalse: [ ^ self ].
	hormiguero cargarAlimento: unaObrera mochila.
	unaObrera descargarMochila.
	unaObrera estado: 'yendo'
]
