"
I am the baseline of `CTSBRAL`. I depend on `ContainersEssentials` and `ContainersBinaryTreeAbstract`, and load three packages:

- `Containers-SBRAL`, the list and its trees.
- `Containers-SBRAL-Visualizations`, their shapes.
- `Containers-SBRAL-Tests`, the tests.
"
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
