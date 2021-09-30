Extension { #name : #CTSBRALBinaryTree }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTree >> edges [
	self subclassResponsibility
]

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTree >> edges: outerEdges [
	self subclassResponsibility
]

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTree >> gtInspectorTreeViewUsingCanvas: aCanvas [
	^ self edges asLinkedList asTree
		  gtInspectorGraphViewIn: aCanvas
		  vertexBlock: [ :aVertex | 
			  RSLabel new
				  text: aVertex content;
				  color: Color black;
				  yourself ]
]
