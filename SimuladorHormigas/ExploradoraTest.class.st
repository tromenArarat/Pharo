Class {
	#name : #ExploradoraTest,
	#superclass : #TestCase,
	#category : #'SimuladorHormigas-Tests'
}

{ #category : #tests }
ExploradoraTest >> testMoverExploradora [

	| mundo exploradora x y |
	mundo := Mundo new.

	exploradora := (mundo colHormigueros at: 1) reina colExploradoras 
		               at: 1.

	mundo moverExploradora: exploradora contador: 0.

	x := exploradora ubicacion x.
	y := exploradora ubicacion y.

	self
		assert: ((mundo mapa at: x) at: y) punto
		equals: exploradora ubicacion
]

{ #category : #tests }
ExploradoraTest >> testMoverExploradoras [

	| mundo exploradora exploradora2 x y x2 y2 cierto cierto2 |
	mundo := Mundo new.

	exploradora := (mundo colHormigueros at: 1) reina colExploradoras 
		               at: 1.

	exploradora2 := (mundo colHormigueros at: 2) reina colExploradoras 
		                at: 1.

	mundo moverExploradora: exploradora contador: 0.
	mundo moverExploradora: exploradora2 contador: 0.

	x := exploradora ubicacion x.
	y := exploradora ubicacion y.

	x2 := exploradora2 ubicacion x.
	y2 := exploradora2 ubicacion y.

	cierto := ((mundo mapa at: x) at: y) punto =
		          exploradora ubicacion.
	cierto2 := ((mundo mapa at: x2) at: y2) punto =
		           exploradora2 ubicacion.

	self assert: cierto & cierto2
]

{ #category : #tests }
ExploradoraTest >> testVolverExploradora [

	| mundo hormiguero x y robinson |
	mundo := Mundo new.

	robinson := (mundo colHormigueros at: 1) reina colExploradoras at: 1.

	hormiguero := mundo colHormigueros at: 1.

	mundo.

	x := (mundo colAlimentos at: 1) ubicacion x.

	y := (mundo colAlimentos at: 1) ubicacion y.

	robinson ubicacion: x @ y.

	mundo volverExploradora: robinson aHormiguero: hormiguero.



	self assert: (hormiguero reina colContingencias at: 1) x equals: x
]
