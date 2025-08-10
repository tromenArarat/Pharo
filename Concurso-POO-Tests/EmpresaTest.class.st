Class {
	#name : #EmpresaTest,
	#superclass : #TestCase,
	#category : #'Concurso-POO-Tests-Base'
}

{ #category : #'tests - class relationship' }
EmpresaTest >> testAgregarViaje [

	| e v |
	e := Empresa new .
	v := Viaje conNumeroDestino: 1 destino: 'Zapala' .
	e agregarViaje: v .
	self assert: (e viajes at: 1) destino equals: 'Zapala'
]

{ #category : #'test methods' }
EmpresaTest >> testDarViajesDestino [

	| e v |
	v := Viaje conNumeroDestino: 1 destino: 'Cutral có'.
	e := Empresa new.

	e agregarViaje: v.

	self assert: ((e darViajesDestino: 'Cutral có') at: 1) second equals: 1
]

{ #category : #tests }
EmpresaTest >> testEmpresaIsSetAndRead [

	| c |
	c := Empresa new.
	c nombre: 'Transportes Rincón'.
	self assert: c nombre equals: 'Transportes Rincón'
]
