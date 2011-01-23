Creatable subclass: KeyedObject [
	|
		fKey
		fKeyedObjectFlags
	|

	<category: 'plasma'>
	<comment: 'I am the base for all objects with a key, known by the ResMgr'>

	fKey [
		^fKey.
	]

	fKey: aKey [
		fKey := aKey.
		^self.
	]

	fKeyedObjectFlags [
		^fKeyedObjectFlags.
	]

	fKeyedObjectFlags: someFlags [
		fKeyedObjectFlags := someFlags.
		^self.
	]

	KeyedObject class >> kFlagPreventLoad [
		^1.
	]

	KeyedObject class >> kFlagPreventReset [
		^2.
	]

	KeyedObject class >> kFlagPreventInit [
		^4.
	]

	KeyedObject class >> new [
		^(super new) initKeyedObject; yourself
	]

	initKeyedObject [
		fKey := Key new.
		fKeyedObjectFlags := 0.
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
