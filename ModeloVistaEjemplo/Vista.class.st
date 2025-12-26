Class {
	#name : #Vista,
	#superclass : #BorderedMorph,
	#instVars : [
		'nuevoMundo',
		'tablero',
		'casillasVisuales',
		'botonCerrar',
		'botonTurno'
	],
	#category : #'ModeloVistaEjemplo-Vista'
}

{ #category : #updating }
Vista >> actualizar: unaCelda enFila: fila columna: columna [

	unaCelda ifNotNil: [ 
		unaCelda submorphs first contents: ((tablero at: fila) at: columna) estadoSiguiente ]
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

{ #category : #initialization }
Vista >> cerrar [

	"minimiza la ventana"

	self collapse
	
]

{ #category : #initialization }
Vista >> construirBotoneraEnMundo: unMundo [

	botonTurno := BotonAccion new.
	botonCerrar := BotonAccion new.

	self addMorph: botonTurno.
	self addMorph: botonCerrar.

	botonTurno position: 450 @ 550.
	botonTurno label: 'TURNO'.
	botonCerrar position: 500 @ 550.
	botonCerrar label: 'CERRAR'.

	botonTurno mouseAction: [ 
		| casilla casillaVisual |
		casilla := (tablero at: 1) at: 1.
		casillaVisual := self casillaMorphEnFila: 1 columna: 1.
		unMundo cambiarEstadoCasilla: casilla posicion.
		self actualizar: casillaVisual enFila: 1 columna: 1 ].

	botonCerrar mouseAction: [ self cerrar ]
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
		              borderWidth: 10;
		              borderColor: Color gray;
		              extent: 50 @ 50;
		              color: Color white;
		              position: origen + (colRel @ filRel);
		              yourself.

	"Crear texto con información"
	textoMorph := StringMorph new
		              contents: unaCasilla estadoActual;
		              color: Color black;
		              position: casillaMorph bounds origin + (10 @ 15);
		              yourself.

	casillaMorph addMorphBack: textoMorph.

	self addMorph: casillaMorph.


	unaCasilla addDependent: casillaMorph.

	^ casillaMorph
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

{ #category : #initialization }
Vista >> initialize [

	| mapa |
	super initialize.
	self position: 45 @ 45.

	"Calculate bounds based on board size (10x10 cells of 40x40 each)"
	self bounds: (self position extent: 10 * 40 @ (10 * 40)).

	"Create the game world with a new map"

	mapa := Mapa new.

	nuevoMundo := NuevoMundo nuevo: mapa.
	nuevoMundo inicializarHormigueros.
	nuevoMundo inicializarFuenteAlimentos.
	tablero := nuevoMundo mapa.

	tablero addDependent: self.

	"Build the visual board"
	self construirTableroVisual.

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
