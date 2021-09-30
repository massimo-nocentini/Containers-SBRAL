Extension { #name : #Collection }

{ #category : #'*Containers-SBRAL' }
Collection >> asSBRAL [

	^ self inject: SBRAL new into: [ :sbral :each | sbral add: each ]
]
