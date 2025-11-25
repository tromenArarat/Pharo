"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestQuinto,
	#superclass : #PackageManifest,
	#category : #'Quinto-Manifest'
}

{ #category : #'code-critics' }
ManifestQuinto class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#QuintoGame)) #'2025-11-25T10:31:01.889031-03:00') )
]

{ #category : #'code-critics' }
ManifestQuinto class >> ruleModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#QuintoGame #initialize #false)) #'2025-11-25T10:33:56.010088-03:00') )
]

{ #category : #'code-critics' }
ManifestQuinto class >> ruleNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#QuintoCell)) #'2025-11-25T10:30:39.171505-03:00') #(#(#RGClassDefinition #(#QuintoGame)) #'2025-11-25T10:30:59.244785-03:00') )
]

{ #category : #'code-critics' }
ManifestQuinto class >> rulePrecedenceRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#QuintoGame #newCellAt:at: #false)) #'2025-11-25T10:29:23.084627-03:00') )
]

{ #category : #'code-critics' }
ManifestQuinto class >> ruleToDoCollectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#QuintoGame #initialize #false)) #'2025-11-25T10:34:19.709426-03:00') )
]
