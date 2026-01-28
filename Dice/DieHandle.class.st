Class {
	#name : 'DieHandle',
	#superclass : 'Object',
	#instVars : [
		'dice'
	],
	#category : 'Dice',
	#package : 'Dice'
}

{ #category : 'arithmetic' }
DieHandle >> + aDieHandle [
|hd3|
hd3 := self class new .

1 to: (self diceNumber) do:[:i | hd3 addDie: (self dice at: i ) copy ] .
1 to: (aDieHandle diceNumber) do:[:k | hd3 addDie: (aDieHandle dice at: k ) copy ] .

^ hd3
]

{ #category : 'adding' }
DieHandle >> addDie: aDie [
dice add: aDie
]

{ #category : 'accessing' }
DieHandle >> dice [

	^ dice
]

{ #category : 'accessing' }
DieHandle >> dice: anObject [

	dice := anObject
]

{ #category : 'accessing' }
DieHandle >> diceNumber [
^ dice size
]

{ #category : 'initialization' }
DieHandle >> initialize [ 
super initialize.

dice := OrderedCollection new 
]

{ #category : 'initialization' }
DieHandle >> roll [
|sum|
sum:= 0.
dice do: [ :x | sum:=sum+x roll ].
^ sum
]
