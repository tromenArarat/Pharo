"
Esta hormiga tiene por tarea dar a luz a otras hormigas, con el objetivo de hacer crecer la población.

Existe una sola reina por hormiguero y nunca sale de éste.

La reina come todos los días una unidad de comida y al llegar a COMIDA_MAXIMA_REINA da a luz a
una hormiga nueva que se incorpora inmediatamente a sus labores en la colonia.

El tipo de hormiga que nace es aleatorio y diversos estudios coinciden en que la distribución de
probabilidades es la siguiente:

Obreras: 30%
Exploradoras: 20%
Guerreras: 30%
Nacimiento fallido: 20% (no nace ninguna hormiga)
"
Class {
	#name : #Reina,
	#superclass : #Hormiga,
	#instVars : [
		'colExploradoras',
		'colGuardianas',
		'colObreras'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #accessing }
Reina >> colExploradoras [

	^ colExploradoras
]

{ #category : #accessing }
Reina >> colExploradoras: anObject [

	colExploradoras := anObject
]

{ #category : #accessing }
Reina >> colGuardianas [

	^ colGuardianas
]

{ #category : #accessing }
Reina >> colGuardianas: anObject [

	colGuardianas := anObject
]

{ #category : #accessing }
Reina >> colObreras [

	^ colObreras
]

{ #category : #accessing }
Reina >> colObreras: anObject [

	colObreras := anObject
]

{ #category : #initalize }
Reina >> inicializarExploradora [

	| robinson |
	robinson := Exploradora new
		            ubicacion: self ubicacion;
		            colMensajes: OrderedCollection new;
		            yourself.
	self colExploradoras add: robinson .
	robinson actualizarRecorridas 
]

{ #category : #initalize }
Reina >> inicializarUbicacion: unaUbicacion [

	self ubicacion: unaUbicacion.
	self colExploradoras: OrderedCollection new.
	self colGuardianas: OrderedCollection new.
	self colObreras: OrderedCollection new
]
