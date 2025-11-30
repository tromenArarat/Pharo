Class {
	#name : #Exploradora,
	#superclass : #Object,
	#instVars : [
		'color',
		'estado',
		'mundo',
		'hormiguero',
		'ubicacion',
		'celdaDestino',
		'colRecorridas',
		'colMensajes'
	],
	#category : #SimuladorHormigas
}

{ #category : #moves }
Exploradora class >> evaluarUbicacion: unaUbicacion [
    "Evalúa si la ubicación tiene contenido (comida o colonia).
     Retorna true si tiene contenido, false si está vacía."
    
    ^ unaUbicacion contenido notNil
]

{ #category : #accessing }
Exploradora >> celdaDestino [

	^ celdaDestino
]

{ #category : #accessing }
Exploradora >> celdaDestino: anObject [

	celdaDestino := anObject
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

{ #category : #accessing }
Exploradora >> color [

	^ color
]

{ #category : #accessing }
Exploradora >> color: anObject [

	color := anObject
]

{ #category : #'game logic' }
Exploradora >> ejecutarTurno [

	"Ejecuta un turno completo de la exploradora, moviéndose hasta 4 posiciones"

	| movimientosRealizados |
	movimientosRealizados := 0.

	"Evaluar el estado de la exploradora"
	self estado = 'explorando' ifTrue: [ 
		[ movimientosRealizados < 4 ] whileTrue: [ "Mover aleatoriamente"
			self moverAleatorio.
			movimientosRealizados := movimientosRealizados + 1.

			"Evaluar la ubicación actual"
			(self evaluarUbicacion: self ubicacion)
				ifTrue: [ "Hay contenido en la celda"
					self ubicacion contenido = 'comida' ifTrue: [ "Agregar mensaje de comida"
						self colMensajes add:
							(Ubicacion
								 x: self ubicacion x
								 y: self ubicacion y
								 contenido: 'comida') ].
					self ubicacion contenido = 'colonia' ifTrue: [ "Agregar mensaje de colonia"
						self colMensajes add: (Ubicacion
								 x: self ubicacion x
								 y: self ubicacion y
								 contenido: 'colonia') ].

					"Cambiar a estado volviendo y salir del ciclo"
					self estado: 'volviendo'.
					movimientosRealizados := 4 "Forzar salida del ciclo" ]
				ifFalse: [ "Celda vacía, continuar explorando si quedan movimientos"
				 ] ] ].

	"Si está en estado volviendo, ejecutar el regreso al nido"
	self estado = 'volviendo' ifTrue: [ 
		[ 
		movimientosRealizados < 4 and: [ 
			(self ubicacion x ~= self hormiguero ubicacion x) | (self ubicacion y
			~= self hormiguero ubicacion y) ] ] whileTrue: [ 
			self volverAlNido.
			movimientosRealizados := movimientosRealizados + 1.

			"Verificar si llegó al hormiguero"
			(self ubicacion x = self hormiguero ubicacion x) & (self ubicacion y
			= self hormiguero ubicacion y) ifTrue: [ 
				self entregarMensajes.
				"Opcional: cambiar estado a explorando para el próximo turno"
				self estado: 'explorando' ] ] ]
]

{ #category : #'game logic' }
Exploradora >> entregarMensajes [
	"Transfiere todos los mensajes acumulados a la colección de mensajes de la Reina"
	| reina |
	
	"Buscar la reina en el mismo hormiguero"
	reina := self mundo encontrarReinaEn: self hormiguero.

	reina ifNotNil: [ 
		"Usar collect: para transferir todos los mensajes a la reina (aunque no necesitamos el resultado)"
		self colMensajes collect: [ :mensaje | reina colMensajes add: mensaje ].

		"Limpiar los mensajes de la exploradora"
		self colMensajes removeAll ].

	"Cambiar estado a explorando para el próximo turno"
	self estado: 'explorando'
]

{ #category : #moves }
Exploradora >> estaDentroDelMundo: unaUbicacion [

	"Verifica si una ubicación está dentro de los límites del mundo"

	| mundoActual |
	mundoActual := self mundo.

	^ (unaUbicacion x between: 1 and: mundoActual m) and: [ 
		  unaUbicacion y between: 1 and: mundoActual n ]
]

{ #category : #accessing }
Exploradora >> estado [

	^ estado
]

{ #category : #accessing }
Exploradora >> estado: anObject [

	estado := anObject
]

{ #category : #'game logic' }
Exploradora >> evaluarUbicacion: unaUbicacion [
    "Evalúa si la ubicación tiene contenido (comida o colonia).
     Retorna true si tiene contenido, false si está vacía."
    
    ^ unaUbicacion contenido notNil
]

{ #category : #accessing }
Exploradora >> hormiguero [

	^ hormiguero
]

{ #category : #accessing }
Exploradora >> hormiguero: anObject [

	hormiguero := anObject
]

{ #category : #moves }
Exploradora >> moverAleatorio [

	"Mueve la exploradora a una celda vecina aleatoria que esté dentro del mundo y no haya sido transitada. Prioriza celdas no transitadas, pero si no hay disponibles, permite moverse a celdas ya recorridas."

	| posiblesMovimientos vecinosValidos nuevaUbicacion |
    posiblesMovimientos := { 
        (Ubicacion x: self ubicacion x y: self ubicacion y + 1).
        (Ubicacion x: self ubicacion x y: self ubicacion y - 1).
        (Ubicacion x: self ubicacion x + 1 y: self ubicacion y).
        (Ubicacion x: self ubicacion x - 1 y: self ubicacion y) }.
    
    "Filtrar solo celdas dentro del mundo"
    vecinosValidos := posiblesMovimientos select: [ :vecino | 
        self estaDentroDelMundo: vecino ].
    
    "Priorizar celdas no transitadas"
    nuevaUbicacion := (vecinosValidos reject: [ :vecino | 
        self colRecorridas includes: vecino ]) atRandom
        ifNil: [ 
            "Si no hay celdas nuevas, usar cualquier celda válida"
            vecinosValidos isEmpty ifFalse: [ vecinosValidos atRandom ] ].
    
    nuevaUbicacion ifNotNil: [ 
        self ubicacion: nuevaUbicacion.
        self colRecorridas add: nuevaUbicacion ].
]

{ #category : #accessing }
Exploradora >> mundo [

	^ mundo
]

{ #category : #accessing }
Exploradora >> mundo: anObject [

	mundo := anObject
]

{ #category : #accessing }
Exploradora >> ubicacion [

	^ ubicacion
]

{ #category : #accessing }
Exploradora >> ubicacion: anObject [

	ubicacion := anObject
]

{ #category : #'game logic' }
Exploradora >> volverAlNido [

	"Mueve la exploradora hacia el hormiguero ajustando una coordenada por vez"

	| nuevaUbicacion |
	self ubicacion x ~= self hormiguero ubicacion x
		ifTrue: [ 
			nuevaUbicacion := self hormiguero ubicacion x < self ubicacion x
				                  ifTrue: [ 
				                  Ubicacion
					                  x: self ubicacion x - 1
					                  y: self ubicacion y ]
				                  ifFalse: [ 
				                  Ubicacion
					                  x: self ubicacion x + 1
					                  y: self ubicacion y ] ]
		ifFalse: [ 
			self ubicacion y ~= self hormiguero ubicacion y
				ifTrue: [ 
					nuevaUbicacion := self hormiguero ubicacion y < self ubicacion y
						                  ifTrue: [ 
						                  Ubicacion
							                  x: self ubicacion x
							                  y: self ubicacion y - 1 ]
						                  ifFalse: [ 
						                  Ubicacion
							                  x: self ubicacion x
							                  y: self ubicacion y + 1 ] ]
				ifFalse: [ ^ self ] ]
]
