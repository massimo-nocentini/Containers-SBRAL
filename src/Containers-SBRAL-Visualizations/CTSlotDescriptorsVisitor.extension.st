Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTSBRAL: aSBRAL [

	^ (self visitObject: aSBRAL) , {
		  ((self newSlotDescriptorSelector: #first) enablePredicate: [
			   :level | aSBRAL isEmpty not ]).
		  ((self newSlotDescriptorSelector: #asShapeForest)
			   inline;
			   quote) }
]
