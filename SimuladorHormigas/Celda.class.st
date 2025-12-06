Class {
	#name : #Celda,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'contenido'
	],
	#category : #SimuladorHormigas
}

{ #category : #'instance creation' }
Celda class >> x: xValue y: yValue [
    ^ self new
        x: xValue;
        y: yValue;
        yourself
]

{ #category : #'instance creation' }
Celda class >> x: coordX y: coordY contenido: unContenido [
    "Crea una nueva instancia de Ubicacion con las coordenadas y contenido especificados"
    
    ^ self new
        x: coordX;
        y: coordY;
        contenido: unContenido;
        yourself
]

{ #category : #accessing }
Celda >> contenido [

	^ contenido
]

{ #category : #accessing }
Celda >> contenido: anObject [

	contenido := anObject
]

{ #category : #accessing }
Celda >> x [

	^ x
]

{ #category : #accessing }
Celda >> x: anObject [

	x := anObject
]

{ #category : #accessing }
Celda >> y [

	^ y
]

{ #category : #accessing }
Celda >> y: anObject [

	y := anObject
]
