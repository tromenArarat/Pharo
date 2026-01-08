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
Vista >> construirGuardianaMorph [

| guardianasHormigueroUno guardianasHormigueroDos hormiguero1 color1 hormiguero2 color2|
	hormigasMorph := OrderedCollection new.

	guardianasHormigueroUno := nuevoMundo colHormigueros first reina
		                             colGuardianas.
	hormiguero1 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros first reina ubicacion.
	color1:= hormiguero1 color.
	
	guardianasHormigueroUno do: [ :hormiga |
			| hormigaMorph|
			hormigaMorph := self crearHormigaMorph: hormiga color: color1.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ] .
		
	guardianasHormigueroDos := nuevoMundo colHormigueros second reina
		                             colGuardianas.

	hormiguero2 := self nuevoMundo encontrarHormigueroEn: nuevoMundo colHormigueros second reina ubicacion.
	color2:= hormiguero2 color.
	
	guardianasHormigueroDos do: [ :hormiga |
			| hormigaMorph |
			hormigaMorph := self crearHormigaMorph: hormiga color: color2.

			hormigasMorph add: hormigaMorph.

			self addMorph: hormigaMorph ]
]

{ #category : 'initialization' }
Vista >> construirHormigasMorph [

self construirExploradorasMorph .

self construirObrerasMorph .

self construirGuardianaMorph .
	
]

{ #category : 'debugging' }
Vista >> construirMensaje [
| mensaje data data1 data2 data3 conting vecinoResult exploradora |
data := nuevoMundo mapa first first.
data1 := nuevoMundo colHormigueros first.
data2 := nuevoMundo colHormigueros second.
conting := data1 reina colContingencias isEmpty.
data3 := conting ifTrue: [ ' ' ] ifFalse: [ data1 reina colContingencias first contenido asString ].
	
"Get the first explorer safely"
exploradora := data1 reina colExploradoras ifNotEmpty: [:col | col first] ifEmpty: [nil].
	
"Get the first neighbor safely"
vecinoResult := exploradora ifNil: ['0'] ifNotNil: [:exp |
    exp colVecinos ifNotEmpty: [:vecinos | vecinos first] ifEmpty: ['0']].
	
mensaje := 'Punto inicial: ' , data punto asString , ' Hormig1 '
           , data1 ubicacion asString , ' Alime1 '
           , data1 alimento asString , ' Hormig2 '
           , data2 ubicacion asString , ' Alime2 '
           , data2 alimento asString , ' Explo1 '
           , (exploradora ifNil: ['none'] ifNotNil: [:exp | exp ubicacion asString])
           , ' Contin ' , data3 asString , ' colVec ' , vecinoResult asString.
	
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
			1 to: tablero first size do: [ :columna |
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
	columna := unaHormiga ubicacion y.

	colRel := columna - 1 * 50.
	filRel := fila - 1 * 50.

	hormigaMorph := Morph new
		                extent: 15 @ 15;
		                color: Color lightYellow;
		                position: origen + (colRel + 10 @ filRel + 10).

	textoMorph := StringMorph new
		              contents: 'E';
		              color: Color black;
		              position: hormigaMorph bounds origin + (3 @ 1);
		              yourself.


	(self esExploradora: unaHormiga)
		ifTrue: [ textoMorph contents: 'E' ]
		ifFalse: [
				(self esGuardiana: unaHormiga)
					ifTrue: [textoMorph contents: 'G' ]
					ifFalse: [ textoMorph contents: 'O'].
				 ].

	hormigaMorph addMorphBack: textoMorph.

	unColor = 'rojo'
		ifTrue: [ hormigaMorph color: Color red ]
		ifFalse: [ hormigaMorph color: Color lightGray ].

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
	| reina obrera reina2 obrera2 mensaje contingencia contingencia2 |
	
	"Primera colonia"
	reina := nuevoMundo colHormigueros first reina.
	reina colObreras ifEmpty: [ ^ self ]. "validación innecesaria por el momento"
	obrera := reina colObreras first.
	
	"Si no hay contingencias y la obrera está en hormiguero se mueve la exploradora"
	((reina colContingencias isEmpty) and: [obrera ubicacion = reina ubicacion]) 
		ifTrue: [ self moverExploradora1 ] 
		ifFalse: [ 
			contingencia := reina colContingencias ifNotEmpty: [:col | col first] ifEmpty: [nil].
			contingencia ifNil: [ 
				self moverObrera1 
			] ifNotNil: [ 
				mensaje := contingencia contenido.
				(mensaje = 'alimento') 
					ifTrue: [ self moverObrera1 ]
					ifFalse: [ self moverGuardiana1 ]
			]
		].
		
	"Segunda colonia"
	reina2 := nuevoMundo colHormigueros second reina.
	reina2 colObreras ifEmpty: [ ^ self ]. 
	obrera2 := reina2 colObreras first.
	
	((reina2 colContingencias isEmpty) and: [obrera2 ubicacion = reina2 ubicacion]) 
		ifTrue: [ self moverExploradora2 ] 
		ifFalse: [ 
			contingencia2 := reina2 colContingencias ifNotEmpty: [:col | col first] ifEmpty: [nil].
			contingencia2 ifNil: [ 
				self moverObrera2 
			] ifNotNil: [ 
				mensaje := contingencia2 contenido.
				(mensaje = 'alimento') 
					ifTrue: [ self moverObrera2 ]
					ifFalse: [ self moverGuardiana2 ]
			]
		].
]

{ #category : 'initialization' }
Vista >> esExploradora:unaHormiga [

^ unaHormiga isKindOf: Exploradora .
]

{ #category : 'initialization' }
Vista >> esGuardiana:unaHormiga [

^ unaHormiga isKindOf: Guardiana .
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

	super initialize.
	self position: 45 @ 45.
	self bounds: (self position extent: 10 * 40 @ (10 * 40)).
	nuevoMundo := Mundo new.
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
Vista >> moverGuardiana1 [

| guardiana1 |
	guardiana1 := self nuevoMundo colHormigueros first reina
				               colGuardianas first.
				
			nuevoMundo turnoGuardiana: guardiana1 .
			self construirTableroVisual.
			self construirHormigasMorph.
			self construirBotoneraEnMundo: nuevoMundo 

]

{ #category : 'methods' }
Vista >> moverGuardiana2 [

| guardiana2 |
	guardiana2 := self nuevoMundo colHormigueros second reina
				               colGuardianas first.
				
			nuevoMundo turnoGuardiana: guardiana2 .
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
