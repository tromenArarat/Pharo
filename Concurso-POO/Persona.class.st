"
""Represento un chofer""

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	apellido:		<Object>
	mail:		<Object>
	nombre:		<Object>
	nroDoc:		<Object>


    Implementation Points
"
Class {
	#name : #Persona,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'apellido',
		'nroDoc',
		'mail'
	],
	#category : #'Concurso-POO'
}

{ #category : #'instance creation' }
Persona class >> conApellido: unApellido nombre: unNombre [
	| unaPersona |
	unaPersona := self new.
	unaPersona nombre: unNombre.
	unaPersona apellido: unApellido.
	^ unaPersona  
]

{ #category : #accessing }
Persona >> apellido [

	^ apellido
]

{ #category : #accessing }
Persona >> apellido: anObject [

	apellido := anObject
]

{ #category : #accessing }
Persona >> mail [

	^ mail
]

{ #category : #accessing }
Persona >> mail: anObject [

	mail := anObject
]

{ #category : #accessing }
Persona >> nombre [

	^ nombre
]

{ #category : #accessing }
Persona >> nombre: anObject [

	nombre := anObject
]

{ #category : #accessing }
Persona >> nroDoc [

	^ nroDoc
]

{ #category : #accessing }
Persona >> nroDoc: anObject [

	nroDoc := anObject
]
