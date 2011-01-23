Object subclass: Key [
	|
		fUoid
		fObject
		fStartPos
		fDataLen
	|

	fUoid [
		^fUoid.
	]

	fUoid: anUoid [
		fUoid := anUoid.
		^self.
	]

	fObject [
		^fObject
	]

	fObject: anObject [
		fObject := anObject.
		^self.
	]

	fStartPos [
		^fStartPos.
	]

	fStartPos: aStartPos [
		fStartPos := aStartPos.
		^self.
	]

	fDataLen [
		^fDataLen.
	]

	fDataLen: aDataLen [
		fDataLen := aDataLen.
		^self.
	]

	Key class >> new [
		^(super new)
			fUoid: Uoid new;
			fObject: nil;
			fStartPos: -1;
			fDataLen: -1;
			yourself
	]
]
