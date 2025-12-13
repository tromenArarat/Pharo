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

Transcript clear .
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

{ #category : #accessing }
Mundo >> mapa [

	^ mapa
]

{ #category : #accessing }
Mundo >> mapa: anObject [

	mapa := anObject
]
