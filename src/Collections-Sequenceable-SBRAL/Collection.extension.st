Extension { #name : #Collection }

{ #category : #'*Collections-Sequenceable-SBRAL' }
Collection >> asSBRAL [

	^ self inject: SBRAL new into: [ :sbral :each | sbral add: each ]
]
