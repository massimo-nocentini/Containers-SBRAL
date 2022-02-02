Extension { #name : #CTSlotDescriptorsVisitor }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSlotDescriptorsVisitor >> visitCTSBRAL: aSBRAL [

	^ (self visitObject: aSBRAL)
	  ,
	  (aSBRAL
		   ifEmpty: [ {  } ]
		   ifNotEmpty: [ { #first asSlotDescriptor } ])
	  , { (#asShapeForest asSlotDescriptor
			   inline;
			   quote) }
]
