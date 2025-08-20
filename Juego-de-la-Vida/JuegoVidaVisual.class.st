"
Juego de la vida es un código provisto por la cátedra Programación Orientada a Objetos - Facultad de Informática - Universidad Nacional del Comahue.
"
Class {
	#name : #JuegoVidaVisual,
	#superclass : #BorderedMorph,
	#instVars : [
		'miJuego',
		'botonUnTurno',
		'botonVariosTurnos',
		'botonSimulacion',
		'mundoVisual',
		'botonCerrar',
		'botonFinSimulacion'
	],
	#category : #'Juego-de-la-Vida-morph'
}

{ #category : #methods }
JuegoVidaVisual >> ejecutarTurnos [
"Se considera que se ejecutan 10 turnos. Esto deberá flexibilizarse, solicitando al
usuario la cantidad de turnos que desea ejecutar"
1 to: 10 do: [ :i| self ejecutarUnTurno.
].
]

{ #category : #methods }
JuegoVidaVisual >> ejecutarUnTurno [
"Se ejecuta un turno del juego de la vida"
miJuego ejecutarTurno.
]

{ #category : #initialization }
JuegoVidaVisual >> initialize [

	"Este método se ejecutará inmediatamente después del new"

	| origen filas columnas regla ancho alto |
	"Dado que JuegoVidaVisual es subclase de BorderedMorph, es necesario asegurar que se realizarón todas las inicializaciones necesarias relacionadas a variables y comportamiento heredado"
	super initialize.

	"Se establece el color del elemento gráfico, y su posición en la pantalla, o sea el WORLD (mundo). La posición para este morph es la esquina superior izquierda del recuadro."
	self color: Color orange.
	self position: 45 @ 45.

	"Se crea una instancia del modelo, en este caso de JuegoVida, y se guarda una referencia a ella en el morph JuegoVidaVisual Cada vez que sea necesario enviar un mensaje al juego se utilizará esta referencia. Tambien podría resolverse manteniendo la referencia en una variable temporal. A pesar de que el tamaño del mundo se asigna directamente, será apropiado darle mas flexibilidad, pidiendo el tamaño deseado al usuario. Los mismo respecto a la regla"
	filas := 30.
	columnas := 30.
	regla := '23/3'.
	miJuego := JuegoVida
		           crearMundoFilas: filas
		           columnas: columnas
		           reglas: regla.

	"Se crean los elementos gráficos, morphs, que se utilizarán para trabajar sobre el juego, en este caso un mundo visual que mantedrá la vista de las celulas del juego. El método 'extent' es para indicar el ancho y alto del recuadro "
	mundoVisual := Array2D
		               rows: filas
		               columns: columnas
		               tabulate: [ :i :j | 
		               self nuevaCeldaFila: i columna: j ].
	ancho := (mundoVisual at: 1 at: 1) width.
	alto := (mundoVisual at: 1 at: 1) height.
	self bounds:
		(self position extent: columnas * ancho + 200 @ (filas * alto + 50)).

	"Se crean los botones, que serán utilizados para poder llevar adelante el juego en distintas formas"
	botonUnTurno := BotonAccion new.
	botonVariosTurnos := BotonAccion new.
	botonSimulacion := BotonAccion new.
	botonFinSimulacion := BotonAccion new.
	botonCerrar := BotonAccion new.

	"Se agregan los elementos gráficos a JuegoVidaVisual, que actúa como elemento gráfico contenedor"
	self addMorph: botonUnTurno.
	self addMorph: botonVariosTurnos.
	self addMorph: botonSimulacion.
	self addMorph: botonFinSimulacion.
	self addMorph: botonCerrar.

	"Se posicionan los elementos gráficos dentro del area de JuegoVisual"
	origen := self innerBounds origin.
	botonUnTurno position: origen + (columnas * ancho + 25 @ 25).
	botonVariosTurnos position: botonUnTurno position + (0 @ 22).
	botonSimulacion position: botonVariosTurnos position + (0 @ 22).
	botonFinSimulacion position: botonSimulacion position + (0 @ 22).
	botonCerrar position: botonFinSimulacion position + (0 @ 22).

	"Se etiquetan los botones"
	botonUnTurno label: 'Ejecutar Turno'.
	botonVariosTurnos label: 'Ejecutar Varios Turnos'.
	botonSimulacion label: 'Ejecutar SimulaciÃ³n'.
	botonFinSimulacion label: 'CortarSimulacion'.
	botonCerrar label: 'CERRAR'.

	"Para que los cambios producidos en la instancia del modelo, (JuegoVida en este caso) se reflejen en los elementos gráficos es necesario que los elementos gráficos se registren como dependientes del modelo. En este caso las celulas visuales del mundoVisual van a ser dependientes de las celulas del modelo, por lo que la conección se realizará al trabajar sobre la celula visual. "
	"Aqui se indica cual será la acción que se ejecutará cuando haya alguna acción del mouse sobre cada botón"
	botonUnTurno mouseAction: [ self ejecutarUnTurno ].
	botonVariosTurnos mouseAction: [ self ejecutarTurnos ].

	"los mensajes startStepping y stopStepping se heredan de la clase Morph y su función es lograr la
dinámica del juego"
	botonSimulacion mouseAction: [ self startStepping ].
	botonFinSimulacion mouseAction: [ self stopStepping ].
	botonCerrar mouseAction: [ self collapse ]
]

{ #category : #methods }
JuegoVidaVisual >> nuevaCeldaFila: i columna: j [

	"Crea una celda para la posición (i,j) y la agrega al mundo visual."

	| c origen |
	c := CelulaVisual new.
	"Se toma el punto superios izquierdo de la instancia de JuegoVidaVisual (self) para a partir de alli ubicar a las celulas visuales"

	origen := self innerBounds origin.
	"Se agrega la celula visual creada al morph contenedor, en este caso la instancia de JuegoVidaVisual, y se posiciona en la pantalla"

	self addMorph: c.

	c position: ((j - 1) * (c width )) @ ((i - 1) * (c height )) + origen + (10@25).
	"Además se realiza la conección entre la celula visual y la celula del modelo, la celula visual se agrega como dependiente del modelo. De esta forma cada vez que se haga un CHANGED en la celula no visual asociada por un cambio de estado, se le notificara a 'c' para que se actualice"

	(miJuego fila: i columna: j) addDependent: c.
	"Se define la acción que se ejecutara cuando se accione sobre la celula visual que es un botón"

	c mouseAction: [ 
		c turnOff
			ifTrue: [ miJuego fila: i columna: j estado: 0 ]
			ifFalse: [ miJuego fila: i columna: j estado: 1 ] ].
	c update: (miJuego fila: i columna: j).
	^ c
]

{ #category : #opening }
JuegoVidaVisual >> openInWorld [
"Por defecto el método openInWorld de la clase Morph inicia el step. Este método se redefine para desactivarlo
hasta que sea explicitamente activado por el usuario con el boton correspondiente"
super openInWorld.
self stopStepping.
]

{ #category : #methods }
JuegoVidaVisual >> step [
"En cada paso de la simulación le corresponde ejecutar 1 turno del juego"
miJuego ejecutarTurno.
]

{ #category : #methods }
JuegoVidaVisual >> stepTime [
"Se define el tiempo que debe transcurrir entre step y step de la animación"
^100
]
