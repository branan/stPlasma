Creatable subclass: KeyedObject [
	|
		fKey
	|

	<category: 'plasma'>
	<comment: 'I am the base for all objects with a key, known by the ResMgr'>

	Key [
		^fKey.
	]

	Key: aKey [
		fKey := aKey.
		^self.
	]

	readPrp: stream withManager: resMgr [
		<category: 'creatable'>
		fKey := resMgr readKeyFromStream: stream.
		^nil.
	]

	writePrp: stream withManager: resMgr [
		<category: 'creatable'>
		resMgr writeKey: fKey toStream: stream.
		^nil.
	]

	receiveMsg: msg [
		^false.
	]

]
