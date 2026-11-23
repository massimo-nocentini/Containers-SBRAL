"
I am the abstract superclass of the trees of a `CTSBRAL`, with an object as their `content`. My class side makes them: `leaf:` a `CTSBRALBinaryTreeLeaf` and `node:left:right:` a `CTSBRALBinaryTreeNode`.

My subclasses say how to find a position, how to put an object there and how to split when the first object of the list goes.
"
Class {
	#name : #CTSBRALBinaryTree,
	#superclass : #Object,
	#instVars : [
		'content'
	],
	#category : #'Containers-SBRAL'
}

{ #category : #'as yet unclassified' }
CTSBRALBinaryTree class >> leaf: x [
	^ CTSBRALBinaryTreeLeaf new
		content: x;
		yourself
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTree class >> node: x left: l right: r [
	^ CTSBRALBinaryTreeNode new
		content: x;
		left: l;
		right: r;
		yourself
]

{ #category : #accessing }
CTSBRALBinaryTree >> at: i key: aKey SBRAL: aSBRAL ifPresent: pBlock ifAbsent: aBlock [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTree >> at: i put: y key: aKey SBRAL: aSBRAL ifAbsent: aBlock [
	self subclassResponsibility
]

{ #category : #accessing }
CTSBRALBinaryTree >> content [
	^ content
]

{ #category : #accessing }
CTSBRALBinaryTree >> content: anObject [
	content := anObject
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTree >> decrementSBRAL: aSbral [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
CTSBRALBinaryTree >> put: y [
	^ self subclassResponsibility
]
