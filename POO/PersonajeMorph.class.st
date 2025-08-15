Class {
	#name : #PersonajeMorph,
	#superclass : #Morph,
	#instVars : [
		'personaje',
		'stepTime'
	],
	#category : #'POO-morphs'
}

{ #category : #initialization }
PersonajeMorph >> drawOn: aCanvas [
    personaje drawOn: aCanvas
]

{ #category : #initialization }
PersonajeMorph >> initialize [
    | sprites |
super initialize.
    personaje := Personaje new.
    personaje setSprites: sprites. "Your sprite collection"
    stepTime := 16. "milliseconds between steps (~60 FPS)"
    self position: 100@100.
    self startStepping.
]

{ #category : #initialization }
PersonajeMorph >> step [
    personaje update.
    self changed. "Trigger redraw"
]

{ #category : #initialization }
PersonajeMorph >> stepTime [
    "Return the time between steps in milliseconds"
    ^ stepTime
]
