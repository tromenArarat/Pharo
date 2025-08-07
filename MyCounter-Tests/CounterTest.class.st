Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#category : #'MyCounter-Tests-Base'
}

{ #category : #tests }
CounterTest >> testCountIsSetAndRead [
	| c |
	c := Counter new.
	c count: 7.
	self assert: c count equals: 7
]

{ #category : #tests }
CounterTest >> testCounterDecrement [

	| c |
	c := Counter startingAt: 5.
	c
		increment;
		decrement.
	self assert: c count equals: 5
]

{ #category : #tests }
CounterTest >> testCounterIncrement [
	| c |
	c := Counter startingAt: 5 .
	c increment; increment .
	self assert: c count equals: 7
]

{ #category : #tests }
CounterTest >> testCounterStartingAt5 [

	| c |
	c := Counter startingAt: 5.
	self assert: c count equals: 5
]
