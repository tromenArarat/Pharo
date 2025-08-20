"
Juego de la vida es un código provisto por la cátedra Programación Orientada a Objetos - Facultad de Informática - Universidad Nacional del Comahue.
"
Class {
	#name : #CelulaVisual,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'mouseAction',
		'miCelula'
	],
	#category : #'Juego-de-la-Vida-morph'
}

{ #category : #initialization }
CelulaVisual >> initialize [
"Se inicializa la celula visual. El offColor corresponde a una celula muerta y el onColor corresponde a una celula viva"
super initialize.
self label: ''.
self borderWidth: 2.
bounds := 0@0 corner: 12@12.
offColor := Color yellow.
onColor := Color black.
self useSquareCorners.
self turnOff
]

{ #category : #methods }
CelulaVisual >> mouseAction: unBloque [
"El parametro es un bloque en el que se indica la accion que se debe ejecutar cuando se acciones sobre el botón"
mouseAction := unBloque.
]

{ #category : #methods }
CelulaVisual >> mouseUp: unEvento [

	"Se toman las inicializacions de la superclase, y se evalua el bloque mouseAction, que es el bloque en el que se indica qué accioón ejecutar, y que fue seteado en el método 'mouseAction:', que se activó desde el inicializar de JuegoVidaVisual "

	super mouseUp: unEvento.
	mouseAction value
]

{ #category : #methods }
CelulaVisual >> update: unObjeto [

"En este método la celula visual decide, en función del estado de su objeto modelo, que es el que recibe como parámetro, como debe actualizarse"

	unObjeto verificarVida
		ifTrue: [ self turnOn ]
		ifFalse: [ self turnOff ]
]
