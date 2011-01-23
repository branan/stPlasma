KeyedObject subclass: SceneNode [
	|
		fSceneObjects
		fGenericPool
	|

	<category: 'plasma'>
	<comment: 'I hold references to everything involved in creating a scene'>

	fSceneObjects [
		^fSceneObjects.
	]

	fGenericPool [
		^fGenericPool.
	]

	SceneNode class >> new [
		^(super new) initSceneNode.
	]

	initSceneNode [
		fSceneObjects := (Set new).
		fGenericPool := (Set new).
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
			resMgr writeKey: (obj fKey) toStream: stream.
		].
		stream writeInt32: (PoolObjects size).
		fGenericPool do:[ :obj |
			resMgr writeKey: (obj fKey) toStream: stream.
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
				fGenericPool add: (msg fObj).
			].
			handled := true.
		].

		handled isFalse: [
			handled := super receiveMsg msg.
		].
		^handled.
	]
]
