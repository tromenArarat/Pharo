Class {
	#name : #PlanetaVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'continente',
		'nombreContinente',
		'botonCerrar',
		'botonCambiar'
	],
	#category : #'ModeloVistaEjemplo-VistaAstro'
}

{ #category : #accessing }
PlanetaVisual >> botonCambiar [

	^ botonCambiar
]

{ #category : #accessing }
PlanetaVisual >> botonCambiar: anObject [

	botonCambiar := anObject
]

{ #category : #accessing }
PlanetaVisual >> botonCerrar [

	^ botonCerrar
]

{ #category : #accessing }
PlanetaVisual >> botonCerrar: anObject [

	botonCerrar := anObject
]

{ #category : #initialize }
PlanetaVisual >> cambiar [

	"minimiza la ventana"

| continentes indice |
		continentes := #( 'América' 'Asia' 'Europa' 'África' 'Oceanía' ).

	indice := (1 to: 5) atRandom.
	
	self nombreContinente: (continentes at: indice)
]

{ #category : #initialize }
PlanetaVisual >> cambiar: unPlaneta [

	"minimiza la ventana"

	| continentes indice |
	continentes := #( 'América' 'Asia' 'Europa' 'África' 'Oceanía' ).

	indice := (1 to: 5) atRandom.

	unPlaneta continente nombre: (continentes at: indice) .
	
self update:unPlaneta
]

{ #category : #initialize }
PlanetaVisual >> cerrar [

	"minimiza la ventana"

	self collapse
]

{ #category : #accessing }
PlanetaVisual >> continente [

	^ continente
]

{ #category : #accessing }
PlanetaVisual >> continente: anObject [

	continente := anObject
]

{ #category : #initialization }
PlanetaVisual >> initialize [

	| origen planeta continentes indice |
	super initialize.
	self position: 45 @ 45.
	self bounds: (self position extent: 350 @ 70).

	planeta := Planeta nuevo: Continente new.

	continentes := #( 'América' 'Asia' 'Europa' 'África' 'Oceanía' ).

	indice := (1 to: 5) atRandom.

	planeta continente nombre: (continentes at: indice).

	continente := planeta continente.

	nombreContinente := StringMorph new.

	botonCambiar := BotonAccion new.

	botonCerrar := BotonAccion new.


	self addMorph: nombreContinente.
	self addMorph: botonCambiar.
	self addMorph: botonCerrar.

	origen := self innerBounds origin.

	nombreContinente position: origen + (10 @ 10).
	botonCambiar position: origen + (100 @ 10).
	botonCerrar position: origen + (100 @ 40).
	botonCambiar label: 'CAMBIAR'.
	botonCerrar label: 'CERRAR'.

	continente addDependent: self.
	self update: planeta.
	botonCambiar mouseAction: [ 
		self solicitarCambiar: planeta.
		self update: planeta ].
	botonCerrar mouseAction: [ self cerrar ]
]

{ #category : #accessing }
PlanetaVisual >> nombreContinente [

	^ nombreContinente
]

{ #category : #accessing }
PlanetaVisual >> nombreContinente: anObject [

	nombreContinente := anObject
]

{ #category : #initialize }
PlanetaVisual >> solicitarCambiar: unPlaneta [

	| valor |
	valor := (UIManager default) request: '¿Por qué continente desea cambiar?' .
	unPlaneta continente nombre: valor.

	self update: unPlaneta
]

{ #category : #updating }
PlanetaVisual >> update: unPlaneta [

	unPlaneta ifNotNil: [ 
		nombreContinente contents: unPlaneta continente nombre]
]
