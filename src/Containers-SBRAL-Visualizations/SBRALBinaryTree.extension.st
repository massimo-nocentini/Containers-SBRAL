Extension { #name : #SBRALBinaryTree }

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRALBinaryTree >> edges [
	self subclassResponsibility
]

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRALBinaryTree >> edges: outerEdges [
	self subclassResponsibility
]

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRALBinaryTree >> gtInspectorTreeViewUsingCanvas: aCanvas [
	^ self edges asLinkedList asTree
		  gtInspectorGraphViewIn: aCanvas
		  vertexBlock: [ :aVertex | 
			  RSLabel new
				  text: aVertex content;
				  color: Color black;
				  yourself ]
]
