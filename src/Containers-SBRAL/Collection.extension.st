Extension { #name : #Collection }

{ #category : #'*Containers-SBRAL' }
Collection >> asSBRAL [

	^ self inject: CTSBRAL new into: [ :sbral :each | sbral add: each ]
]
