"
LNWorkstation inherits from LNNode
Collaborators: Node, Workstation and Packet
Responsibility: (the ones of LNNode)
- send: aPacket - sends a packet.
- accept: aPacket - performs an action on packets sent to the workstation (e.g. printing in the transcript). For the other packets just send them to the following node.
"
Class {
	#name : 'LNWorkstation',
	#superclass : 'LNNode',
	#category : 'SimpleLAN',
	#package : 'SimpleLAN'
}

{ #category : 'sending-receiving' }
LNWorkstation >> accept: aPacket [
(aPacket addresseeName = self name) ifTrue:[ self name trace. ' accepted packet' trace] ifFalse:[ super accept: aPacket ]. 

]
