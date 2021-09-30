"
A SBRALTest is a test class for testing the behavior of SBRAL
"
Class {
	#name : #CTSBRALTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-SBRAL-Tests'
}

{ #category : #tests }
CTSBRALTest >> testAt [

	| objs sbral |
	objs := (1 to: 100) shuffled.

	sbral := objs asSBRAL.

	objs withIndexDo: [ :each :i | 
		self assert: (sbral at: objs size - i + 1) equals: each ]
]

{ #category : #tests }
CTSBRALTest >> tree: aCollection [

	^ aCollection asSBRAL
]
