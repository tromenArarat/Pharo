"
""Represento un auto. Vengo con un constructor para crear un nuevo auto con motor Renault"".

"
Class {
	#name : #Auto,
	#superclass : #Object,
	#instVars : [
		'patente',
		'motor',
		'cantKmRecorridos'
	],
	#category : #'POO-modelos'
}

{ #category : #constructor }
Auto class >> conPatente: unaPatente motor: unMotor [

	"Constructor de clase para crear un auto con datos iniciales"

	^ self new
		  patente: unaPatente;
		  motor: unMotor;
		  yourself
]

{ #category : #constructor }
Auto class >> nuevoRenault: unaPatente [

	^ self new
		  motor: 'Renault';
		  patente: unaPatente;
		  yourself
]

{ #category : #actions }
Auto >> andarKm: kilometros [
    "Aumenta los kilómetros recorridos"
    cantKmRecorridos := cantKmRecorridos + kilometros
]

{ #category : #accessing }
Auto >> cantKmRecorridos [

	^ cantKmRecorridos
]

{ #category : #accessing }
Auto >> cantKmRecorridos: anObject [

	cantKmRecorridos := anObject
]

{ #category : #comparing }
Auto >> esMismaPatenteQue: unAuto [
    "Compara si este auto tiene la misma patente que otro"
    ^ self patente = unAuto patente
]

{ #category : #initialization }
Auto >> initialize [
    "Constructor para inicializar las variables de instancia"
    super initialize.
    cantKmRecorridos := 0.
    patente := ''.
    motor := ''
]

{ #category : #accessing }
Auto >> motor [

	^ motor
]

{ #category : #accessing }
Auto >> motor: anObject [

	motor := anObject
]

{ #category : #accessing }
Auto >> patente [

	^ patente
]

{ #category : #accessing }
Auto >> patente: anObject [

	patente := anObject
]
