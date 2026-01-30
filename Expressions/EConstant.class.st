Class {
	#name : 'EConstant',
	#superclass : 'EExpression',
	#instVars : [
		'value'
	],
	#category : 'Expressions',
	#package : 'Expressions'
}

{ #category : 'samples' }
EConstant class >> constant3 [
<sampleInstance>
^ self new value: 3
]

{ #category : 'samples' }
EConstant class >> constant5 [
<sampleInstance>
^ self new value: 5
]

{ #category : 'accessing' }
EConstant class >> value: anInteger [
^ self new value: anInteger
]

{ #category : 'accessing' }
EConstant >> evaluate [

	^ value
]

{ #category : 'printing' }
EConstant >> printOn: aStream [
aStream nextPutAll: value printString
]

{ #category : 'accessing' }
EConstant >> value: anInteger [

	value := anInteger
]
