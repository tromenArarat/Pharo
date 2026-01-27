"
LNPacket inherits from Object
Collaborators: LNNode
Responsibility:
- addresseeName - returns the name of the node to which the packet is sent.
- contents - describes the contents of the message sent.
- originatorName - that sent the packet.
"
Class {
	#name : 'LNPacket',
	#superclass : 'Object',
	#instVars : [
		'addresseeName',
		'contents',
		'originatorName'
	],
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'accessing' }
LNPacket >> addresseeName [

	^ addresseeName
]

{ #category : 'accessing' }
LNPacket >> addresseeName: anObject [

	addresseeName := anObject
]

{ #category : 'accessing' }
LNPacket >> contents [

	^ contents
]

{ #category : 'accessing' }
LNPacket >> contents: anObject [

	contents := anObject
]

{ #category : 'initialization' }
LNPacket >> initialize [ 
super initialize .
addresseeName := '/'.
originatorName := '/'.
contents := ''
]

{ #category : 'testing' }
LNPacket >> isAddressedTo: aNode [

^ self addresseeName = aNode
]

{ #category : 'accessing' }
LNPacket >> originatorName [

	^ originatorName
]

{ #category : 'accessing' }
LNPacket >> originatorName: anObject [

	originatorName := anObject
]

{ #category : 'printing' }
LNPacket >> printOn: aStream [

	aStream nextPutAll: 'a LNPacket: '.
	aStream
		nextPutAll: self contents asString;
		nextPutAll: ' sentTo: '.
	aStream nextPutAll: self addresseeName asString
]
