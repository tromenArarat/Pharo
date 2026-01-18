Class {
	#name : 'ObreraTest',
	#superclass : 'MundoTest',
	#category : 'SimuladorHormigas-Tests',
	#package : 'SimuladorHormigas',
	#tag : 'Tests'
}

{ #category : 'tests' }
ObreraTest >> testIrObreraHaciaAlimento [

	| hormiguero reina exploradora obrera alimento |
	
	hormiguero := mundo colHormigueros first.

	reina := hormiguero reina.

	exploradora := reina colExploradoras first.

	obrera := reina colObreras first.

	[ reina colContingencias isEmpty ] whileTrue: [ 
		mundo turnoExploradora: exploradora ].

	mundo turnoObrera: obrera .
	alimento := (reina colContingencias first) punto.

	self assert: (reina ubicacion distanceTo: alimento)
		>= (obrera ubicacion distanceTo: alimento)
]

{ #category : 'tests' }
ObreraTest >> testObreraCargaDescarga [

	| mundo hormiguero exploradora reina obrera alimento ubicacion cantidad |
	mundo := Mundo new.
	exploradora := (mundo colHormigueros first) reina colExploradoras 
		               first.
	hormiguero := mundo colHormigueros first.
	reina := hormiguero reina.
	[ reina colContingencias isEmpty ] whileTrue: [ 
		mundo turnoExploradora: exploradora ].
	obrera := reina colObreras first.
	alimento := mundo encontrarAlimentoEn:
		            (reina colContingencias first) punto.

	ubicacion := alimento ubicacion.

	cantidad := alimento cantidad.
	5 timesRepeat: [ mundo turnoObrera: obrera ].

	"self assert: hormiguero alimento equals: 53."

	self assert: alimento cantidad equals: cantidad - 3
]
