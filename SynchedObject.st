Object subclass: SynchedStateDefn [
	|
		fObjKey
		fSendFlags
		fSDLName
	|
]

KeyedObject subclass: SynchedObject [
	|
		fSDLExcludeList
		fSDLVolatileList
		fSynchFlags
		fNetGroupId
	|

	<category: 'plasma'>
	<comment: 'I am the base class for all objects that are synchronized across the network.'>

	"implement getters and setters as needed"

	"implement flags as needed"

	SynchedObject class >> new [
		^(super new) initSynchedObject; yourself
	]

	initSynchedObject [
		fSDLExcludeList := Set new.
		fSDLVolatileList := Set new.
		fSynchFlags := 0.
		fNetGroupId := NetGroupId new.
	]

	readPrp: stream withManager: resMgr [
		self notYetImplemented
	]

	writePrp: stream withManager: resMgr [
		self notYetImplemented
	]
]
