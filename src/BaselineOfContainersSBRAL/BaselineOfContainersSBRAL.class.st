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
			with: [ spec repository: 'github://massimo-nocentini/Containers-Essentials:master' ].

		spec
			baseline: 'ContainersBinaryTreeAbstract'
			with: [ spec repository: 'github://massimo-nocentini/Containers-BinaryTreeAbstract:master/src' ].

		"Packages"
		spec
			package: 'Containers-SBRAL'
			with: [ spec requires: #( 'ContainersEssentials' ) ];
			package: 'Containers-SBRAL-Visualizations'
			with: [ spec requires: #( 'Containers-SBRAL' ) ];
			package: 'Containers-SBRAL-Tests'
			with: [ spec requires: #( 'Containers-SBRAL' 'ContainersBinaryTreeAbstract' ) ] ]
]
