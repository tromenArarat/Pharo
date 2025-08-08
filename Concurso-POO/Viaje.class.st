"
""Represento viajes de larga distancia""

Responsabilidades de conocimiento: 
	- Atributos: destino, nroViaje, montoBase, fecha, horaSalida, horaLlegada y chofer.
	- Relaciones: es creado por una Empresa e implementa la relación con Persona (chofer).

Responsabilidades de acción:
	- Por sí misma puede calcular la duración del viaje
	- Puede instanciar Persona
	- ¿Controla y coordina actividades en otros objetos? No, salvo en Persona

Fuente: Ejercicio Concurso AYP 3 Programación Orientada a Objetos - FAI-UNCOMA - 2025.

Public API and Key Messages

- message one: buscarViaje(nroViaje)   
- message two:  darDatosViaje(cadenaDestino) retorna <nombreEmpresa, nroDeViaje>
- how to create instances: '' unViaje := Viaje new . ''

   One simple example is simply gorgeous. Te la debo, gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	chofer:		<Object>
	destino:		<Object>
	fecha:		<Object>
	horaLlegada:		<Object>
	horaSalida:		<Object>
	montoBase:		<Object>
	nroViaje:		<Object>


    Implementation Points
"
Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'destino',
		'nroViaje',
		'montoBase',
		'fecha',
		'horaSalida',
		'horaLlegada',
		'chofer'
	],
	#category : #'Concurso-POO'
}

{ #category : #accessing }
Viaje >> chofer [

	^ chofer
]

{ #category : #accessing }
Viaje >> chofer: anObject [

	chofer := anObject
]

{ #category : #accessing }
Viaje >> destino [

	^ destino
]

{ #category : #accessing }
Viaje >> destino: anObject [

	destino := anObject
]

{ #category : #accessing }
Viaje >> fecha [

	^ fecha
]

{ #category : #accessing }
Viaje >> fecha: anObject [

	fecha := anObject
]

{ #category : #accessing }
Viaje >> horaLlegada [

	^ horaLlegada
]

{ #category : #accessing }
Viaje >> horaLlegada: anObject [

	horaLlegada := anObject
]

{ #category : #accessing }
Viaje >> horaSalida [

	^ horaSalida
]

{ #category : #accessing }
Viaje >> horaSalida: anObject [

	horaSalida := anObject
]

{ #category : #initialization }
Viaje >> initialize [

	"Inicializa los atributos con valores nil"

	super initialize .
	chofer := Persona new
]

{ #category : #accessing }
Viaje >> montoBase [

	^ montoBase
]

{ #category : #accessing }
Viaje >> montoBase: anObject [

	montoBase := anObject
]

{ #category : #accessing }
Viaje >> nroViaje [

	^ nroViaje
]

{ #category : #accessing }
Viaje >> nroViaje: anObject [

	nroViaje := anObject
]

{ #category : #filtering }
Viaje >> tieneDestino: unDestino [
    "Respuesta si el viaje coincide con el destino solicitado"
    ^ self destino = unDestino
]
