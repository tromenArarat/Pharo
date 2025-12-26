Class {
	#name : #Vista,
	#superclass : #BorderedMorph,
	#instVars : [
		'tablero',
		'celdasVisuales',
		'botonCerrar',
		'botonTurno'
	],
	#category : #'ModeloVistaEjemplo-Vista'
}

{ #category : #updating }
Vista >> actualizar: unaCelda enFila: fila columna: columna [

	unaCelda ifNotNil: [ 
		 ((tablero at: fila) at: columna) contenido: unaCelda contenido ]
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

{ #category : #initialization }
Vista >> celdaMorphEnFila: fila columna: columna [
	"Devuelve la CeldaMorph en la posición especificada"
	^ celdasVisuales at: fila @ columna ifAbsent: [ nil ]
]

{ #category : #accessing }
Vista >> celdasVisuales [

	^ celdasVisuales
]

{ #category : #accessing }
Vista >> celdasVisuales: anObject [

	celdasVisuales := anObject
]

{ #category : #initialization }
Vista >> cerrar [

	"minimiza la ventana"

	self collapse
	
]

{ #category : #initialization }
Vista >> construirTableroVisual [

	self removeAllMorphs.
	celdasVisuales := Dictionary new.

	1 to: tablero size do: [ :fila | 
		1 to: (tablero at: 1) size do: [ :columna | 
			| celda celdaVisual |
			celda := (tablero at: fila) at: columna.
			celdaVisual := self
				               crearCeldaMorph: celda
				               enFila: fila
				               columna: columna.

			"Almacenar referencia en el diccionario"
			celdasVisuales at: fila @ columna put: celdaVisual.

			self addMorph: celdaVisual ] ].

	botonTurno := BotonAccion new.
	botonCerrar := BotonAccion new.

	self addMorph: botonTurno.
	self addMorph: botonCerrar.

	botonTurno position: 450 @ 550.
	botonTurno label: 'TURNO'.
	botonCerrar position: 500 @ 550.
	botonCerrar label: 'CERRAR'.

	botonTurno mouseAction: [ 
		| celdaVisual |
		celdaVisual := self celdaMorphEnFila: 1 columna: 1.
		celdaVisual submorphs first contents: 'hormiguero' ].

	botonCerrar mouseAction: [ self cerrar ]
]

{ #category : #initialization }
Vista >> crearCeldaMorph: unaCelda enFila: fila columna: columna [

	| origen celdaMorph textoMorph colRel filRel |
	origen := self innerBounds origin.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.


	celdaMorph := BorderedMorph new
		              borderWidth: 10;
		              borderColor: Color gray;
		              extent: 50 @ 50;
		              color: Color white;
		              position: origen + (colRel @ filRel);
		              yourself.

	"Crear texto con información"
	textoMorph := StringMorph new
		              contents: unaCelda contenido;
		              color: Color black;
		              position: celdaMorph bounds origin + (10 @ 15);
		              yourself.

	celdaMorph addMorphBack: textoMorph.

	self addMorph: celdaMorph.


	unaCelda addDependent: celdaMorph.

	^ celdaMorph
]

{ #category : #initialization }
Vista >> initialize [

	| mapa nuevoMundo  |
	super initialize.
	self position: 45 @ 45.

	"Calculate bounds based on board size (10x10 cells of 40x40 each)"
	self bounds: (self position extent: 10 * 40 @ (10 * 40)).

	"Create the game world with a new map"

	mapa := Mapa new.

	nuevoMundo := NuevoMundo nuevo: mapa.
	tablero := nuevoMundo mapa.

	tablero addDependent: self.

	"Build the visual board"
	self construirTableroVisual
]

{ #category : #accessing }
Vista >> tablero [

	^ tablero
]

{ #category : #accessing }
Vista >> tablero: anObject [

	tablero := anObject
]
