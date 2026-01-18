Class {
	#name : 'ExploradoraTest',
	#superclass : 'MundoTest',
	#category : 'SimuladorHormigas-Tests',
	#package : 'SimuladorHormigas',
	#tag : 'Tests'
}

{ #category : 'tests' }
ExploradoraTest >> testIrVolverExploradora [

	| robinson hormiguero |

	robinson := (mundo colHormigueros first) reina colExploradoras first.

	hormiguero := mundo colHormigueros first.


	[ hormiguero reina colContingencias isEmpty ] whileTrue: [ 
		mundo turnoExploradora: robinson ].



	self
		assert: (hormiguero reina colContingencias first) x
		equals: (robinson colMensajes first) x
]

{ #category : 'tests' }
ExploradoraTest >> testMoverExploradora [

	| exploradora x y |

	exploradora := (mundo colHormigueros first) reina colExploradoras 
		               first.

	mundo moverExploradora: exploradora contador: 0.

	x := exploradora ubicacion x.
	y := exploradora ubicacion y.

	self
		assert: ((mundo mapa at: x) at: y) punto
		equals: exploradora ubicacion
]

{ #category : 'tests' }
ExploradoraTest >> testMoverExploradoras [

	|  exploradora exploradora2 x y x2 y2 cierto cierto2 |
	
	exploradora := (mundo colHormigueros first) reina colExploradoras 
		               first.

	exploradora2 := (mundo colHormigueros second) reina colExploradoras 
		               first.

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
