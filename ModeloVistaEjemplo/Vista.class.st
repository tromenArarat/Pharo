Class {
	#name : #Vista,
	#superclass : #BorderedMorph,
	#instVars : [
		'nuevoMundo',
		'tablero',
		'casillasVisuales',
		'botonCerrar',
		'botonTurno',
		'hormigasMorph',
		'cajaMensaje'
	],
	#category : #'ModeloVistaEjemplo-Vista'
}

{ #category : #updating }
Vista >> actualizar: unaCasilla enFila: fila columna: columna [

	unaCasilla ifNotNil: [ 
		unaCasilla submorphs first contents:
			((tablero at: fila) at: columna) estadoSiguiente ]
]

{ #category : #updating }
Vista >> actualizarCasilla: unaCasilla enFila: fila columna: columna [

	unaCasilla ifNotNil: [ 
		unaCasilla submorphs first contents:
			((tablero at: fila) at: columna) estadoSiguiente ]
]

{ #category : #accessing }
Vista >> botonCerrar [

	^ botonCerrar
]

{ #category : #accessing }
Vista >> botonCerrar: anObject [

	botonCerrar := anObject
]

{ #category : #accessing }
Vista >> botonTurno [

	^ botonTurno
]

{ #category : #accessing }
Vista >> botonTurno: anObject [

	botonTurno := anObject
]

{ #category : #accessing }
Vista >> casillaMorphEnFila: fila columna: columna [


	^ casillasVisuales at: fila @ columna ifAbsent: [ nil ]
]

{ #category : #accessing }
Vista >> casillasVisuales [

	^ casillasVisuales
]

{ #category : #accessing }
Vista >> casillasVisuales: anObject [

	casillasVisuales := anObject
]

{ #category : #initialization }
Vista >> cerrar [

	"minimiza la ventana"

	self collapse
	
]

{ #category : #initialization }
Vista >> construirBotoneraEnMundo: unMundo [

	| mensaje data |
	cajaMensaje := TextMorph new.
	botonTurno := BotonAccion new.
	botonCerrar := BotonAccion new.

	self addMorph: botonTurno.
	self addMorph: botonCerrar.
	self addMorph: cajaMensaje.

	botonTurno position: 450 @ 550.
	botonTurno label: 'TURNO'.
	botonCerrar position: 500 @ 550.
	botonCerrar label: 'CERRAR'.
	cajaMensaje position: 600 @ 0.

	data := ((nuevoMundo mapa at: 1) at: 1) posicion asString.
	mensaje := 'Punto inicial: ' , data.
	cajaMensaje
		string: mensaje
		fontName: 'Arial'
		size: 12
		wrap: true.

	botonTurno mouseAction: [ 
		| casilla casillaVisual |
		casilla := (tablero at: 1) at: 1.
		casillaVisual := self casillaMorphEnFila: 1 columna: 1.
		unMundo cambiarEstadoCasilla: casilla posicion.
		self actualizar: casillaVisual enFila: 1 columna: 1 ].

	botonCerrar mouseAction: [ self cerrar ]
]

{ #category : #initialization }
Vista >> construirHormigasMorph [

	| exploradorasHormigueroUno |
	hormigasMorph := OrderedCollection new.

	exploradorasHormigueroUno := (nuevoMundo colHormigueros at: 1) reina
		                             colExploradoras.

	exploradorasHormigueroUno do: [ :hormiga | 
		| hormigaMorph |
		hormigaMorph := self crearHormigaMorph: hormiga.

		hormigasMorph add: hormigaMorph.

		self addMorph: hormigaMorph ]
]

{ #category : #initialization }
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

{ #category : #initialization }
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
		              contents: unaCasilla estadoActual;
		              color: Color black;
		              position: casillaMorph bounds origin + (10 @ 15);
		              yourself.

	casillaMorph addMorphBack: textoMorph.

	textoMorph contents = 'vacia' ifTrue: [ 
		casillaMorph color: Color lightOrange.
		textoMorph contents: '' ].

	textoMorph contents = 'hormiguero' ifTrue: [ 
		casillaMorph color: Color lightCyan.
		textoMorph contents: 'Horm' ].

	textoMorph contents = 'alimento' ifTrue: [ 
		| alimento |
		alimento := nuevoMundo encontrarAlimentoEn: unaCasilla posicion.
		casillaMorph color: Color lightYellow.
		textoMorph contents:
			alimento cantidad asString ].

	self addMorph: casillaMorph.


	unaCasilla addDependent: casillaMorph.

	^ casillaMorph
]

{ #category : #initialization }
Vista >> crearHormigaMorph: unaHormiga [

	| origen columna fila colRel filRel hormigaMorph |
	origen := self innerBounds origin.

	fila := unaHormiga ubicacion x.
	columna:= unaHormiga ubicacion y.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.

	hormigaMorph := Morph new
		                extent: 50 @ 50;
		                color: Color red;
		                position: origen + (colRel @ filRel).

	self addMorph: hormigaMorph.


	unaHormiga addDependent: hormigaMorph.

	^ hormigaMorph
]

{ #category : #methods }
Vista >> ejecutarTurnos [

	"Se considera que se ejecutan 10 turnos. Esto deberá flexibilizarse, solicitando al
usuario la cantidad de turnos que desea ejecutar"

	1 to: 10 do: [ :i | self ejecutarUnTurno ]
]

{ #category : #methods }
Vista >> ejecutarUnTurno [

	"Se ejecuta un turno del nuevoMundo"

	nuevoMundo  ejecutarTurno
]

{ #category : #accessing }
Vista >> hormigasMorph [

	^ hormigasMorph
]

{ #category : #accessing }
Vista >> hormigasMorph: anObject [

	hormigasMorph := anObject
]

{ #category : #initialization }
Vista >> initialize [

	| mapa |
	super initialize.
	self position: 45 @ 45.
	self bounds: (self position extent: 10 * 40 @ (10 * 40)).
	mapa := Mapa new.
	nuevoMundo := NuevoMundo nuevo: mapa.
	nuevoMundo inicializarHormigueros.
	nuevoMundo inicializarFuenteAlimentos.
	tablero := nuevoMundo mapa.
	tablero addDependent: self.
	self construirTableroVisual.
	self construirHormigasMorph.
	self construirBotoneraEnMundo: nuevoMundo
]

{ #category : #accessing }
Vista >> nuevoMundo [

	^ nuevoMundo
]

{ #category : #accessing }
Vista >> nuevoMundo: anObject [

	nuevoMundo := anObject
]

{ #category : #methods }
Vista >> step [

	nuevoMundo ejecutarUnTurno
]

{ #category : #accessing }
Vista >> tablero [

	^ tablero
]

{ #category : #accessing }
Vista >> tablero: anObject [

	tablero := anObject
]
