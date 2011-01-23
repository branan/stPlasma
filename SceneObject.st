SynchedObject subclass: SceneObject [
	|
		fSceneNode
		fDrawInterface
		fSimulationInterface
		fCoordinateInterface
		fAudioInterface
		fModifiers
		fGenerics
	|

	<category: 'plasma'>
	<comment: 'I am the core class for the componentwise buildup of world objects'>

	"implement getters/setters as needed"

	"implement enums as needed"

	SceneObject class >> new [
		^(super new) initSceneObject; yourself
	]

	initSceneObject [
		fModifiers = Set new.
		fGenerics = Set new.
	]

	readPrp: stream withManager: resMgr [
		self notYetImplemented
	]

	writePrp: stream withManager: resMgr [
		self notYetImplemented
	]
]
