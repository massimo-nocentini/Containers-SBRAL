"
A SBRALTest is a test class for testing the behavior of SBRAL
"
Class {
	#name : #SBRALTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Collections-Sequenceable-SBRAL-Tests'
}

{ #category : #tests }
SBRALTest >> tree: aCollection [

	^ aCollection asSBRAL
]
