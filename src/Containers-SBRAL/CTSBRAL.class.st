Class {
	#name : #CTSBRAL,
	#superclass : #SkewBinaryCanonicalNumber,
	#instVars : [
		'element'
	],
	#category : #'Containers-SBRAL'
}

{ #category : #API }
CTSBRAL >> add: x [

	element := x.

	^ self increment
]

{ #category : #API }
CTSBRAL >> allButFirst [
	^ self decrement
]

{ #category : #API }
CTSBRAL >> at: i [
	^ self at: i ifAbsent: [ SubscriptOutOfBounds signalFor: i ]
]

{ #category : #private }
CTSBRAL >> at: i association: anAssoc ifPresent: pBlock ifAbsent: aBlock [
	| aTree |
	aTree := anAssoc value.
	^ i = 0
		ifTrue: [ pBlock value: aTree	"Regardless of `anAssoc key`." ]
		ifFalse: [ aTree
				at: i
				key: anAssoc key
				SBRAL: self
				ifPresent: pBlock
				ifAbsent: aBlock ]
]

{ #category : #API }
CTSBRAL >> at: i ifAbsent: aBlock [
	^ i > 0
		ifTrue: [ self at: i - 1 ifPresent: #content ifAbsent: aBlock ]
		ifFalse: aBlock
]

{ #category : #private }
CTSBRAL >> at: i ifPresent: pBlock ifAbsent: aBlock [
	^ representation
		ifNil: aBlock
		ifNotNil: [ | w |
			w := self key: representation.
			i < w
				ifTrue: [ self
						at: i
						association: representation value
						ifPresent: pBlock
						ifAbsent: aBlock ]
				ifFalse: [ self cdr at: i - w ifPresent: pBlock ifAbsent: aBlock ] ]
]

{ #category : #private }
CTSBRAL >> at: i key: w node: aNode ifPresent: pBlock ifAbsent: aBlock [
	| v |
	v := w // 2.
	^ i <= v
		ifTrue: [ self
				at: i - 1
				association: v -> aNode left
				ifPresent: pBlock
				ifAbsent: aBlock ]
		ifFalse: [ self
				at: i - 1 - v
				association: v -> aNode right
				ifPresent: pBlock
				ifAbsent: aBlock ]
]

{ #category : #API }
CTSBRAL >> at: i put: y [
	| aBlock |
	aBlock := [ SubscriptOutOfBounds signalFor: i ].
	^ i > 0
		ifTrue: [ self at: i - 1 put: y ifAbsent: aBlock ]
		ifFalse: aBlock
]

{ #category : #private }
CTSBRAL >> at: i put: y association: assoc ifAbsent: aBlock [
	| aTree |
	aTree := assoc value.
	^ i = 0
		ifTrue: [ aTree put: y ]
		ifFalse: [ aTree
				at: i
				put: y
				key: assoc key
				SBRAL: self
				ifAbsent: aBlock ]
]

{ #category : #private }
CTSBRAL >> at: i put: y ifAbsent: aBlock [
	^ representation
		ifNil: aBlock
		ifNotNil: [ | w assoc |
			assoc := representation value.
			w := assoc key.
			i < w
				ifTrue: [ | aTree |
					aTree := self
						at: i
						put: y
						association: assoc
						ifAbsent: aBlock.
					self cdr cons: w -> aTree ]
				ifFalse: [ (self cdr at: i - w put: y ifAbsent: aBlock) cons: assoc ] ]
]

{ #category : #private }
CTSBRAL >> at: i put: y key: w node: aNode ifAbsent: aBlock [
	| v |
	v := w // 2.
	^ i <= v
		ifTrue: [ CTSBRALBinaryTree
				node: aNode content
				left:
					(self
						at: i - 1
						put: y
						association: v -> aNode left
						ifAbsent: aBlock)
				right: aNode right ]
		ifFalse: [ CTSBRALBinaryTree
				node: aNode content
				left: aNode left
				right:
					(self
						at: i - 1 - v
						put: y
						association: v -> aNode right
						ifAbsent: aBlock) ]
]

{ #category : #'as yet unclassified' }
CTSBRAL >> decrementBitZeroOrTwo: anAssociation by: v onto: aRepresentation [

	| sbral |
	sbral := super
		         decrementBitZeroOrTwo: anAssociation
		         by: v
		         onto: aRepresentation.
	^ anAssociation value decrementSBRAL: sbral
]

{ #category : #API }
CTSBRAL >> first [
	^ self
		ifZero: [ CollectionIsEmpty signalWith: self ]
		ifNotZero: [ | assoc |
			assoc := representation value.
			assoc value content ]
]

{ #category : #evaluating }
CTSBRAL >> incrementBy: weight onto: aRepresentation two: currentValue inARow: nextValue [

	| sbral |
	sbral := super
		         incrementBy: weight
		         onto: aRepresentation
		         two: currentValue
		         inARow: nextValue.
	^ sbral tree: (CTSBRALBinaryTree
			   node: element
			   left: currentValue value
			   right: nextValue value)
]

{ #category : #evaluating }
CTSBRAL >> incrementDifferentAdjacentBits [

	^ super incrementDifferentAdjacentBits tree:
		  (CTSBRALBinaryTree leaf: element)
]

{ #category : #evaluating }
CTSBRAL >> incrementLastDigit [

	^ super incrementLastDigit tree: (CTSBRALBinaryTree leaf: element)
]

{ #category : #evaluating }
CTSBRAL >> incrementZero [

	^ super incrementZero tree: (CTSBRALBinaryTree leaf: element)
]

{ #category : #accessing }
CTSBRAL >> key: aValueLink [
	^ (super key: aValueLink) key
]

{ #category : #accessing }
CTSBRAL >> tree: aTree [
	representation value: representation value -> aTree
]
