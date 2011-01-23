Object subclass: Uoid [
	| 
		fLocation
		fLoadMask
		fObjectClass
		fObjectName
		fObjectId
		fPlayerId
		fCloneId
	|

	<category: 'plasma'>
	<comment: 'I am a universal object identifier'>

	fLocation [
		^fLocation.
	]

	fLocation: aLocation [
		fLocation := aLocation.
		^self.
	]

	fLoadMask [
		^fLoadMask.
	]

	fLoadMask: aLoadMask [
		fLoadMask := aLoadMask.
		^self.
	]

	fObjectClass [
		^fObjectClass.
	]

	fObjectClass: anObjectClass [
		fObjectClass := anObjectClass.
		^self.
	]

	fObjectName [
		^fObjectName.
	]

	fObjectName: anObjectName [
		fObjectName := anObjectName.
		^self.
	]

	fObjectId [
		^fObjectId.
	]

	fObjectId: anObjectId [
		fObjectId := anObjectId.
		^self.
	]

	fPlayerId [
		^fPlayerId.
	]

	fPlayerId: aPlayerId [
		fPlayerId := aPlayerId.
		^self.
	]

	fCloneId [
		^fCloneId.
	]

	fCloneId: aCloneId [
		fCloneId := aCloneId.
		^self.
	]

	Uoid class >> kHasCloneIDs [
		^1.
	]

	Uoid class >> kHasLoadMask [
		^2.
	]

	Uoid class >> new [
		^(super new)
			fLocation: Location new;
			fLoadMask: LoadMask new;
			fPlayerId: 0;
			fCloneId: 0;
			fObjectName: '';
			fObjectId: 0;
			fObjectClass: nil.
	]

	readPrp: stream withManager: resMgr [
		| contents |

		contents := stream readUInt8.
		fLocation readPrp: stream.
		((contents bitAnd: (self kHasLoadMask)) == 0) isFalse: [
			fLoadMask setAlways.
		] isTrue: [
			fLoadMask readPrp: stream.
		].
		fObjectClass := resMgr classFromId: (stream readInt16).
		fObjectId := stream readInt32.
		fObjectName := stream readSafeString.
		((contents bitAnd: (self kHasCloneIDs)) == 0) isFalse: [
			fCloneId := stream readInt32.
			fPlayerId := stream readInt32.
		].
		^nil.
	]

	writePrp: stream withManager: resMgr [
		| contents |

		contents := 0.
		(fCloneId == 0) isFalse: [
			contents := contents bitOr: (self kHasCloneIDs).
		].
		(fLoadMask isUsed) isTrue: [
			contents := contents bitOr: (self kHasLoadMask).
		].
		stream writeUInt8: contents.
		fLocation writePrp: stream.
		(fLoadMask isUsed) isTrue: [
			fLoadMask writePrp: stream.
		].
		stream writeInt16: (resMgr idFromClass: fObjectClass).
		stream writeInt32: fObjectId.
		stream writeSafeString: fObjectName.
		(fCloneId == 0) isFalse: [
			stream writeInt32: fCloneId.
			stream writeInt32: fPlayerId.
		].
		^nil.
	]
]
