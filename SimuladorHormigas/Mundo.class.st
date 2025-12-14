"
El mundo es donde la simulación comienza. Es la clase encargada de crear hormigueros y fuentes de alimento

Los primeros comandos para crear el mapa del mundo, crear un hormiguero y completar sus atributos de instancia son los siguientes:

mundo := Mundo new .

mundo inicializarMundoConFilas: 10 columnas: 10 .

hormiguero := mundo colHormigueros at:1 .

hormiguero mundo: mundo.

hormiguero .

hormiguero color: 'rojo' .

hormiguero ubicacion  .

mundo mapa .

((mundo mapa at:1 ) at:1) .

((mundo mapa at:1 ) at:1) contenido: 'hormiguero'.

hormiguero ubicacion: ((mundo mapa at:1 ) at:1).

mundo colHormigueros: OrderedCollection new.

mundo colHormigueros add: hormiguero .

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

mundo moverHormiga: robinson .

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

mundo estaEnMapa: celda .

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
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Mundo class >> posRandom: unaUbicacion [

	| x y ejeRandom movimientoRandom |
	x := unaUbicacion x.
	y := unaUbicacion y.

	ejeRandom := Random new nextInteger: 2.

	movimientoRandom := Random new nextInteger: 2.

	ejeRandom = 1
		ifTrue: [ 
			x := movimientoRandom = 1
				     ifTrue: [ x - 1 ]
				     ifFalse: [ x + 1 ] ]
		ifFalse: [ 
			y := movimientoRandom = 1
				     ifTrue: [ y - 1 ]
				     ifFalse: [ y + 1 ] ].

	^ unaUbicacion
		  x: x;
		  y: y
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

{ #category : #'game logic' }
Mundo >> encontrarReinaEn: unaUbicacion [

	"Retorna la reina que se encuentra en la ubicación especificada"

	^ self hormigas
		  detect: [ :hormiga | 
			  (hormiga class: Hormiga) and: [ 
				  hormiga ubicacion = unaUbicacion ] ]
		  ifNone: [ nil ]
]

{ #category : #initalize }
Mundo >> estaEnMapa: celda [

	| x y m n |
	x := celda x.
	y := celda y.
	m := mapa size.
	n := (mapa at: 1) size.

	^ celda x <= ((mapa at: m) at: n) x
	  & (celda y <= ((mapa at: m) at: n) y)
		& (celda x >= ((mapa at: 1) at: 1) x)
	  & (celda y >= ((mapa at: 1) at: 1) y)
]

{ #category : #initalize }
Mundo >> inicializarMundoConFilas: n columnas: m [

	| tablero |
	tablero := OrderedCollection new.

	1 to: n do: [ :fila | 
		| filaCeldas |
		filaCeldas := OrderedCollection new.

		1 to: m do: [ :columna | 
			filaCeldas add: (Celda new
					 x: fila;
					 y: columna;
					 contenido: 'vacío';
					 yourself) ].

		tablero add: filaCeldas ].

	self mapa: tablero
]

{ #category : #initalize }
Mundo >> initialize [

	| tablero m n|
	tablero := OrderedCollection new.
	m := 10 .
	n := 10 .

	1 to: n do: [ :fila | 
		| filaCeldas |
		filaCeldas := OrderedCollection new.

		1 to: m do: [ :columna | 
			filaCeldas add: (Celda new
					 x: fila;
					 y: columna;
					 contenido: 'vacío';
					 yourself) ].

		tablero add: filaCeldas ].

	self mapa: tablero
]

{ #category : #accessing }
Mundo >> mapa [

	^ mapa
]

{ #category : #accessing }
Mundo >> mapa: anObject [

	mapa := anObject
]

{ #category : #initalize }
Mundo >> moverHormiga: hormiga [

	" Este método debe mover la hormiga en cualquier dirección distinta a la de su posición actual y evitar pasar por las posiciones ya transitadas (colRecorridas).

- Que reciba la posicion actual y la colección de recorridas y elija una opción al azar.
- Chequear si la posición está en el mapa. (estaEnMapa: unaCelda)
- Actualizar colRecorridas "

	| posActual recorridas posAleatoria contador |
	posActual := hormiga ubicacion.
	recorridas := hormiga colRecorridas.
	posAleatoria := mapa posRandom: posActual.
	contador := 0 .

	(self mapa estaEnMapa: posAleatoria) 
		ifTrue: [ 
			(hormiga estaEnRecorridas: posAleatoria & contador<4)
				ifTrue: [ contador +=1 .
					self moverHormiga: hormiga ]
				ifFalse: [ hormiga ubicacion: posAleatoria.
					hormiga colRecorridas add: posAleatoria ] ]
			ifFalse: [self moverHormiga: hormiga]
]
