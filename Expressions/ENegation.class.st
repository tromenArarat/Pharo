Class {
	#name : 'ENegation',
	#superclass : 'EExpression',
	#instVars : [
		'expression'
	],
	#category : 'Expressions',
	#package : 'Expressions'
}

{ #category : 'instance creation' }
ENegation class >> expression: anExpression [
^ self new expression: anExpression
]

{ #category : 'public access' }
ENegation >> evaluate [
^ expression evaluate negated
]

{ #category : 'accessing' }
ENegation >> expression [

	^ expression
]

{ #category : 'accessing' }
ENegation >> expression: anExpression [

	expression := anExpression
]

{ #category : 'arithmetic' }
ENegation >> negated [ 
(self class = ENegation) ifTrue:[^ self expression] ifFalse: [ ^ super negated ]
]

{ #category : 'printing' }
ENegation >> printOn: aStream [
aStream nextPutAll: '- '.
expression printOn: aStream
]
