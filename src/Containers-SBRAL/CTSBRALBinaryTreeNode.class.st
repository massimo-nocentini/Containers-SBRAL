Class {
	#name : #CTSBRALBinaryTreeNode,
	#superclass : #CTSBRALBinaryTree,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Containers-SBRAL'
}

{ #category : #accessing }
CTSBRALBinaryTreeNode >> at: i key: aKey SBRAL: aSBRAL ifPresent: pBlock ifAbsent: aBlock [
	^ aSBRAL
		at: i
		key: aKey
		node: self
		ifPresent: pBlock
		ifAbsent: aBlock
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTreeNode >> at: i put: y key: aKey SBRAL: aSBRAL ifAbsent: aBlock [
	^ aSBRAL
		at: i
		put: y
		key: aKey
		node: self
		ifAbsent: aBlock
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTreeNode >> decrementSBRAL: aSbral [
	aSbral tree: left.
	aSbral cdr tree: right.
	^ aSbral
]

{ #category : #accessing }
CTSBRALBinaryTreeNode >> left [
	^ left
]

{ #category : #accessing }
CTSBRALBinaryTreeNode >> left: anObject [
	left := anObject
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTreeNode >> put: y [
	^ self class node: y left: left right: right
]

{ #category : #accessing }
CTSBRALBinaryTreeNode >> right [
	^ right
]

{ #category : #accessing }
CTSBRALBinaryTreeNode >> right: anObject [
	right := anObject
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTreeNode >> shapes: shapes edges: associations [

	super shapes: shapes edges: associations.

	associations
		add: self -> left;
		add: self -> right.

	left shapes: shapes edges: associations.
	right shapes: shapes edges: associations
]
