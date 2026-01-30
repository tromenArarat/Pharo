Class {
	#name : 'EAddition',
	#superclass : 'EExpression',
	#instVars : [
		'left',
		'right'
	],
	#category : 'Expressions',
	#package : 'Expressions'
}

{ #category : 'samples' }
EAddition class >> fivePlusThree [
<sampleInstance>
| ep1 ep2 |
ep1 := EConstant new value: 5.
ep2 := EConstant new value: 3.
^ self new left: ep1 ; right: ep2
]

{ #category : 'instance creation' }
EAddition class >> left: anInteger right: anInteger2 [
^ self new left: anInteger ; right: anInteger2
]

{ #category : 'public access' }
EAddition >> evaluate [
^ left evaluate + right evaluate

]

{ #category : 'accessing' }
EAddition >> left [

	^ left
]

{ #category : 'accessing' }
EAddition >> left: anObject [

	left := anObject
]

{ #category : 'printing' }
EAddition >> printOn: aStream [

aStream 
nextPutAll: '( '; 
nextPutAll: left printString; 
nextPutAll: ' + ';
nextPutAll: right printString;
nextPutAll: ' )'
]

{ #category : 'accessing' }
EAddition >> right [

	^ right
]

{ #category : 'accessing' }
EAddition >> right: anObject [

	right := anObject
]
