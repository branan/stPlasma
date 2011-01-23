PackageLoader fileInPackage: 'Plasma'.
x := Uoid new.
x fLocation fSequenceNumber printNl.

y := SceneNode new.
o := SceneObject new.
y fSceneObjects add: o.
y fSceneObjects printNl.
