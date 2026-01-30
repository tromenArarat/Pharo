Class {
	#name : 'EExpression',
	#superclass : 'Object',
	#instVars : [
		'negated'
	],
	#category : 'Expressions',
	#package : 'Expressions'
}

{ #category : 'arithmetic' }
EExpression >> negated [
^ ENegation new expression: self
]
