"
""Represento una empresa de micros de larga distancia""

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	nombre:		<Object>
	viajes:		<Object>


    Implementation Points
"
Class {
	#name : #EmpresaOmnibus,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'viajes'
	],
	#category : #'Terminal-Omnibus-Modelos'
}

{ #category : #adding }
EmpresaOmnibus >> agregarViajeMicro: unViaje [

	viajes add: unViaje .
]

{ #category : #initialization }
EmpresaOmnibus >> initialize [

	super initialize.

	self nombre: ''.
	self viajes: OrderedCollection new
]

{ #category : #accessing }
EmpresaOmnibus >> nombre [

	^ nombre
]

{ #category : #accessing }
EmpresaOmnibus >> nombre: anObject [

	nombre := anObject
]

{ #category : #accessing }
EmpresaOmnibus >> viajes [

	^ viajes
]

{ #category : #accessing }
EmpresaOmnibus >> viajes: anObject [

	viajes := anObject
]

{ #category : #searching }
EmpresaOmnibus >> viajesConDestinoMicro: unDestino [

	^ (self viajes select: [ :viaje | viaje tieneDestino: unDestino ]) 
		  collect: [ :viaje | { self nombre . viaje nroViaje } ]
]
