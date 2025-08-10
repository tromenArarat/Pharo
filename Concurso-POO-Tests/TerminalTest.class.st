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

{ #category : #'test methods' }
TerminalTest >> testDarDatosViaje [

	| t e v d |
	t := Terminal new.
	e := Empresa new nombre: 'Transportes Rincón'.
	d := 'Zapala'.
	v := Viaje conNumeroDestino: 1 destino: d.

	e agregarViaje: v.
	t agregarEmpresa: e.

	self
		assert: ((t darDatosViaje: 'Zapala') at: 1) first asString
		equals: 'Transportes Rincón'
]

{ #category : #tests }
TerminalTest >> testTerminalIsSetAndRead [

	| c |
	c := Terminal new.
	c denominacion: 'CHM'.
	self assert: c denominacion equals: 'CHM'
]
