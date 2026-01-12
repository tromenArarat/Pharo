"
Las hormigas obreras son las encargadas de llevar comida a la colonia. Para poder llevar comida primero deben conocer donde hay una fuente de comida.

Las fuentes de comida son descubiertas por las exploradoras y notificadas a la colonia. Cuando una nueva fuente de comida es descubierta, la colonia deberá asignar un número de hormigas obreras acorde a esta fuente de comida. Una misma fuente de comida puede ser saqueada por más de una colonia sin que esto declare la guerra.

Las obreras son muy disciplinadas, tanto que siempre van y vuelven todas por el mismo camino. En el caso, de que dos hormigas quieran ocupar la misma posición, pueden realizarlo sin ningún problema. Las obreras van y vuelven a la misma fuente de comida hasta que esta fuente se agote. El avance hacia la fuente de comida es mas rápido que el retorno, dado que la hormiga se mueve
liviana, sin peso en su lomo.

Considere que en cada turno:
- avanza 3 posiciones si se está moviendo hacia la fuente de comida
- avanza 1 posición si está regresando a la colonia con comida
- avanza 3 posiciones si está regresando a la colonia sin comida

Cada obrera puede llevar hasta 3 piezas de comida en su lomo y no necesitan comer ya que se van alimentando de lo que encuentran en el camino.

Si volvieron con las manos vacías (porque la fuente de comida se había agotado) se quedan dentro de la colonia hasta que se les ordene salir a recolectar más comida, y en este caso se alimentan de la comida existente en la colonia.
"
Class {
	#name : 'Obrera',
	#superclass : 'Hormiga',
	#instVars : [
		'mochila',
		'colRecorridas',
		'estado'
	],
	#category : 'SimuladorHormigas-Base',
	#package : 'SimuladorHormigas',
	#tag : 'Base'
}

{ #category : 'updating' }
Obrera >> actualizarMochila: unaFuenteDeAlimento [

	[ unaFuenteDeAlimento cantidad > 0 & (self mochila < 3) ] whileTrue: [ 
		unaFuenteDeAlimento restarCantidad.
		self mochila: self mochila + 1 ] .
]

{ #category : 'updating' }
Obrera >> actualizarRecorridas [

	colRecorridas add: self ubicacion
]

{ #category : 'accessing' }
Obrera >> colRecorridas [

	^ colRecorridas
]

{ #category : 'accessing' }
Obrera >> colRecorridas: anObject [

	colRecorridas := anObject
]

{ #category : 'reseting' }
Obrera >> descargarMochila [

self mochila: 0
]

{ #category : 'accessing' }
Obrera >> estado [

	^ estado
]

{ #category : 'accessing' }
Obrera >> estado: anObject [

	estado := anObject
]

{ #category : 'initialization' }
Obrera >> initialize [ 

self colRecorridas: OrderedCollection new .
]

{ #category : 'accessing' }
Obrera >> mochila [

	^ mochila
]

{ #category : 'accessing' }
Obrera >> mochila: anObject [

	mochila := anObject
]
