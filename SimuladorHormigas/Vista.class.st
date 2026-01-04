"
Interfaz gráfica del simulador de hormigas
"
Class {
	#name : 'Vista',
	#superclass : 'BorderedMorph',
	#instVars : [
		'nuevoMundo',
		'tablero',
		'casillasVisuales',
		'botonCerrar',
		'hormigasMorph',
		'cajaMensaje',
		'botonSimulacion',
		'botonFinSimulacion',
		'botonVelocidad'
	],
	#category : 'SimuladorHormigas-Vista',
	#package : 'SimuladorHormigas',
	#tag : 'Vista'
}

{ #category : 'updating' }
Vista >> actualizar: unaCasilla enFila: fila columna: columna [

	unaCasilla ifNotNil: [ 
		unaCasilla submorphs first contents:
			((tablero at: fila) at: columna) estadoSiguiente ]
]

{ #category : 'updating' }
Vista >> actualizarCasilla: unaCasilla enFila: fila columna: columna [

	unaCasilla ifNotNil: [ 
		unaCasilla submorphs first contents:
			((tablero at: fila) at: columna) estadoSiguiente ]
]

{ #category : 'accessing' }
Vista >> botonCerrar [

	^ botonCerrar
]

{ #category : 'accessing' }
Vista >> botonCerrar: anObject [

	botonCerrar := anObject
]

{ #category : 'accessing' }
Vista >> botonFinSimulacion [

	^ botonFinSimulacion
]

{ #category : 'accessing' }
Vista >> botonFinSimulacion: anObject [

	botonFinSimulacion := anObject
]

{ #category : 'accessing' }
Vista >> botonSimulacion [

	^ botonSimulacion
]

{ #category : 'accessing' }
Vista >> botonSimulacion: anObject [

	botonSimulacion := anObject
]

{ #category : 'accessing' }
Vista >> cajaMensaje [

	^ cajaMensaje
]

{ #category : 'accessing' }
Vista >> cajaMensaje: anObject [

	cajaMensaje := anObject
]

{ #category : 'accessing' }
Vista >> casillaMorphEnFila: fila columna: columna [


	^ casillasVisuales at: fila @ columna ifAbsent: [ nil ]
]

{ #category : 'accessing' }
Vista >> casillasVisuales [

	^ casillasVisuales
]

{ #category : 'accessing' }
Vista >> casillasVisuales: anObject [

	casillasVisuales := anObject
]

{ #category : 'initialization' }
Vista >> cerrar [

	"minimiza la ventana"

	self collapse
	
]

{ #category : 'initialization' }
Vista >> construirBotoneraEnMundo: unMundo [
| mensaje |
	
	cajaMensaje := TextMorph new.
	botonCerrar := BotonAccion new.
	botonSimulacion := BotonAccion new.
	botonFinSimulacion := BotonAccion new.
	botonVelocidad := BotonAccion new.

	self addMorph: botonCerrar.
	self addMorph: cajaMensaje.
	self addMorph: botonSimulacion.
	self addMorph: botonFinSimulacion.
	self addMorph: botonVelocidad.
	
	botonVelocidad position: 200 @ 550.
	botonVelocidad label: 'x10'.

	botonSimulacion position: 300 @ 550.
	botonSimulacion label: 'Sim'.
	botonFinSimulacion position: 400 @ 550.
	botonFinSimulacion label: 'FinSim'.
	botonCerrar position: 500 @ 550.
	botonCerrar label: 'CERRAR'.
	cajaMensaje position: 600 @ 0.

	mensaje:= self construirMensaje .
	cajaMensaje
		string: mensaje
		fontName: 'Arial'
		size: 12
		wrap: true ;
		textColor: Color black;
		backgroundColor: Color white.

	botonCerrar mouseAction: [ self cerrar ].

	botonVelocidad mouseAction: [ self ejecutarTurnos ] .
	botonSimulacion mouseAction: [ self startStepping ].
	botonFinSimulacion mouseAction: [ self stopStepping ].
]

{ #category : 'initialization' }
Vista >> construirExploradorasMorph [

| exploradorasHormigueroUno exploradorasHormigueroDos hormiguero1 color1 hormiguero2 color2|
	hormigasMorph := OrderedCollection new.

	exploradorasHormigueroUno := nuevoMundo colHormigueros first reina
		                             colExploradoras.
	hormiguero1 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros first reina ubicacion.
	color1:= hormiguero1 color.
	
	exploradorasHormigueroUno do: [ :hormiga |
			| hormigaMorph|
			hormigaMorph := self crearHormigaMorph: hormiga color: color1.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ] .
		
	exploradorasHormigueroDos := nuevoMundo colHormigueros second reina
		                             colExploradoras.

	hormiguero2 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros second reina ubicacion.
	color2:= hormiguero2 color.
	
	exploradorasHormigueroDos do: [ :hormiga |
			| hormigaMorph |
			hormigaMorph := self crearHormigaMorph: hormiga color: color2.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ]
]

{ #category : 'initialization' }
Vista >> construirHormigasMorph [

self construirExploradorasMorph .

self construirObrerasMorph .
	
]

{ #category : 'initialization' }
Vista >> construirMensaje [
| mensaje data data1 data2  |
data := nuevoMundo mapa first first.
	data1 := nuevoMundo colHormigueros first.
	data2 := nuevoMundo colHormigueros at: 2.
	mensaje := 'Punto inicial: ' , data punto asString , ' Hormig1 '
	           , data1 ubicacion asString , ' Alime1 '
	           , data1 alimento asString , ' Hormig2 '
	           , data2 ubicacion asString , ' Alime2 '
	           , data2 alimento asString , ' Explo1 '
	           , data1 reina colExploradoras first ubicacion asString.
	
^ mensaje
]

{ #category : 'initialization' }
Vista >> construirObrerasMorph [

| obrerasHormigueroUno obrerasHormigueroDos hormiguero1 color1 hormiguero2 color2|
	hormigasMorph := OrderedCollection new.

	obrerasHormigueroUno := nuevoMundo colHormigueros first reina
		                             colObreras.
	hormiguero1 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros first reina ubicacion.
	color1:= hormiguero1 color.
	
	obrerasHormigueroUno do: [ :hormiga |
			| hormigaMorph|
			hormigaMorph := self crearHormigaMorph: hormiga color: color1.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ] .
		
	obrerasHormigueroDos := nuevoMundo colHormigueros second reina
		                             colObreras.

	hormiguero2 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros second reina ubicacion.
	color2:= hormiguero2 color.
	
	obrerasHormigueroDos do: [ :hormiga |
			| hormigaMorph |
			hormigaMorph := self crearHormigaMorph: hormiga color: color2.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ]
]

{ #category : 'initialization' }
Vista >> construirTableroVisual [

	self removeAllMorphs.
	casillasVisuales := Dictionary new.

	1 to: tablero size do: [ :fila | 
		1 to: (tablero at: 1) size do: [ :columna | 
			| casilla casillaVisual |
			casilla := (tablero at: fila) at: columna.
			casillaVisual := self
				               crearCasillaMorph: casilla
				               enFila: fila
				               columna: columna.

			"Almacenar referencia en el diccionario"
			casillasVisuales at: fila @ columna put: casillaVisual.

			self addMorph: casillaVisual ] ]
]

{ #category : 'initialization' }
Vista >> crearCasillaMorph: unaCasilla enFila: fila columna: columna [

	| origen casillaMorph textoMorph colRel filRel |
	origen := self innerBounds origin.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.


	casillaMorph := BorderedMorph new
		                borderWidth: 4;
		                borderColor: Color gray;
		                extent: 50 @ 50;
		                color: Color green;
		                position: origen + (colRel @ filRel);
		                yourself.

	"Crear texto con información"
	textoMorph := StringMorph new
		              contents: unaCasilla contenido;
		              color: Color black;
		              position: casillaMorph bounds origin + (10 @ 15);
		              yourself.

	casillaMorph addMorphBack: textoMorph.

	textoMorph contents = 'vacio' ifTrue: [ 
		casillaMorph color: Color lightOrange.
		textoMorph contents: '' ].

	textoMorph contents = 'hormiguero' ifTrue: [ 
		| hormiguero |
		hormiguero := self nuevoMundo encontrarHormigueroEn: unaCasilla punto .
		hormiguero color = 'rojo' ifTrue: [casillaMorph color: Color red.  ] ifFalse:[ casillaMorph color: Color lightGray ].
		textoMorph contents: 'Horm' ].

	textoMorph contents = 'alimento' ifTrue: [ 
		| alimento |
		alimento := self nuevoMundo encontrarAlimentoEn: fila@columna.
		casillaMorph color: Color lightYellow.
		textoMorph contents:
			alimento cantidad asString ].

	self addMorph: casillaMorph.


	unaCasilla addDependent: casillaMorph.

	^ casillaMorph
]

{ #category : 'initialization' }
Vista >> crearHormigaMorph: unaHormiga color: unColor [

	| origen columna fila colRel filRel hormigaMorph textoMorph |
	origen := self innerBounds origin.

	fila := unaHormiga ubicacion x.
	columna:= unaHormiga ubicacion y.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.

	hormigaMorph := Morph new
		                extent: 15 @ 15;
		                color: Color lightYellow ;
		                position: origen + (colRel +10@ filRel+10).
		
	textoMorph := StringMorph new
		              contents: 'E';
		              color: Color black;
		              position: hormigaMorph bounds origin + (3@1);
		              yourself.


	(self esExploradora:unaHormiga) ifTrue:[ textoMorph contents: 'E' ]ifFalse:[ textoMorph contents: 'O' ] .
	
	hormigaMorph addMorphBack: textoMorph.
	
	unColor = 'rojo' ifTrue:[ hormigaMorph color: Color red ] ifFalse:[ hormigaMorph color: Color lightGray ] .
	
	self addMorph: hormigaMorph.


	unaHormiga addDependent: hormigaMorph.

	^ hormigaMorph
]

{ #category : 'methods' }
Vista >> ejecutarTurnos [

	"Se considera que se ejecutan 10 turnos. Esto deberá flexibilizarse, solicitando al
usuario la cantidad de turnos que desea ejecutar"

	1 to: 10 do: [ :i | self ejecutarUnTurno ]
]

{ #category : 'methods' }
Vista >> ejecutarUnTurno [

	"Se ejecuta un turno del nuevoMundo"
| reina obrera reina2 obrera2|
	reina := nuevoMundo  colHormigueros first reina .
	obrera := reina colObreras first .
	
			((reina colContingencias isEmpty) & (obrera ubicacion = reina ubicacion)) ifTrue: [ self moverExploradora1  ] ifFalse:[
			self moverObrera1] .
		
	reina2 := nuevoMundo  colHormigueros second reina .
	obrera2 := reina2 colObreras first .
	
			((reina2 colContingencias isEmpty) & (obrera2 ubicacion = reina2 ubicacion)) ifTrue: [ self moverExploradora2  ] ifFalse:[
			self moverObrera2]
]

{ #category : 'initialization' }
Vista >> esExploradora:unaHormiga [

^ unaHormiga isKindOf: Exploradora .
]

{ #category : 'accessing' }
Vista >> hormigasMorph [

	^ hormigasMorph
]

{ #category : 'accessing' }
Vista >> hormigasMorph: anObject [

	hormigasMorph := anObject
]

{ #category : 'initialization' }
Vista >> initialize [

	"| mapa |"
	super initialize.
	self position: 45 @ 45.
	self bounds: (self position extent: 10 * 40 @ (10 * 40)).
	"mapa := Mapa new."
	"nuevoMundo := NuevoMundo nuevo: mapa."
	nuevoMundo := Mundo new.
	"nuevoMundo inicializarHormigueros.
	nuevoMundo inicializarFuenteAlimentos."
	tablero := nuevoMundo mapa.
	tablero addDependent: self.
	self construirTableroVisual.
	self construirHormigasMorph.
	self construirBotoneraEnMundo: nuevoMundo
]

{ #category : 'methods' }
Vista >> moverExploradora1 [

| exploradora |
			exploradora := self nuevoMundo colHormigueros first reina
				               colExploradoras first.
			

			nuevoMundo turnoExploradora: exploradora .
			
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo 
]

{ #category : 'methods' }
Vista >> moverExploradora2 [

| exploradora |
			exploradora := self nuevoMundo colHormigueros second reina
				               colExploradoras first.
			

			nuevoMundo turnoExploradora: exploradora .
			
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo 
]

{ #category : 'methods' }
Vista >> moverExploradoras [

| exploradora exploradora2 |
			exploradora := self nuevoMundo colHormigueros first reina
				               colExploradoras first.
				
			exploradora2 := self nuevoMundo colHormigueros second reina
				               colExploradoras first.
			

			nuevoMundo turnoExploradora: exploradora .
			nuevoMundo turnoExploradora: exploradora2 .
			
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo 
]

{ #category : 'methods' }
Vista >> moverObrera1 [

| obrera1 |
	obrera1 := self nuevoMundo colHormigueros first reina
				               colObreras first.
				
			nuevoMundo turnoObrera: obrera1 .
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo 
]

{ #category : 'methods' }
Vista >> moverObrera2 [

| obrera2 |
	obrera2 := self nuevoMundo colHormigueros second reina
				               colObreras first.
				
			nuevoMundo turnoObrera: obrera2 .
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo 
]

{ #category : 'methods' }
Vista >> moverObreras [

| obrera1 obrera2|
	obrera1 := self nuevoMundo colHormigueros first reina
				               colObreras first.
			obrera2 := self nuevoMundo colHormigueros second reina
				               colObreras first. 
				
			nuevoMundo turnoObrera: obrera1 .
			nuevoMundo turnoObrera: obrera2 .
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo 
]

{ #category : 'accessing' }
Vista >> nuevoMundo [

	^ nuevoMundo
]

{ #category : 'accessing' }
Vista >> nuevoMundo: anObject [

	nuevoMundo := anObject
]

{ #category : 'stepping and presenter' }
Vista >> step [

self ejecutarUnTurno 
]

{ #category : 'accessing' }
Vista >> tablero [

	^ tablero
]

{ #category : 'accessing' }
Vista >> tablero: anObject [

	tablero := anObject
]
