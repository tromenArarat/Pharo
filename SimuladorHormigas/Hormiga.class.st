"
Clase madre de todas las hormigas

"
Class {
	#name : #Hormiga,
	#superclass : #Object,
	#instVars : [
		'ubicacion',
		'colMensajes'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #accessing }
Hormiga >> colMensajes [
	^ self subclassResponsibility
]

{ #category : #accessing }
Hormiga >> colMensajes: arg1 [ 
	^ self subclassResponsibility
]

{ #category : #accessing }
Hormiga >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Hormiga >> ubicacion: anObject [

	ubicacion := anObject
]
