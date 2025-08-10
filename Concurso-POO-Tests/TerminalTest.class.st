Class {
	#name : #TerminalTest,
	#superclass : #TestCase,
	#category : #'Concurso-POO-Tests-Base'
}

{ #category : #'tests - class relationship' }
TerminalTest >> testAgregarEmpresa [

	| t e |
	t := Terminal new.
	e := Empresa new.
	e nombre: 'Transportes Rincón'.
	t agregarEmpresa: e.
	self assert: (t empresas at: 1 ) nombre equals: 'Transportes Rincón'
]

{ #category : #'tests - class relationship' }
TerminalTest >> testAgregarViaje [

	| e v |
	e := Empresa new .
	v := Viaje conNumeroDestino: 1 destino: 'Zapala' .
	e agregarViaje: v .
	self assert: (e viajes at: 1) destino equals: 'Zapala'
]

{ #category : #tests }
TerminalTest >> testEmpresaIsSetAndRead [

	| c |
	c := Empresa new.
	c nombre: 'Transportes Rincón'.
	self assert: c nombre equals: 'Transportes Rincón'
]

{ #category : #tests }
TerminalTest >> testTerminalIsSetAndRead [

	| c |
	c := Terminal new.
	c denominacion: 'CHM'.
	self assert: c denominacion equals: 'CHM'
]

{ #category : #tests }
TerminalTest >> testViajeIsSetAndRead [

	| v |
	v := Viaje conNumeroDestino: 1 destino: 'Cutral có'.
	self assert: v destino equals: 'Cutral có'
]
