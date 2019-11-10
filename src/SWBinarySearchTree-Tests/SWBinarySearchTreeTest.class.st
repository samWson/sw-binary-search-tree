"
# SWBinarySearchTreeTest

I am the test case for `SWBinarySearchTree`.

## Instance Variables

- tree: SWBinarySearchTree, a tree only containing a root node with a value.
- treeWithChildren, a tree containing a root node which has child nodes.
"
Class {
	#name : #SWBinarySearchTreeTest,
	#superclass : #TestCase,
	#instVars : [
		'tree',
		'treeWithChildren'
	],
	#category : #'SWBinarySearchTree-Tests'
}

{ #category : #running }
SWBinarySearchTreeTest >> setUp [
	
	super setUp.
	tree := SWBinarySearchTree withRoot: 8.
	treeWithChildren := SWBinarySearchTree withRoot: 8.
	treeWithChildren insert: 4.
	treeWithChildren insert: 10
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

{ #category : #tests }
SWBinarySearchTreeTest >> testInsertTreeWithChildrenLessThanValue [

	treeWithChildren insert: 3.
	self assert: treeWithChildren root leftChild leftChild value equals: 3 
	
]
