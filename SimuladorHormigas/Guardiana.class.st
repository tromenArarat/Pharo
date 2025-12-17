"
Estas hormigas luchan, solo saben hacer eso y es por esta razón que mientras no hay guerra simplemente esperan en la colonia, reforzando su entrenamiento. Son entrenadas desde su nacimiento, y ese entrenamiento básico dura 2 turnos, quiere decir que durante ese lapso no podrán ser enviadas a la guerra.

Todas pasan por el mismo entrenamiento, por lo que todas tienen la misma vida, resistencia y poder de golpe, sin importar la colonia a la que pertenecen.

Las guerreras pueden actuar en modo defensa o modo ataque.
- El modo defensa es el que ocurre cuando una colonia es atacada. Las hormigas simplemente defienden desde adentro de la colonia.
- El modo ataque es cuando una hormiga va a otra colonia a atacar para conquistar y pelea para entrar a la colonia.

En cualquier modo la guerrera gana o muere.

Cada guerrera consume una unidad de comida por día solo cuando está en el hormiguero. Pero cuando está en batalla, sin importar el modo, no come ya que la adrenalina es tal que no le hace falta alimento.

Es importante destacar, que la guerrera solo puede atacar si está al lado de la colonia enemiga, es decir, para ir a la guerra debe caminar hasta la colonia enemiga.
"
Class {
	#name : #Guardiana,
	#superclass : #Hormiga,
	#instVars : [
		'estado'
	],
	#category : #'SimuladorHormigas-Base'
}

{ #category : #accessing }
Guardiana >> estado [

	^ estado
]

{ #category : #accessing }
Guardiana >> estado: anObject [

	estado := anObject
]
