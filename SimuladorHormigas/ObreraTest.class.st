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

	mundo turnoReina: reina.

	alimento := (reina colContingencias at: 1) punto.

	self assert:
		(reina ubicacion distanceTo: alimento) > (obrera ubicacion distanceTo: alimento)
]
