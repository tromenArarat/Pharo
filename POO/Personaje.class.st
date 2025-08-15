"
""Represento un personaje de videojuego. Soy un alien con una pala""
"
Class {
	#name : #Personaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'edad',
		'sprites',
		'currentSpriteIndex',
		'position',
		'velocity',
		'animationSpeed',
		'lastUpdateTime'
	],
	#category : #'POO-pruebas'
}

{ #category : #accessing }
Personaje >> animationSpeed [

	^ animationSpeed
]

{ #category : #accessing }
Personaje >> animationSpeed: anObject [

	animationSpeed := anObject
]

{ #category : #initialization }
Personaje >> currentSprite [
	^sprites at: currentSpriteIndex
]

{ #category : #accessing }
Personaje >> currentSpriteIndex [

	^ currentSpriteIndex
]

{ #category : #accessing }
Personaje >> currentSpriteIndex: anObject [

	currentSpriteIndex := anObject
]

{ #category : #initialization }
Personaje >> drawOn: aCanvas [
	aCanvas drawImage: self currentSprite at: position
]

{ #category : #accessing }
Personaje >> edad [

	^ edad
]

{ #category : #accessing }
Personaje >> edad: anObject [

	edad := anObject
]

{ #category : #initialization }
Personaje >> initialize [
	super initialize.
	sprites := OrderedCollection new.
	currentSpriteIndex := 1.
	position := 0@0.
	velocity := 0@0.
	animationSpeed := 0.2. "seconds per frame"
	lastUpdateTime := Time millisecondClockValue.
]

{ #category : #accessing }
Personaje >> lastUpdateTime [

	^ lastUpdateTime
]

{ #category : #accessing }
Personaje >> lastUpdateTime: anObject [

	lastUpdateTime := anObject
]

{ #category : #initialization }
Personaje >> moveLeft [
	velocity := -100@0
]

{ #category : #initialization }
Personaje >> moveRight [
	velocity := 100@0
]

{ #category : #accessing }
Personaje >> nombre [

	^ nombre
]

{ #category : #accessing }
Personaje >> nombre: anObject [

	nombre := anObject
]

{ #category : #accessing }
Personaje >> position [

	^ position
]

{ #category : #accessing }
Personaje >> position: anObject [

	position := anObject
]

{ #category : #initialization }
Personaje >> setSprites: aSpriteCollection [
	sprites := aSpriteCollection
]

{ #category : #accessing }
Personaje >> sprites [

	^ sprites
]

{ #category : #initialization }
Personaje >> stop [
	velocity := 0@0
]

{ #category : #initialization }
Personaje >> update [
	| currentTime deltaTime |
	currentTime := Time millisecondClockValue.
	deltaTime := (currentTime - lastUpdateTime) / 1000. "convert to seconds"
	lastUpdateTime := currentTime.
	
	"Update position based on velocity"
	position := position + (velocity * deltaTime).
	
	"Update animation frame if enough time has passed"
	self updateAnimation: deltaTime
]

{ #category : #initialization }
Personaje >> updateAnimation: deltaTime [
	| framesToAdvance |
	framesToAdvance := (deltaTime / animationSpeed) floor.
	currentSpriteIndex := currentSpriteIndex + framesToAdvance.
	
	"Loop animation"
	currentSpriteIndex > sprites size ifTrue: [
		currentSpriteIndex := currentSpriteIndex - sprites size
	].
]

{ #category : #accessing }
Personaje >> velocity [

	^ velocity
]

{ #category : #accessing }
Personaje >> velocity: anObject [

	velocity := anObject
]
