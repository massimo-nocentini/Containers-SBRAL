Extension { #name : #SBRALBinaryTreeNode }

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRALBinaryTreeNode >> edges [
	^ self edges: nil
]

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRALBinaryTreeNode >> edges: outerEdges [
	^ left
		edges:
			(right
				edges:
					content -> left content ~~> (content -> right content ~~> outerEdges))
]
