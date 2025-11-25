Class {
	#name : #QuintoCell,
	#superclass : #SimpleSwitchMorph,
	#instVars : [
		'mouseAction'
	],
	#category : #'Quinto-Base'
}

{ #category : #initialization }
QuintoCell >> initialize [
	super initialize.
	self label:''.
	self borderWidth: 2.
	bounds := 0@0 corner:32@32.
	offColor := Color paleYellow .
	onColor := Color paleBlue darker .
	self useSquareCorners .
	self turnOff 
]

{ #category : #accessing }
QuintoCell >> mouseAction [

	^ mouseAction
]

{ #category : #accessing }
QuintoCell >> mouseAction: anObject [

	mouseAction := anObject
]

{ #category : #'event handling' }
QuintoCell >> mouseUp: anEvent [
	mouseAction value
]
