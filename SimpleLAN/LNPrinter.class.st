"
LNPrinter inherits from LNNode

Collaborators: LNNode and LNPacket

Responsibility:
- accept: aLNPacket - if the packet is addressed to the printer, prints the packet contents else sends the packet to the following node.
- print: aLNPacket - prints the contents of the packet (into the Transcript for example).
"
Class {
	#name : 'LNPrinter',
	#superclass : 'LNNode',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'sending-receiving' }
LNPrinter >> accept: aLNPacket [

	aLNPacket addresseeName = self name ifFalse: [ ^ self ].
	self print: aLNPacket.
	self send: aLNPacket
]

{ #category : 'printing' }
LNPrinter >> print: aLNPacket [

aLNPacket contents trace
]
