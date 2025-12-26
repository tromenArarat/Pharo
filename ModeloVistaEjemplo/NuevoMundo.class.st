Class {
	#name : #NuevoMundo,
	#superclass : #Object,
	#instVars : [
		'mapa'
	],
	#category : #'ModeloVistaEjemplo-Modelo'
}

{ #category : #constructor }
NuevoMundo class >> nuevo: unMapa [

	^ self new mapa: unMapa
]

{ #category : #accessing }
NuevoMundo >> cambiarContenidoCelda: ubicacion [

|celda |
celda := self celdaEnMapa: ubicacion .

celda contenido: 'hormiguero'.
self changed
]

{ #category : #accessing }
NuevoMundo >> celdaEnMapa: unPuntoDeUbicacion [

	| fila columna |
	fila := unPuntoDeUbicacion x.
	columna := unPuntoDeUbicacion y.

	^ (self mapa at: fila) at: columna
]

{ #category : #accessing }
NuevoMundo >> mapa [

	^ mapa
]

{ #category : #accessing }
NuevoMundo >> mapa: anObject [

	mapa := anObject
]
