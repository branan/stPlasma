KeyedObject subclass: SceneNode [
	|
		fSceneObjects
		fPoolObjects
	|

	<category: 'plasma'>
	<comment: 'I hold references to everything involved in creating a scene'>

	fSceneObjects [
		^fSceneObjects.
	]

	fPoolObjects [
		^fPoolObjects.
	]

	SceneNode class >> new [
		^(super new) initSceneNode.
	]

	initSceneNode [
		fSceneObjects := Set new.
		fPoolObjects := Set new.
	]

	readPrp: stream withManager: resMgr [
		super readPrp: stream withManager: resMgr.
		stream readInt32 timesRepeat: [
			resMgr readKeyAndNotify: self withTag: #kSceneObject
		].
		stream readInt32 timesRepeat: [
			resMgr readKeyAndNotify: self withTag: #kPoolObject
		].
		^nil.
	]

	writePrp: stream withManager: resMgr [
		stream writeInt32: (SceneObjects size).
		fSceneObjects do: [ :obj |
			resMgr writeKey: (obj key) toStream: stream.
		].
		stream writeInt32: (PoolObjects size).
		fPoolObjects do:[ :obj |
			resMgr writeKey: (obj key) toStream: stream.
		].
		^nil.
	]

	receiveMsg: msg [
		|handled|

		handled := false.
		(msg class == NodeRefMsg) isTrue: [
			(msg fTag == #kSceneObject) isTrue: [
				fSceneObjects add: (msg fObj).
			].
			(msg fTag == #kPoolObject) isTrue: [
				fPoolObjects add: (msg fObj).
			].
			handled := true.
		].

		handled isFalse: [
			handled := super receiveMsg msg.
		].
		^handled.
	]
]
