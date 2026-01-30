Class {
	#name : 'EAddition',
	#superclass : 'EBinaryExpression',
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
    ^ self evaluateWith: Dictionary new

]

{ #category : 'accessing' }
EAddition >> evaluateWith: aDictionary [
    ^ (self left evaluateWith: aDictionary) + (self right evaluateWith: aDictionary)
]

{ #category : 'accessing' }
EAddition >> left [

	^ left
]

{ #category : 'as yet unclassified' }
EAddition >> operatorString [
^ ' + '
]

{ #category : 'accessing' }
EAddition >> right [

	^ right
]
