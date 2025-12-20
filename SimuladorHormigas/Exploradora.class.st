"
Estas hormigas son las más libres de toda la colonia. Ellas se mueven por el mundo libremente en busca de comida o amenazas.

Inicialmente solo conocen la ubicación de la colonia, luego salen a explorar hasta encontrar otra colonia o una fuente de comida. Al detectarla vuelven inmediatamente lo más directo que pueden a la colonia para avisar. Estas hormigas se mueven rápidamente, por lo que avanzan hasta 4 posiciones por turno.

Cuando una exploradora vuelve con un mensaje, la Reina decide que hacer. Si se detectó otra colonia, avisa a las guerreras para ir a la guerra. Si se detectó una fuente de comida avisa a las obreras para que la recolecten. Cuántas hormigas de cada tipo envía en cada caso, dependerá de la decisión particular de la Reina en cada situación.

Luego de avisar, la hormiga exploradora, sale a caminar nuevamente por el mundo. Si encuentra algo que ya notificó, lo ignora y sigue por su lado. Las exploradores son muy hábiles para encontrar comida por su cuenta, por lo que no comen nunca en la colonia.
"
Class {
	#name : #Exploradora,
	#superclass : #Hormiga,
	#instVars : [
		'colRecorridas',
		'colMensajes',
		'estado'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #updating }
Exploradora >> actualizarMensajes: unaCelda [

	| validacion |
	validacion := unaCelda contenido = 'alimento'.

	validacion ifTrue: [ self colMensajes addFirst: unaCelda ]
]

{ #category : #updating }
Exploradora >> actualizarRecorridas [

	colRecorridas add: self ubicacion
]

{ #category : #accessing }
Exploradora >> colMensajes [

	^ colMensajes
]

{ #category : #accessing }
Exploradora >> colMensajes: anObject [

	colMensajes := anObject
]

{ #category : #accessing }
Exploradora >> colRecorridas [

	^ colRecorridas
]

{ #category : #accessing }
Exploradora >> colRecorridas: anObject [

	colRecorridas := anObject
]

{ #category : #checking }
Exploradora >> estaEnRecorridas: unaCelda [

^ self colRecorridas includes: unaCelda .
]

{ #category : #accessing }
Exploradora >> estado [

	^ estado
]

{ #category : #accessing }
Exploradora >> estado: anObject [

	estado := anObject
]

{ #category : #initialization }
Exploradora >> initialize [

	self colRecorridas: OrderedCollection new 
]
