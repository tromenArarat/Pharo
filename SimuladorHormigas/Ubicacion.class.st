Class {
	#name : #Ubicacion,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
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
