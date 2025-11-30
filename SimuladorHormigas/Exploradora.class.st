Class {
	#name : #Exploradora,
	#superclass : #Object,
	#instVars : [
		'color',
		'mundo',
		'hormiguero',
		'ubicacion',
		'celdaDestino',
		'colRecorridas'
	],
	#category : #SimuladorHormigas
}

{ #category : #accessing }
Exploradora >> celdaDestino [

	^ celdaDestino
]

{ #category : #accessing }
Exploradora >> celdaDestino: anObject [

	celdaDestino := anObject
]

{ #category : #accessing }
Exploradora >> colRecorridas [

	^ colRecorridas
]

{ #category : #accessing }
Exploradora >> colRecorridas: anObject [

	colRecorridas := anObject
]

{ #category : #accessing }
Exploradora >> color [

	^ color
]

{ #category : #accessing }
Exploradora >> color: anObject [

	color := anObject
]

{ #category : #moves }
Exploradora >> estaDentroDelMundo: unaUbicacion [

	"Verifica si una ubicación está dentro de los límites del mundo"

	| mundoActual |
	mundoActual := self mundo.

	^ (unaUbicacion x between: 1 and: mundoActual m) and: [ 
		  unaUbicacion y between: 1 and: mundoActual n ]
]

{ #category : #accessing }
Exploradora >> hormiguero [

	^ hormiguero
]

{ #category : #accessing }
Exploradora >> hormiguero: anObject [

	hormiguero := anObject
]

{ #category : #moves }
Exploradora >> moverAleatorio [
    "Mueve la exploradora a una celda vecina aleatoria que esté dentro del mundo y no haya sido transitada"

    | vecinosDisponibles posiblesMovimientos nuevaUbicacion |
    vecinosDisponibles := OrderedCollection new.

    "Generar todas las posibles celdas vecinas usando la clase Ubicacion"
    posiblesMovimientos := { 
        (Ubicacion x: self ubicacion x y: self ubicacion y + 1). "Arriba"
        (Ubicacion x: self ubicacion x y: self ubicacion y - 1). "Abajo"
        (Ubicacion x: self ubicacion x + 1 y: self ubicacion y). "Derecha"
        (Ubicacion x: self ubicacion x - 1 y: self ubicacion y) "Izquierda" }.

    "Filtrar las celdas que están dentro del mundo y no han sido transitadas"
    posiblesMovimientos do: [ :vecino | 
        (self estaDentroDelMundo: vecino) ifTrue: [ 
            (self colRecorridas includes: vecino) ifFalse: [ 
                vecinosDisponibles add: vecino ] ] ].

    "Si hay vecinos disponibles, elegir uno al azar y moverse"
    vecinosDisponibles isEmpty
        ifFalse: [ 
            nuevaUbicacion := vecinosDisponibles atRandom.
            self ubicacion: nuevaUbicacion.
            self colRecorridas add: nuevaUbicacion ]
        ifTrue: [ "No hay movimientos posibles - la exploradora está atrapada"
         ]
]

{ #category : #accessing }
Exploradora >> mundo [

	^ mundo
]

{ #category : #accessing }
Exploradora >> mundo: anObject [

	mundo := anObject
]

{ #category : #accessing }
Exploradora >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Exploradora >> ubicacion: anObject [

	ubicacion := anObject
]
