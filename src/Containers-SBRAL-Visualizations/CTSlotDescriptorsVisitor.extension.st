Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTSBRAL: aSBRAL [

	^ (self visitObject: aSBRAL) , { 
		  (self newSlotDescriptor
			   selector: #first;
			   enablePredicate: [ aSBRAL isEmpty not ];
			   yourself).

		  (self newSlotDescriptor
			   selector: #asShapeForest;
			   inline;
			   quote) }
]
