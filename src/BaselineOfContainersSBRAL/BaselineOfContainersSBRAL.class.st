Class {
	#name : #BaselineOfContainersSBRAL,
	#superclass : #BaselineOf,
	#category : #BaselineOfContainersSBRAL
}

{ #category : #baselines }
BaselineOfContainersSBRAL >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Externals."
		spec
			baseline: 'ContainersEssentials'
			with: [ 
			spec repository: 'github://massimo-nocentini/Containers-Essentials' ].

		"Packages"
		spec
			package: 'Containers-SBRAL';
			package: 'Containers-SBRAL-Visualizations';
			package: 'Containers-SBRAL-Tests' ]
]
