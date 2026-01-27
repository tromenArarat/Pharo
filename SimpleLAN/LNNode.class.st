"
LNNode inherits from Object
Collaborators: LNNode and LNPacket
Responsibility:
- name (aSymbol) - returns the name of the current node.
- hasNextNode - tells if the receiver has a next node.
- accept: aPacket - receives a Packet and processes it. By default, it is sent to the next node.
- send: aPacket - sends a Packet to its next node.
"
Class {
	#name : 'LNNode',
	#superclass : 'Object',
	#instVars : [
		'name',
		'nextNode'
	],
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'sending-receiving' }
LNNode >> accept: aPacket [
"Having received aPacket, send it on. This is the default
behavior. My subclasses may override me to do something special."
self send: aPacket
]

{ #category : 'testing' }
LNNode >> hasNextNode [
^ self nextNode isNotNil 
]

{ #category : 'initialization' }
LNNode >> initialize [ 

super initialize.
name := 'unamed'
]

{ #category : 'accessing' }
LNNode >> name [

	^ name
]

{ #category : 'accessing' }
LNNode >> name: aSymbol [

	name := aSymbol
]

{ #category : 'accessing' }
LNNode >> nextNode [

	^ nextNode
]

{ #category : 'accessing' }
LNNode >> nextNode: anLNNode [

	nextNode := anLNNode
]

{ #category : 'printing' }
LNNode >> printOn: aStream [

	aStream nextPutAll: self name asString.
	
	self hasNextNode ifFalse: [ ^ aStream nextPutAll: ' -> /'].
	aStream nextPutAll: ' -> '.
	aStream nextPutAll: self nextNode name asString
]

{ #category : 'sending-receiving' }
LNNode >> send: aPacket [
nextNode ifNotNil: [
self name trace.
' sends a packet to: ' trace.
nextNode name traceCr.
nextNode accept: aPacket ]
]
