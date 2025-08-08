Class {
	#name : #FechaModelo,
	#superclass : #Object,
	#instVars : [
		'fecha'
	],
	#category : #EjemploFecha
}

{ #category : #constructor }
FechaModelo class >> nuevo: unObjeto [

	"método constructor de la clase"

	^ self new fecha: unObjeto
]

{ #category : #changes }
FechaModelo >> aCadenaBarras [
"retorna la fecha con formato barras"
^ fecha mmddyyyy 
]

{ #category : #changes }
FechaModelo >> aCadenaComp [
"retorna la fecha completa"
^ fecha printString
]

{ #category : #changes }
FechaModelo >> aCadenaDias [

	"retorna el día de la semana"

	^ fecha weekday
]

{ #category : #changes }
FechaModelo >> decrementar: int [
"Esta operación produce cambios en el modelo, y esos cambios deben ser registrados por las vistas
(la instancia de FechaVisual creada). En el método initialize de FechaVisual la fechaVisual creada
se agregó como dependiente del modelo miFecha, por ello el método 'changed' actuará sobre ella.
El método changed tiene una implementación por defecto en Object, que envia el mensaje update
a todos sus dependientes. "
fecha:= fecha subtractDays: int.
self changed.
]

{ #category : #accessing }
FechaModelo >> fecha [

	^ fecha
]

{ #category : #accessing }
FechaModelo >> fecha: anObject [

	fecha := anObject
]

{ #category : #changes }
FechaModelo >> incrementar: int [
"esta operación produce cambios en el modelo, y esos cambios deben ser registrados por las vistas
(la instancia de FechaVisual creada)."
fecha := fecha addDays: int.
self changed.
]

{ #category : #changes }
FechaModelo >> setFecha: unObjeto [

	fecha := unObjeto .
	 self changed
]
