Class {
	#name : 'EVariable',
	#superclass : 'EExpression',
	#instVars : [
		'id'
	],
	#category : 'Expressions',
	#package : 'Expressions'
}

{ #category : 'public access' }
EVariable >> evaluate [
    ^ self evaluateWith: Dictionary new
]

{ #category : 'accessing' }
EVariable >> evaluateWith: aBindingDictionary [
^ aBindingDictionary at: id
]

{ #category : 'accessing' }
EVariable >> id: aSymbol [
id := aSymbol
]

{ #category : 'accessing' }
EVariable >> printOn: aStream [
aStream nextPutAll: id asString
]
