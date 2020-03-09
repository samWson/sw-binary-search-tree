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
	treeWithChildren := SWBinarySearchTree withElements: #(8 4 10 5 9)
]

{ #category : #tests }
SWBinarySearchTreeTest >> testCreationFromCollection [

	| expected treeFromCollection |
	expected := SWBinarySearchTree withRoot: 2.
	expected 
		insert: 4;
		insert: 1;
		insert: 5;
		insert: 6;
		insert: 3;
		insert: 1;
		insert: 5.
		
	treeFromCollection := SWBinarySearchTree withElements: #(2 4 1 5 6 3 1 5).

	self assert: (treeFromCollection hasEqualElements: expected)
]

{ #category : #tests }
SWBinarySearchTreeTest >> testEqualityWithEmptyAndNonEmptyTrees [

	| empty nonEmpty |
	empty := SWBinarySearchTree new.
	nonEmpty := SWBinarySearchTree withElements: #(4 5 1 6 2 3 1 5).
	
	self deny: empty equals: nonEmpty 
]

{ #category : #tests }
SWBinarySearchTreeTest >> testFindIfFalseDoAdditionalAction [

	| result |
	result := tree find: 8 ifFalse: [ :t | t insert: 10 ].

	self assert: result.
	
	self deny: (tree find: 10)	
]

{ #category : #tests }
SWBinarySearchTreeTest >> testFindIfFalseNoAdditionalAction [

	| result |
	result := tree find: 10 ifFalse: [ :t | t insert: 10 ].

	self deny: result.
	
	self assert: (tree find: 10)	
]

{ #category : #tests }
SWBinarySearchTreeTest >> testHasEqualElementsFalse [

	| elements first second |
	elements := #(4 2 6 1 3 5 1 6).
	first := SWBinarySearchTree withElements: elements.
	second := SWBinarySearchTree withElements: elements.
	first insert: 1.
	
	self deny: (first hasEqualElements: second)
]

{ #category : #tests }
SWBinarySearchTreeTest >> testHasEqualElementsNil [

	| first second |
	first := SWBinarySearchTree new.
	second := SWBinarySearchTree new.

	self assert: (first hasEqualElements: second)
]

{ #category : #tests }
SWBinarySearchTreeTest >> testHasEqualElementsNilAndNotNil [

	| nilTree notNilTree |
	nilTree := SWBinarySearchTree new.
	notNilTree := SWBinarySearchTree withRoot: 4.

	self deny: (notNilTree hasEqualElements: nilTree).
	self deny: (nilTree hasEqualElements: notNilTree)
	
]

{ #category : #tests }
SWBinarySearchTreeTest >> testHasEqualElementsTrue [

	| elements first second |
	elements := #(4 2 6 1 3 5 1 6).
	first := SWBinarySearchTree withElements: elements.
	second := SWBinarySearchTree withElements: elements.
	
	self assert: (first hasEqualElements: second)
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

{ #category : #tests }
SWBinarySearchTreeTest >> testSearchEmptyTree [

	| emptyTree |
	emptyTree := SWBinarySearchTree new.
	
	self deny: (emptyTree find: 1).
]

{ #category : #tests }
SWBinarySearchTreeTest >> testSearchMultiNodeTreeFalse [

	self deny: (treeWithChildren find: 12).
	self deny: (treeWithChildren find: 2)
]

{ #category : #tests }
SWBinarySearchTreeTest >> testSearchMultiNodeTreeTrue [

	self assert: (treeWithChildren find: 5).
	self assert: (treeWithChildren find: 9)
]

{ #category : #tests }
SWBinarySearchTreeTest >> testSearchSingleNodeTreeFalse [

	self deny: (tree find: 10)
]

{ #category : #tests }
SWBinarySearchTreeTest >> testSearchSingleNodeTreeTrue [

	self assert: (tree find: 8)
]
