Class {
	#name : #MundoTest,
	#superclass : #TestCase,
	#category : #'SimuladorHormigas-Tests'
}

{ #category : #tests }
MundoTest >> testMundoSetAndRead [

	| mundo alimentos |
	mundo := Mundo new.

	alimentos := mundo mapa collect: [ :fila | 
		             fila select: [ :celda | celda contenido = 'alimento' ] ].

	^ self assert: alimentos size equals: 10
]
