Object subclass: Location [
	|
		fSequenceNumber
		fFlags
	|

	<category: 'plasma'>
	<comment: 'I am a handler for age and page IDs'>

	fSequenceNumber [
		^fSequenceNumber.
	]

	fSequenceNumber: aSequenceNumber [
		fSequenceNumber := aSequenceNumber.
		^self.
	]

	fFlags [
		^fFlags.
	]

	fFlags: someFlags [
		fFlags := someFlags.
		^self.
	]

	Location class >> kReserved [
		^4.
	]

	Location class >> kItinerant [
		^16.
	]

	isValid [
		^fSequenceNumber ~= 16rffffffff.
	]

	isReserved [
		^(fFlags bitAnd: (self kReserved)) ~= 0.
	]

	isItinerant [
		^(fFlags bitAnd: (self kItinerant)) ~= 0
	]

	isVirtual [
		^fSequenceNumber = 0.
	]

	Location class >> new [
		^(super new)
			fSequenceNumber: 16rFFFFFFFF;
			fFlags: 0.
	]

	< arg [
		^fSequenceNumber < (arg fSequenceNumber).
	]

	> arg [
		^fSequenceNumber > (arg fSequenceNumber).
	]

	<= arg [
		^fSequenceNumber <= (arg fSequenceNumber).
	]

	>= arg [
		^fSequenceNumber >= (arg fSequenceNumber).
	]

	= arg [
		^fSequenceNumber = (arg fSequenceNumber).
	]

	~= arg [
		^fSequenceNumber ~= (arg fSequenceNumber).
	]

	readPrp: stream [
		fSequenceNumber := stream readInt32.
		fFlags := stream readInt16.
		^nil.
	]

	writePrp: stream [
		stream writeInt32: fSequenceNumber.
		stream writeInt16: fFlags.
		^nil.
	]
]
