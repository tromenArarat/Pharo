Class {
	#name : #Regla,
	#superclass : #Object,
	#instVars : [
		'nrosVivir',
		'nrosRenacer'
	],
	#category : #'Juego-de-la-Vida-modelos'
}

{ #category : #'instance creation' }
Regla class >> crearReglas: unaCadena [
| lasReglas |
lasReglas := self new.
lasReglas inicializar: unaCadena.
^lasReglas.
]

{ #category : #methods }
Regla >> inicializar: unaCadena [
" Se separa unaCadena en 2 arreglos, el primero con los caracteres anteriores a /, y el segundo con los caracteres posteriores a /.
- nrosVivir tiene las cantidades de celulas vecinas vivas validas para que una celula permanezca viva
- nrosRenacer tiene la cantidad de celulas vecinas necesarias para que una celula muerta vuelva a vivir"
|nros|
nrosVivir := OrderedCollection new.
nrosRenacer := OrderedCollection new.nros := unaCadena subStrings: '/'.
1 to: (nros at:1) size do: [:i| nrosVivir add: ((nros at:1) at:i )digitValue ].
1 to: (nros at:2) size do: [:i| nrosRenacer add: ((nros at:2) at:i)digitValue ] 
]

{ #category : #methods }
Regla >> puedeRenacer: cantidad [
"Verifica si la cantidad corresponde a un valor valido para renacer"
^nrosRenacer includes: cantidad.
]

{ #category : #methods }
Regla >> puedeVivir: cantidad [
"Verifica si la cantidad corresponde a un valor valido para permancer vivo"
^nrosVivir includes: cantidad.
]
