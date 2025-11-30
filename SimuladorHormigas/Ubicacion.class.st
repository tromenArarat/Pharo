Class {
	#name : #Ubicacion,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'contenido'
	],
	#category : #SimuladorHormigas
}

{ #category : #'instance creation' }
Ubicacion class >> x: xValue y: yValue [
    ^ self new
        x: xValue;
        y: yValue;
        yourself
]

{ #category : #'instance creation' }
Ubicacion class >> x: coordX y: coordY contenido: unContenido [
    "Crea una nueva instancia de Ubicacion con las coordenadas y contenido especificados"
    
    ^ self new
        x: coordX;
        y: coordY;
        contenido: unContenido;
        yourself
]

{ #category : #accessing }
Ubicacion >> contenido [

	^ contenido
]

{ #category : #accessing }
Ubicacion >> contenido: anObject [

	contenido := anObject
]

{ #category : #accessing }
Ubicacion >> x [

	^ x
]

{ #category : #accessing }
Ubicacion >> x: anObject [

	x := anObject
]

{ #category : #accessing }
Ubicacion >> y [

	^ y
]

{ #category : #accessing }
Ubicacion >> y: anObject [

	y := anObject
]
