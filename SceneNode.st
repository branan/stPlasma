KeyedObject subclass: SceneNode [
	| SceneObjects PoolObjects |

	<category: 'plasma'>
	<comment: 'I hold references to everything involved in creating a scene'>

	SceneObjects [
		^SceneObjects.
	]

	PoolObjects [
		^PoolObjects.
	]

	init [
		super init. 
		SceneObjects := Set new.
		PoolObjects := Set new.
	]

	readPrp: stream withManager: resMgr [
		super readPrp: stream withManager: resMgr.
		stream readInt32 timesRepeat: [
			resMgr readKeyAndNotify: self withTag: #kSceneObject
		].
		stream readInt32 timesRepeat: [
			resMgr readKeyAndNotif: self withTag: #kPoolObject
		].
		^nil.
	]

	writePrp: stream withManager: resMgr [
		stream writeInt32: (SceneObjects size).
		SceneObjects do: [ :obj |
			resMgr writeKey: (obj key) toStream: stream.
		].
		stream writeInt32: (PoolObjects size).
		PoolObjects do:[ :obj |
			resMgr writeKey: (obj key) toStream: stream.
		].
		^nil.
	]

	receiveMsg: msg [
		|handled|
		(msg class == NodeRefMsg) isTrue: [
			(msg tag == #kSceneObject) isTrue: [
				SceneObjects add: (msg obj).
			].
			(msg tag == #kPoolObject) isTrue: [
				PoolObjects add: (msg obj).
			].
			handled := true.
		] isFalse: [
			handled := super receiveMsg msg.
		].
		^handled.
	]
]
