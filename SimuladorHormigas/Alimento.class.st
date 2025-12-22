"
Creado por Mapa, que asigna ubicación y cantidad de cada fuente de alimento.
"
Class {
	#name : #Alimento,
	#superclass : #Object,
	#instVars : [
		'ubicacion',
		'cantidad'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #accessing }
Alimento >> cantidad [

	^ cantidad
]

{ #category : #accessing }
Alimento >> cantidad: anObject [

	cantidad := anObject
]

{ #category : #reducing }
Alimento >> restarCantidad [

self cantidad: self cantidad -1
]

{ #category : #accessing }
Alimento >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Alimento >> ubicacion: anObject [

	ubicacion := anObject
]
