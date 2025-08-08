"
""Represento una terminal de ómnibus""

Responsabilidades de conocimiento: 
	- Atributos: denominacion, direccion, empresas.
	- Relaciones: puede agregar empresas a su lista de empresas.

Responsabilidades de acción:
	- Por sí misma no hace nada, por el momento
	- Puede instanciar Empresa cada vez que agrega una empresa a su lista.
	
Fuente: Ejercicio Concurso AYP 3 Programación Orientada a Objetos - FAI-UNCOMA - 2025.

Public API and Key Messages

- message one: buscarViaje(nroViaje)   
- message two:  darDatosViaje(cadenaDestino) retorna <nombreEmpresa, nroDeViaje>
- how to create instances: '' unaTerminal := Terminal new . ''
 
Internal Representation and Key Implementation Points.

    Instance Variables
	denominacion:		<Object>
	direccion:		<Object>
	empresas:		<Object>


    Implementation Points
"
Class {
	#name : #Terminal,
	#superclass : #Object,
	#instVars : [
		'denominacion',
		'direccion',
		'empresas'
	],
	#category : #'Concurso-POO'
}

{ #category : #adding }
Terminal >> agregarEmpresa: unaEmpresa [

	"Agrega una empresa a la colección de empresas de la terminal"

	empresas add: unaEmpresa
]

{ #category : #searching }
Terminal >> buscarViajeEnTerminal: unNumeroViaje [
    "Busca un viaje por número en todas las empresas de la terminal"
    | viajeEncontrado |
    
    viajeEncontrado := nil.
    
    empresas do: [:empresa | 
        viajeEncontrado := empresa buscarViaje: unNumeroViaje.
        viajeEncontrado ifNotNil: [^ viajeEncontrado].
    ].
    
    ^ viajeEncontrado
]

{ #category : #searching }
Terminal >> datosViaje: unDestino [
    | resultados |
    resultados := OrderedCollection new.
    
    self empresas do: [:empresa |
        resultados addAll: (empresa viajesConDestino: unDestino)].
    
    ^ resultados
]

{ #category : #accessing }
Terminal >> denominacion [

	^ denominacion
]

{ #category : #accessing }
Terminal >> denominacion: anObject [

	denominacion := anObject
]

{ #category : #accessing }
Terminal >> direccion [

	^ direccion
]

{ #category : #accessing }
Terminal >> direccion: anObject [

	direccion := anObject
]

{ #category : #accessing }
Terminal >> empresas [

	^ empresas
]

{ #category : #accessing }
Terminal >> empresas: anObject [

	empresas := anObject
]

{ #category : #initialization }
Terminal >> initialize [

	"Inicializa los atributos con valores por defecto"

	super initialize.
	denominacion := ''.
	direccion := ''.
	empresas := OrderedCollection new "Colección para almacenar las empresas que operan en la terminal"
	"Probar con OrderedCollection of: Empresa para solo aceptar Empresas"
]
