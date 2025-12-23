Class {
	#name : #ObreraTest,
	#superclass : #TestCase,
	#category : #'SimuladorHormigas-Tests'
}

{ #category : #tests }
ObreraTest >> testIrObreraHaciaAlimento [

	| mundo hormiguero reina exploradora obrera alimento |
	mundo := Mundo new.

	hormiguero := mundo colHormigueros at: 1.

	reina := hormiguero reina.

	exploradora := reina colExploradoras at: 1.

	obrera := reina colObreras at: 1.

	[ reina colContingencias isEmpty ] whileTrue: [ 
		mundo turnoExploradora: exploradora ].

	mundo turnoObrera:obrera .
	alimento := (reina colContingencias at: 1) punto.

	self assert: (reina ubicacion distanceTo: alimento)
		> (obrera ubicacion distanceTo: alimento)
]

{ #category : #tests }
ObreraTest >> testObreraCargaDescarga [

	| mundo hormiguero exploradora reina obrera alimento ubicacion cantidad |
	mundo := Mundo new.
	exploradora := (mundo colHormigueros at: 1) reina colExploradoras 
		               at: 1.
	hormiguero := mundo colHormigueros at: 1.
	reina := hormiguero reina.
	[ reina colContingencias isEmpty ] whileTrue: [ 
		mundo turnoExploradora: exploradora ].
	obrera := reina colObreras at: 1.
	alimento := mundo encontrarAlimentoEn:
		            (reina colContingencias at: 1) punto.

	ubicacion := alimento ubicacion.

	cantidad := alimento cantidad.
	8 timesRepeat: [ mundo turnoObrera: obrera ].

	self assert: hormiguero alimento equals: 53.

	self assert: alimento cantidad equals: cantidad - 3
]
