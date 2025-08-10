"
""Represento una terminal de micros de larga distancia""

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	denominacion:		<Object>
	empresas:		<Object>


    Implementation Points
"
Class {
	#name : #TerminalOmnibus,
	#superclass : #Object,
	#instVars : [
		'denominacion',
		'empresas'
	],
	#category : #'Terminal-Omnibus-Modelos'
}

{ #category : #'adding item' }
TerminalOmnibus >> agregarEmpresaMicro: unaEmpresa [

	empresas add: unaEmpresa .
]

{ #category : #accessing }
TerminalOmnibus >> denominacion [

	^ denominacion
]

{ #category : #accessing }
TerminalOmnibus >> denominacion: anObject [

	denominacion := anObject
]

{ #category : #accessing }
TerminalOmnibus >> empresas [

	^ empresas
]

{ #category : #accessing }
TerminalOmnibus >> empresas: anObject [

	empresas := anObject
]

{ #category : #initialization }
TerminalOmnibus >> initialize [ 

super initialize .

denominacion := '' .
empresas := OrderedCollection new .
]

{ #category : #searching }
TerminalOmnibus >> viajeDestinoMicro: unDestino [

	| par |
	par := OrderedCollection new.

	self empresas do: [ :empresa | 
		par addAll: (empresa viajesConDestinoMicro: unDestino) ] .
	
^ par
]
