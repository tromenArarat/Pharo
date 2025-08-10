Class {
	#name : #ViajeTest,
	#superclass : #TestCase,
	#category : #'Concurso-POO-Tests-Base'
}

{ #category : #'test methods' }
ViajeTest >> testTieneDestino [

	| v |
	v := Viaje conNumeroDestino: 1 destino: 'Cutral có'.

	self assert: (v tieneDestino: 'Cutral có')
]

{ #category : #tests }
ViajeTest >> testViajeIsSetAndRead [

	| v |
	v := Viaje conNumeroDestino: 1 destino: 'Cutral có'.
	self assert: v destino equals: 'Cutral có'
]
