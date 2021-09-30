Extension { #name : #SBRALBinaryTreeLeaf }

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRALBinaryTreeLeaf >> edges [
	^ self edges: content -> content ~~> nil
]

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRALBinaryTreeLeaf >> edges: outerEdges [
	^ outerEdges
]
