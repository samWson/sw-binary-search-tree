"
# SWBinarySearchTreeTest

I am the test case for `SWBinarySearchTree`.
"
Class {
	#name : #SWBinarySearchTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'tree'
	],
	#category : #'SWBinarySearchTree-Tests'
}

{ #category : #running }
SWBinarySearchTreeTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	
	super setUp.
	tree := SWBinarySearchTree withRoot: 8
]

{ #category : #tests }
SWBinarySearchTreeTest >> testInsertGreaterThanValue [

	tree insert: 10.
	self assert: tree root rightChild value equals: 10
]

{ #category : #tests }
SWBinarySearchTreeTest >> testInsertLessThanValue [

	tree insert: 4.
	self assert: tree root leftChild value equals: 4
]
