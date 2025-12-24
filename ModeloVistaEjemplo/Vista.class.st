Class {
	#name : #Vista,
	#superclass : #BorderedMorph,
	#instVars : [
		'tablero'
	],
	#category : #'ModeloVistaEjemplo-Vista'
}

{ #category : #initialization }
Vista >> construirTableroVisual [

	"Construye la interfaz gráfica del tablero"

	self removeAllMorphs.

	tablero := tablero doWithIndex: [ :fila :x | 
		           fila doWithIndex: [ :columna :y | 
			           [ 
			           | celda celdaVisual |
			           celda := (tablero at: x) at: y.
			           celdaVisual := self
				                          crearCeldaMorph: celda
				                          enFila: x
				                          columna: y.
			           celda addDependent: self ] ] ]
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

	"Dado que Vista es subclase de BorderedMorph, es necesario asegurar que se realizarán
todas las inicializaciones necesarias relacionadas a variables y comportamiento heredado"

	super initialize.
	"Se establece el color del elemento gráfico, y su posición en la pantalla, o sea el WORLD. La
posición para este morph es la esquina superior izquierda del recuadro. El método 'extent' es para
indicar el ancho y alto del recuadro "
	self color: Color gray.
	self position: 45 @ 45.
	self bounds: (self position extent: 800 @ 800).

	"1. Crear el modelo (la clase que tiene el método initialize se llama Modelo)"
	tablero := Modelo nuevo: Mapa new.
	
	tablero := tablero mapa.

	"2. Configurar la dependencia"
	tablero addDependent: self.

	"3. Actualizar la vista inicialmente"
	self update: tablero.

	"4. Visualizar el tablero en el morph"
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
