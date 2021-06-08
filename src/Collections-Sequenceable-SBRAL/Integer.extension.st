Extension { #name : #Integer }

{ #category : #'*Collections-Sequenceable-SBRAL' }
Integer >> skewBinaryCanonicalSparseRepresentation [
	^ self isZero
		  ifTrue: [ '•' ~~> nil ]
		  ifFalse: [ 
			  | skew |
			  skew := SkewBinaryCanonicalNumber new.
			  self timesRepeat: [ skew := skew increment ].
			  skew representation ]
]
