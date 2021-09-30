Extension { #name : #CTSBRALBinaryTree }

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTree >> asShapeTree [

	| shapes associations lines edgeBuilder |
	shapes := Dictionary new.
	associations := OrderedCollection new.

	self shapes: shapes edges: associations.

	edgeBuilder := RSLineBuilder horizontalBezier
		               attachPoint: (RSHorizontalAttachPoint new
				                startOffset: Float goldenRatio;
				                endOffset: Float goldenRatio negated;
				                yourself);
		               yourself.

	lines := associations collect: [ :each | 
		         edgeBuilder
			         edgeFrom: (shapes at: each key)
			         to: (shapes at: each value) ].

	RSHorizontalGaussianJitterVanDerPloegTreeLayout
		on: shapes
		edges: lines.

	^ RSComposite new
		  model: self;
		  shapes: shapes , lines;
		  yourself
]

{ #category : #'*Containers-SBRAL-Visualizations' }
CTSBRALBinaryTree >> shapes: shapes edges: associations [

	| aShape |
	aShape := RSLabel new
		          model: self content;
		          fontName: 'Source Code Pro';
		          yourself.

	shapes at: self put: aShape
]
