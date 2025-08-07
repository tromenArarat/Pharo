"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMyCounterTests,
	#superclass : #PackageManifest,
	#category : #'MyCounter-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestMyCounterTests class >> ruleSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#CounterTest)) #'2025-08-06T20:46:39.322667-03:00') )
]
