Extension { #name : #SBRAL }

{ #category : #'*Containers-SBRAL-Visualizations' }
SBRAL >> gtInspectorTreesInCanvas: aCanvas [
	| shapes |
	shapes := representation asLinkedList collect: [ :anAssociation | 
		          | c |
		          c := anAssociation value gtInspectorTreeViewUsingCanvas:
			               RSCanvas new.
		          (RSComposite new
			           shapes: { c asShape };
			           padding: 5;
			           withBorder;
			           yourself) @ (RSLabeled new text: anAssociation key) ].
	RSVerticalLineLayout new
		alignCenter;
		verticalGap: 20;
		applyOn: shapes.
	^ aCanvas
		  addAll: shapes;
		  yourself
]
