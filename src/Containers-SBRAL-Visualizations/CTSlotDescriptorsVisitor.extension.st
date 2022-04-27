Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTSBRAL: aSBRAL [

	^ (self visitObject: aSBRAL) , { 
		  (self newSlotDescriptorSelector
			   selector: #first;
			   enablePredicate: [ aSBRAL isEmpty not ];
			   yourself).

		  (self newSlotDescriptorSelector
			   selector: #asShapeForest;
			   inline;
			   quote) }
]
