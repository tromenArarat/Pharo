Class {
	#name : 'Vista',
	#superclass : 'BorderedMorph',
	#instVars : [
		'nuevoMundo',
		'tablero',
		'casillasVisuales',
		'botonCerrar',
		'botonTurno',
		'hormigasMorph',
		'cajaMensaje',
		'botonMoverExploradora'
	],
	#category : 'SimuladorHormigas-Vista',
	#package : 'SimuladorHormigas',
	#tag : 'Vista'
}

{ #category : 'updating' }
Vista >> actualizar: unaCasilla enFila: fila columna: columna [

	unaCasilla ifNotNil: [ 
		unaCasilla submorphs first contents:
			((tablero at: fila) at: columna) estadoSiguiente ]
]

{ #category : 'updating' }
Vista >> actualizarCasilla: unaCasilla enFila: fila columna: columna [

	unaCasilla ifNotNil: [ 
		unaCasilla submorphs first contents:
			((tablero at: fila) at: columna) estadoSiguiente ]
]

{ #category : 'accessing' }
Vista >> botonCerrar [

	^ botonCerrar
]

{ #category : 'accessing' }
Vista >> botonCerrar: anObject [

	botonCerrar := anObject
]

{ #category : 'accessing' }
Vista >> botonMoverExploradora [

	^ botonMoverExploradora
]

{ #category : 'accessing' }
Vista >> botonMoverExploradora: anObject [

	botonMoverExploradora := anObject
]

{ #category : 'accessing' }
Vista >> botonTurno [

	^ botonTurno
]

{ #category : 'accessing' }
Vista >> botonTurno: anObject [

	botonTurno := anObject
]

{ #category : 'accessing' }
Vista >> cajaMensaje [

	^ cajaMensaje
]

{ #category : 'accessing' }
Vista >> cajaMensaje: anObject [

	cajaMensaje := anObject
]

{ #category : 'accessing' }
Vista >> casillaMorphEnFila: fila columna: columna [


	^ casillasVisuales at: fila @ columna ifAbsent: [ nil ]
]

{ #category : 'accessing' }
Vista >> casillasVisuales [

	^ casillasVisuales
]

{ #category : 'accessing' }
Vista >> casillasVisuales: anObject [

	casillasVisuales := anObject
]

{ #category : 'initialization' }
Vista >> cerrar [

	"minimiza la ventana"

	self collapse
	
]

{ #category : 'initialization' }
Vista >> construirBotoneraEnMundo: unMundo [

	| mensaje data data1 data2 |
	cajaMensaje := TextMorph new.
	"botonTurno := BotonAccion new."
	botonCerrar := BotonAccion new.
	botonMoverExploradora := BotonAccion new.

	"self addMorph: botonTurno."
	self addMorph: botonCerrar.
	self addMorph: cajaMensaje.
	self addMorph: botonMoverExploradora.

	"botonTurno position: 450 @ 550.
	botonTurno label: 'TURNO'."
	botonCerrar position: 500 @ 550.
	botonCerrar label: 'CERRAR'.
	cajaMensaje position: 600 @ 0.
	botonMoverExploradora label: 'MOVER'.
	botonMoverExploradora position: 450 @ 550.

	data := nuevoMundo mapa first first.
	data1 := nuevoMundo colHormigueros first.
	data2 := nuevoMundo colHormigueros at: 2.
	mensaje := 'Punto inicial: ' , data punto asString , ' Hormig1 '
	           , data1 ubicacion asString , ' Alime1 '
	           , data1 alimento asString , ' Hormig2 '
	           , data2 ubicacion asString , ' Alime2 '
	           , data2 alimento asString , ' Explo1 '
	           , data1 reina colExploradoras first ubicacion asString.
	cajaMensaje
		string: mensaje
		fontName: 'Arial'
		size: 12
		wrap: true.

	"botonTurno mouseAction: [
			| casilla casillaVisual |
			casilla := tablero first first.
			casillaVisual := self casillaMorphEnFila: 1 columna: 1.
			unMundo cambiarEstadoCasilla: casilla posicion.
			self actualizar: casillaVisual enFila: 1 columna: 1 ]."

	botonCerrar mouseAction: [ self cerrar ].

	botonMoverExploradora mouseAction: [
			| exploradora exploradora2|
			exploradora := self nuevoMundo colHormigueros first reina
				               colExploradoras first.
				
			exploradora2 := self nuevoMundo colHormigueros second reina
				               colExploradoras first.

			nuevoMundo moverExploradora: exploradora contador: 0.
			nuevoMundo moverExploradora: exploradora2 contador: 0.
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo ]
]

{ #category : 'initialization' }
Vista >> construirHormigasMorph [

	| exploradorasHormigueroUno exploradorasHormigueroDos hormiguero1 color1 hormiguero2 color2|
	hormigasMorph := OrderedCollection new.

	exploradorasHormigueroUno := nuevoMundo colHormigueros first reina
		                             colExploradoras.
	hormiguero1 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros first reina ubicacion.
	color1:= hormiguero1 color.
	hormiguero2 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros second reina ubicacion.
	color2:= hormiguero2 color.
	
	exploradorasHormigueroUno do: [ :hormiga |
			| hormigaMorph|
			hormigaMorph := self crearHormigaMorph: hormiga color: color1.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ] .
		
	exploradorasHormigueroDos := nuevoMundo colHormigueros second reina
		                             colExploradoras.

	exploradorasHormigueroDos do: [ :hormiga |
			| hormigaMorph |
			hormigaMorph := self crearHormigaMorph: hormiga color: color2.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ]
]

{ #category : 'initialization' }
Vista >> construirTableroVisual [

	self removeAllMorphs.
	casillasVisuales := Dictionary new.

	1 to: tablero size do: [ :fila | 
		1 to: (tablero at: 1) size do: [ :columna | 
			| casilla casillaVisual |
			casilla := (tablero at: fila) at: columna.
			casillaVisual := self
				               crearCasillaMorph: casilla
				               enFila: fila
				               columna: columna.

			"Almacenar referencia en el diccionario"
			casillasVisuales at: fila @ columna put: casillaVisual.

			self addMorph: casillaVisual ] ]
]

{ #category : 'initialization' }
Vista >> crearCasillaMorph: unaCasilla enFila: fila columna: columna [

	| origen casillaMorph textoMorph colRel filRel |
	origen := self innerBounds origin.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.


	casillaMorph := BorderedMorph new
		                borderWidth: 4;
		                borderColor: Color gray;
		                extent: 50 @ 50;
		                color: Color green;
		                position: origen + (colRel @ filRel);
		                yourself.

	"Crear texto con información"
	textoMorph := StringMorph new
		              contents: unaCasilla contenido;
		              color: Color black;
		              position: casillaMorph bounds origin + (10 @ 15);
		              yourself.

	casillaMorph addMorphBack: textoMorph.

	textoMorph contents = 'vacio' ifTrue: [ 
		casillaMorph color: Color lightOrange.
		textoMorph contents: '' ].

	textoMorph contents = 'hormiguero' ifTrue: [ 
		| hormiguero |
		hormiguero := self nuevoMundo encontrarHormigueroEn: unaCasilla punto .
		hormiguero color = 'rojo' ifTrue: [casillaMorph color: Color red.  ] ifFalse:[ casillaMorph color: Color lightGray ].
		textoMorph contents: 'Horm' ].

	textoMorph contents = 'alimento' ifTrue: [ 
		| alimento |
		alimento := self nuevoMundo encontrarAlimentoEn: fila@columna.
		casillaMorph color: Color lightYellow.
		textoMorph contents:
			alimento cantidad asString ].

	self addMorph: casillaMorph.


	unaCasilla addDependent: casillaMorph.

	^ casillaMorph
]

{ #category : 'initialization' }
Vista >> crearHormigaMorph: unaHormiga [

	| origen columna fila colRel filRel hormigaMorph hormiguere colore |
	origen := self innerBounds origin.

	fila := unaHormiga ubicacion x.
	columna:= unaHormiga ubicacion y.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.

	hormigaMorph := Morph new
		                extent: 50 @ 50;
		                color: Color lightYellow ;
		                position: origen + (colRel @ filRel).

	self addMorph: hormigaMorph.


	unaHormiga addDependent: hormigaMorph.

	^ hormigaMorph
]

{ #category : 'initialization' }
Vista >> crearHormigaMorph: unaHormiga color: unColor [

	| origen columna fila colRel filRel hormigaMorph hormiguere colore |
	origen := self innerBounds origin.

	fila := unaHormiga ubicacion x.
	columna:= unaHormiga ubicacion y.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.

	hormigaMorph := Morph new
		                extent: 50 @ 50;
		                color: Color lightYellow ;
		                position: origen + (colRel @ filRel).

	
	unColor = 'rojo' ifTrue:[ hormigaMorph color: Color red ] ifFalse:[ hormigaMorph color: Color lightGray ] .
	
	self addMorph: hormigaMorph.


	unaHormiga addDependent: hormigaMorph.

	^ hormigaMorph
]

{ #category : 'methods' }
Vista >> ejecutarTurnos [

	"Se considera que se ejecutan 10 turnos. Esto deberá flexibilizarse, solicitando al
usuario la cantidad de turnos que desea ejecutar"

	1 to: 10 do: [ :i | self ejecutarUnTurno ]
]

{ #category : 'methods' }
Vista >> ejecutarUnTurno [

	"Se ejecuta un turno del nuevoMundo"

	nuevoMundo  ejecutarTurno
]

{ #category : 'accessing' }
Vista >> hormigasMorph [

	^ hormigasMorph
]

{ #category : 'accessing' }
Vista >> hormigasMorph: anObject [

	hormigasMorph := anObject
]

{ #category : 'initialization' }
Vista >> initialize [

	"| mapa |"
	super initialize.
	self position: 45 @ 45.
	self bounds: (self position extent: 10 * 40 @ (10 * 40)).
	"mapa := Mapa new."
	"nuevoMundo := NuevoMundo nuevo: mapa."
	nuevoMundo := Mundo new.
	"nuevoMundo inicializarHormigueros.
	nuevoMundo inicializarFuenteAlimentos."
	tablero := nuevoMundo mapa.
	tablero addDependent: self.
	self construirTableroVisual.
	self construirHormigasMorph.
	self construirBotoneraEnMundo: nuevoMundo
]

{ #category : 'accessing' }
Vista >> nuevoMundo [

	^ nuevoMundo
]

{ #category : 'accessing' }
Vista >> nuevoMundo: anObject [

	nuevoMundo := anObject
]

{ #category : 'methods' }
Vista >> step [
	"nuevoMundo ejecutarUnTurno"
]

{ #category : 'accessing' }
Vista >> tablero [

	^ tablero
]

{ #category : 'accessing' }
Vista >> tablero: anObject [

	tablero := anObject
]
