"
`Counter` is a simple concrete class which supports incrementing and
decrementing.
Its API is
- `decrement` and `increment`
- `count`
Its creation message is `startAt:`
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #'class initialization' }
Counter class >> startingAt: anInteger [

	| c |
	c := self new.
	c count: anInteger.
	^ c
]

{ #category : #accessing }
Counter >> count [

	^ count
]

{ #category : #accessing }
Counter >> count: anObject [

	count := anObject
]

{ #category : #operation }
Counter >> decrement [

	count := count - 1
]

{ #category : #operation }
Counter >> increment [
	count := count +1
]
