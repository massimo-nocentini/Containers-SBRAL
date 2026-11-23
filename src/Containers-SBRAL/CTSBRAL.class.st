"
I am a random access list, built on the numbers of `SkewBinaryCanonicalNumber`: adding an object increments the number, and removing one decrements it.

My inherited `representation` is a chain of links, each with an association from the number of objects to the `CTSBRALBinaryTree` that holds them.

- `add:` answers a list with an object in front of mine.
- `first` answers the last object added, and `allButFirst` a list without it.
- `at:` and `at:ifAbsent:` answer the object at a position, where 1 is the position of `first`.
- `at:put:` answers a list with another object at a position.

The lists that `add:`, `allButFirst` and `at:put:` answer are new ones, and my objects stay as they are.

```smalltalk
| list other |
list := #( a b c d e ) asSBRAL.
list first. ""#e""
list at: 5. ""#a""
other := list at: 2 put: #z.
other at: 2. ""#z""
list at: 2 ""#d""
```

`at:` and `at:put:` signal `SubscriptOutOfBounds` when there is no such position. On an empty list, `first` signals `CollectionIsEmpty` and `allButFirst` an `ArithmeticError`.

My instance variable `lastAddedObject` is the last object given to `add:`, kept for the tree that will hold it.
"
Class {
	#name : #CTSBRAL,
	#superclass : #SkewBinaryCanonicalNumber,
	#instVars : [
		'lastAddedObject'
	],
	#category : #'Containers-SBRAL'
}

{ #category : #API }
CTSBRAL >> add: x [

	lastAddedObject := x.

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
		  ifEmpty: [ CollectionIsEmpty signalWith: self ]
		  ifNotEmpty: [ 
			  | assoc |
			  assoc := representation value.
			  assoc value content ]
]

{ #category : #API }
CTSBRAL >> ifEmpty: eBlock ifNotEmpty: neBlock [

	^ self ifZero: eBlock ifNotZero: neBlock
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
			   node: lastAddedObject
			   left: currentValue value
			   right: nextValue value)
]

{ #category : #evaluating }
CTSBRAL >> incrementDifferentAdjacentBits [

	^ super incrementDifferentAdjacentBits tree:
		  (CTSBRALBinaryTree leaf: lastAddedObject)
]

{ #category : #evaluating }
CTSBRAL >> incrementLastDigit [

	^ super incrementLastDigit tree: (CTSBRALBinaryTree leaf: lastAddedObject)
]

{ #category : #evaluating }
CTSBRAL >> incrementZero [

	^ super incrementZero tree: (CTSBRALBinaryTree leaf: lastAddedObject)
]

{ #category : #API }
CTSBRAL >> isEmpty [

	^ self ifEmpty: [ true ] ifNotEmpty: [ false ]
]

{ #category : #accessing }
CTSBRAL >> key: aValueLink [
	^ (super key: aValueLink) key
]

{ #category : #accessing }
CTSBRAL >> tree: aTree [
	representation value: representation value -> aTree
]
