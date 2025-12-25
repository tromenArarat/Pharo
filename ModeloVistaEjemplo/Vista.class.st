Class {
	#name : #Vista,
	#superclass : #BorderedMorph,
	#instVars : [
		'tablero',
		'botonCerrar'
	],
	#category : #'ModeloVistaEjemplo-Vista'
}

{ #category : #updating }
Vista >> actualizar: unaCelda enFila: fila columna: columna [

	unaCelda ifNotNil: [ 
		((tablero at: fila) at: columna) contenido: unaCelda contenido ]
]

{ #category : #initialization }
Vista >> cerrar [

	"minimiza la ventana"

	self collapse
	
]

{ #category : #initialization }
Vista >> construirTableroVisual [

	"Builds the graphical interface of the board"

	self removeAllMorphs.

	1 to: tablero size do: [ :filaIndex | 
		1 to: (tablero at: 1) size do: [ :columnaIndex | 
			| celda celdaVisual |
			celda := (tablero at: filaIndex) at: columnaIndex.
			celdaVisual := self
				               crearCeldaMorph: celda
				               enFila: filaIndex
				               columna: columnaIndex.
			self
				actualizar: celda
				enFila: filaIndex
				columna: columnaIndex.
			self addMorph: celdaVisual ] ]
]

{ #category : #initialization }
Vista >> crearCeldaMorph: unaCelda enFila: filaIndex columna: columnaIndex [

	| celdaMorph textoMorph |
	celdaMorph := BorderedMorph new
		              borderWidth: 10;
		              borderColor: Color gray;
		              extent: 40 @ 40;
		              color: Color white;
		              position: (columnaIndex - 1) * 40 @ ((filaIndex - 1) * 40);
		              yourself.

	"Crear texto con información"
	textoMorph := StringMorph new
		              contents: unaCelda contenido;
		              color: Color black;
		              position: celdaMorph bounds origin + (5 @ 5);
		              yourself.

	celdaMorph addMorphBack: textoMorph.

	self addMorph: celdaMorph.

	^ celdaMorph
]

{ #category : #initialization }
Vista >> initialize [

	| origen nuevoMundo |
	super initialize.
	self position: 45 @ 45.

	"Calculate bounds based on board size (10x10 cells of 40x40 each)"
	self bounds: (self position extent: 10 * 40 @ (10 * 40)).

	"Create the game world with a new map"
	nuevoMundo := NuevoMundo nuevo: Mapa new.
	tablero := nuevoMundo mapa.

	botonCerrar := BotonAccion new.

	self addMorph: botonCerrar.

	origen := self innerBounds origin.
	botonCerrar position: origen + (100 @ 40).
	botonCerrar label: 'CERRAR'.

	tablero addDependent: self.

	"Build the visual board"
	self construirTableroVisual.


	botonCerrar mouseAction: [ self cerrar ]
]

{ #category : #accessing }
Vista >> tablero [

	^ tablero
]

{ #category : #accessing }
Vista >> tablero: anObject [

	tablero := anObject
]
