"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestModeloVistaEjemplo,
	#superclass : #PackageManifest,
	#category : #'ModeloVistaEjemplo-Manifest'
}

{ #category : #'code-critics' }
ManifestModeloVistaEjemplo class >> rulePrecedenceRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Vista #crearCeldaMorph:enFila:columna: #false)) #'2025-12-26T07:40:00.958412-03:00') #(#(#RGMethodDefinition #(#Vista #crearCasillaMorph:enFila:columna: #false)) #'2025-12-27T09:44:18.161083-03:00') )
]

{ #category : #'code-critics' }
ManifestModeloVistaEjemplo class >> ruleToDoRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Vista #construirTableroVisual #false)) #'2025-12-26T07:50:51.7727-03:00') )
]
