"
A SBRALTest is a test class for testing the behavior of SBRAL
"
Class {
	#name : #CTSBRALTest,
	#superclass : #CTBinaryTreeAbstractTest,
	#category : #'Containers-SBRAL-Tests'
}

{ #category : #tests }
CTSBRALTest >> tree: aCollection [

	^ aCollection asSBRAL
]
