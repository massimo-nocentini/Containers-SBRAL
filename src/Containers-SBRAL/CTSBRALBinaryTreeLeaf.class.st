"
I am a tree with one object only. The positions after the one of my object are absent from me, and I cannot be decremented.
"
Class {
	#name : #CTSBRALBinaryTreeLeaf,
	#superclass : #CTSBRALBinaryTree,
	#category : #'Containers-SBRAL'
}

{ #category : #accessing }
CTSBRALBinaryTreeLeaf >> at: i key: aKey SBRAL: aSBRAL ifPresent: pBlock ifAbsent: aBlock [
	^ aBlock value
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTreeLeaf >> at: i put: y key: aKey SBRAL: aSBRAL ifAbsent: aBlock [
	^ aBlock value
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTreeLeaf >> decrementSBRAL: aSbral [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTreeLeaf >> put: y [
	^ self class leaf: y
]
