Class {
	#name : #PlanetaVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'continente',
		'nombreContinente',
		'botonCerrar'
	],
	#category : #'ModeloVistaEjemplo-Vista'
}

{ #category : #initialize }
PlanetaVisual >> cerrar [

	"minimiza la ventana"

	self collapse
]

{ #category : #initialization }
PlanetaVisual >> initialize [

	| origen planeta continentes indice |
	super initialize.
	self position: 45 @ 45.
	self bounds: (self position extent: 350 @ 70).

	planeta := Planeta nuevo: Continente new.

	continentes := #('América' 'Asia' 'Europa' 'África' 'Oceanía').

	indice := (1 to: 5) atRandom.

	planeta continente nombre: (continentes at: indice).

	continente := planeta continente.

	nombreContinente := StringMorph new.

	botonCerrar := BotonAccion new.

	self addMorph: nombreContinente.
	self addMorph: botonCerrar.

	origen := self innerBounds origin.

	nombreContinente position: origen + (10 @ 10).
	botonCerrar position: origen + (50 @ 50).
	botonCerrar label: 'CERRAR'.

	continente addDependent: self.
	self update: planeta.

	botonCerrar mouseAction: [ self cerrar ]
]

{ #category : #updating }
PlanetaVisual >> update: unPlaneta [

	unPlaneta ifNotNil: [ 
		nombreContinente contents: unPlaneta continente nombre]
]
