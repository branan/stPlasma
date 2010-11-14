Object subclass: Creatable [
	<category: 'plasma'>
	<comment: 'I am the base for all things that the Factory knows about'>

	readPrp: stream withManager: resMgr [
		<category: 'creatable'>
		self subclassResponsibility.
	]

	writePrp: stream withManager: resMgr [
		<category: 'creatable'>
		self subclassResponsibility.
	]
]
