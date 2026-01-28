Class {
	#name : 'Die',
	#superclass : 'Object',
	#instVars : [
		'faces'
	],
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'initialization' }
Die class >> withFaces: aNumber [
"Create and initialize a new die with aNumber faces."
| instance |
instance := self new.
instance faces: aNumber.
^ instance

"equivalent to: 
^ self new faces: aNumber; yourself "

]

{ #category : 'initialization' }
Die >> faces [
^ faces
]

{ #category : 'accessing' }
Die >> faces: aNumber [

	faces := aNumber
]

{ #category : 'initialization' }
Die >> initialize [
super initialize .
faces:= 6
]

{ #category : 'printing' }
Die >> printOn: aStream [

	super printOn: aStream.
aStream nextPutAll: ' ('.
aStream print: faces.
aStream nextPutAll: ')'
]

{ #category : 'initialization' }
Die >> roll [
^ self faces atRandom
]
