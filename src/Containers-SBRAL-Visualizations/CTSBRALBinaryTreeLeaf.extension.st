Extension { #name : #CTSBRALBinaryTreeLeaf }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTreeLeaf >> edges [
	^ self edges: content -> content ~~> nil
]

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTreeLeaf >> edges: outerEdges [
	^ outerEdges
]
