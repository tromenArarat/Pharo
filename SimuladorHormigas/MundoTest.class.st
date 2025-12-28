Class {
	#name : 'MundoTest',
	#superclass : 'TestCase',
	#category : 'SimuladorHormigas-Tests',
	#package : 'SimuladorHormigas',
	#tag : 'Tests'
}

{ #category : 'tests' }
MundoTest >> testHormiguerosCreados [
    | mundo hormiguerosEnColeccion hormiguerosEnMapa |
    mundo := Mundo new.
    
    hormiguerosEnColeccion := mundo colHormigueros size.
    hormiguerosEnMapa := (mundo mapa flatCollect: [ :fila | 
        fila select: [ :celda | celda contenido = 'hormiguero' ]
    ]) size.
    
    "Ambos deben ser 2"
    self assert: hormiguerosEnColeccion equals: 2.
    self assert: hormiguerosEnMapa equals: 2
]

{ #category : 'tests' }
MundoTest >> testMundoSetAndRead [

	| mundo alimentos |
	mundo := Mundo new.

	alimentos := (mundo mapa flatCollect: [ :fila | 
		              fila select: [ :celda | celda contenido = 'alimento' ] ])
		             size.

	^ self assert: alimentos equals: 10
]

{ #category : 'tests' }
MundoTest >> testVaciasIgualTotalMenosAlimentoHormiguero [

	| mundo hormiguerosEnMapa alimentosEnMapa vaciasEnMapa |
	mundo := Mundo new.

	hormiguerosEnMapa := (mundo mapa flatCollect: [ :fila | 
		                      fila select: [ :celda | 
			                      celda contenido = 'hormiguero' ] ]) size.

	alimentosEnMapa := (mundo mapa flatCollect: [ :fila | 
		                    fila select: [ :celda | 
			                    celda contenido = 'alimento' ] ]) size.

	vaciasEnMapa := (mundo mapa flatCollect: [ :fila | 
		                 fila select: [ :celda | celda contenido = 'vacio' ] ])
		                size.

	self
		assert: vaciasEnMapa + hormiguerosEnMapa + alimentosEnMapa
		equals: 100
]
