Extension { #name : #CTSBRALBinaryTreeNode }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTreeNode >> edges [
	^ self edges: nil
]

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTreeNode >> edges: outerEdges [
	^ left
		edges:
			(right
				edges:
					content -> left content ~~> (content -> right content ~~> outerEdges))
]
