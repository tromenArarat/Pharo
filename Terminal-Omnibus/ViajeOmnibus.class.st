"
""Represento un viaje de larga distancia""

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	destino:		<Object>
	nroViaje:		<Object>


    Implementation Points
"
Class {
	#name : #ViajeOmnibus,
	#superclass : #Object,
	#instVars : [
		'destino',
		'nroViaje'
	],
	#category : #'Terminal-Omnibus-Modelos'
}

{ #category : #constructor }
ViajeOmnibus class >> conNroViaje: unNroViaje destino: unDestino [

	^ self
		  new
		  nroViaje: unNroViaje;
		  destino: unDestino;
		  yourself
]

{ #category : #accessing }
ViajeOmnibus >> destino [

	^ destino
]

{ #category : #accessing }
ViajeOmnibus >> destino: anObject [

	destino := anObject
]

{ #category : #accessing }
ViajeOmnibus >> nroViaje [

	^ nroViaje
]

{ #category : #accessing }
ViajeOmnibus >> nroViaje: anObject [

	nroViaje := anObject
]

{ #category : #filtering }
ViajeOmnibus >> tieneDestino: unDestino [

^ self destino = unDestino
]
