"
""Represento una empresa de viajes de larga distancia""

Responsabilidades de conocimiento: 
	- Atributos: identificacion, nombre, viajes.
	- Relaciones: crea viajes y forma parte de al menos una terminal.

Responsabilidades de acción:
	- Puede instanciar Viaje cada vez que agrega un viaje a su lista de viajes.
	- ¿Controla y coordina actividades en otros objetos? Sí, crea una instancia de viaje y con ella al chofer (Persona) del viaje.
	
Fuente: Ejercicio Concurso AYP 3 Programación Orientada a Objetos - FAI-UNCOMA - 2025.

API pública y mensajes clave
- Mensaje uno: buscarViaje(nroViaje)   
- Mensaje dos:  darDatosViaje(cadenaDestino) retorna <nombreEmpresa, nroDeViaje>
 
Ejemplo: 

' | e | '
' e := Empresa new . '
' e agregarViajes: Viaje conNumeroDestino: 1 destino: 'Las Lajas' . '





Internal Representation and Key Implementation Points.

    Instance Variables
	identificacion:		<Object>
	nombre:		<Object>
	viajes:		<Object>


    Implementation Points
"
Class {
	#name : #Empresa,
	#superclass : #Object,
	#instVars : [
		'identificacion',
		'nombre',
		'viajes'
	],
	#category : #'Concurso-POO'
}

{ #category : #constructor }
Empresa class >> conIdentificacion: unaIdentificacion nombre: unNombre [
    "Crea una empresa con identificación y nombre especificados"
    ^ self new
        identificacion: unaIdentificacion;
        nombre: unNombre;
        yourself
]

{ #category : #constructor }
Empresa class >> conIdentificacionValidada: unaIdentificacion nombre: unNombre [
    "Crea una empresa validando que la identificación no esté vacía"
    unaIdentificacion isEmpty ifTrue: [ self error: 'La identificación no puede estar vacía' ].
    ^ self conIdentificacion: unaIdentificacion nombre: unNombre
]

{ #category : #constructor }
Empresa class >> desdeDiccionario: aDictionary [
    "Crea una empresa a partir de un diccionario con claves #identificacion y #nombre"
    ^ self conIdentificacion: (aDictionary at: #identificacion)
              nombre: (aDictionary at: #nombre)
]

{ #category : #'adding item' }
Empresa >> agregarViaje: unViaje [
    "Agrega un viaje a la colección de viajes de la empresa"
    viajes add: unViaje
]

{ #category : #searching }
Empresa >> buscarViaje: unNroViaje [

	"Dado un código de viaje retornar el objeto viaje correspondiente a ese código"

	^ viajes detect: [ :viaje | viaje nroViaje = unNroViaje ] ifNone: [ nil ]
]

{ #category : #searching }
Empresa >> darViajesDestino: unDestino [

	"Retorna colección de pares <nombreEmpresa,nroViaje> que coinciden con el destino"

	^ (self viajes select: [ :viaje | viaje tieneDestino: unDestino ]) 
		  collect: [ :v | 
			  { 
				  self nombre.
				  v nroViaje } ]
]

{ #category : #accessing }
Empresa >> identificacion [

	^ identificacion
]

{ #category : #accessing }
Empresa >> identificacion: anObject [

	identificacion := anObject
]

{ #category : #initialization }
Empresa >> initialize [
	"Inicializa los atributos con valores por defecto"
	super initialize.
	identificacion := ''.
	nombre := ''.
	viajes := OrderedCollection new "Colección para almacenar los viajes de la empresa"
]

{ #category : #accessing }
Empresa >> nombre [

	^ nombre
]

{ #category : #accessing }
Empresa >> nombre: anObject [

	nombre := anObject
]

{ #category : #accessing }
Empresa >> viajes [

	^ viajes
]

{ #category : #accessing }
Empresa >> viajes: anObject [

	viajes := anObject
]
