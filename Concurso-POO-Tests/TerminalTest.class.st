Class {
	#name : #TerminalTest,
	#superclass : #TestCase,
	#category : #'Concurso-POO-Tests-Base'
}

{ #category : #tests }
TerminalTest >> testTerminalIsSetAndRead [

	| c |
	c := Terminal new.
	c denominacion: 'CHM'.
	self assert: c denominacion equals: 'CHM'
]
