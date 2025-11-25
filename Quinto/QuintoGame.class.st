Class {
	#name : #QuintoGame,
	#superclass : #BorderedMorph,
	#instVars : [
		'cells'
	],
	#category : #'Quinto-Base'
}

{ #category : #initialization }
QuintoGame >> cellsPerSide [ 
	^10
]

{ #category : #accessing }
QuintoGame >> newCellAt: i at: j [

	| c origin |
	origin := self innerBounds origin.
	c := QuintoCell new.
	c position: i - 1 * c width @ (j - 1 * c height) + origin.
	c mouseAction: [ self toggleNeighboursOfCellAt: i at: j ].
	self addMorph: c .
	^ c
]

{ #category : #accessing }
QuintoGame >> toggleNeighboursOfCellAt: i at: j [

	i > 1 ifTrue: [ ((cells at: i - 1) at: j) toggleState ].
	i < self cellsPerSide ifTrue: [ ((cells at: i + 1) at: j) toggleState ].
	j > 1 ifTrue: [ ((cells at: i) at: j - 1) toggleState ].
	j < self cellsPerSide ifTrue: [ ((cells at: i) at: j + 1) toggleState ]
]
