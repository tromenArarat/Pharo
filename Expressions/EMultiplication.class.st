Class {
	#name : 'EMultiplication',
	#superclass : 'EExpression',
	#instVars : [
		'left',
		'right'
	],
	#category : 'Expressions',
	#package : 'Expressions'
}

{ #category : 'samples' }
EMultiplication class >> fiveTimesThree [
<sampleInstance>
| ep1 ep2 |
ep1 := EConstant constant5.
ep2 := EConstant constant3.
^ self new left: ep1 ; right: ep2
]

{ #category : 'instance creation' }
EMultiplication class >> left: anExp right: anExp2 [

^ self new left: anExp ; right: anExp2
]

{ #category : 'public access' }
EMultiplication >> evaluate [

^ left evaluate * right evaluate
]

{ #category : 'accessing' }
EMultiplication >> left [

	^ left
]

{ #category : 'accessing' }
EMultiplication >> left: anObject [

	left := anObject
]

{ #category : 'printing' }
EMultiplication >> printOn: aStream [
aStream 
nextPutAll: '( '; 
nextPutAll: left printString; 
nextPutAll: ' * ';
nextPutAll: right printString;
nextPutAll: ' )'
]

{ #category : 'accessing' }
EMultiplication >> right [

	^ right
]

{ #category : 'accessing' }
EMultiplication >> right: anObject [

	right := anObject
]
