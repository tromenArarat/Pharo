"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestSimuladorHormigas',
	#superclass : 'PackageManifest',
	#category : 'SimuladorHormigas-Manifest',
	#package : 'SimuladorHormigas',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestSimuladorHormigas class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Reina #inicializarSegunClaseDeBendi: #false)) #'2025-12-21T22:09:57.787465-03:00') )
]

{ #category : 'code-critics' }
ManifestSimuladorHormigas class >> rulePrecedenceRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#Vista #crearHormigaMorph: #false)) #'2025-12-28T21:07:22.386756-03:00') #(#(#RGMethodDefinition #(#Vista #crearCasillaMorph:enFila:columna: #false)) #'2025-12-29T08:10:34.646731-03:00') )
]
