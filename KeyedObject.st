Creatable subclass: KeyedObject [
	| key |

	<category: 'plasma'>
	<comment: 'I am the base for all objects with a key, known by the ResMgr'>

	key [
		^key.
	]

	key: aKey [
		key := aKey.
		^self.
	]

	readPrp: stream withManager: resMgr [
		<category: 'creatable'>
		key := resMgr readKeyFromStream: stream.
		^nil.
	]

	writePrp: stream withManager: resMgr [
		<category: 'creatable'>
		resMgr writeKey: key toStream: stream.
		^nil.
	]

	receiveMsg: msg [
		^false.
	]

]
