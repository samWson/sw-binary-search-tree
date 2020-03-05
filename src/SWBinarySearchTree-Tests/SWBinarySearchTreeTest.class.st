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

	self assert: treeFromCollection equals: expected
]

{ #category : #tests }
SWBinarySearchTreeTest >> testEquality [

	| elemments first second |
	elemments := #(4 2 6 1 3 5 1 6).
	first := SWBinarySearchTree withElements: elemments.
	second := SWBinarySearchTree withElements: elemments.
	
	self assert: first equals: second 
]

{ #category : #tests }
SWBinarySearchTreeTest >> testEqualityWithEmptyAndNonEmptyTrees [

	| empty nonEmpty |
	empty := SWBinarySearchTree new.
	nonEmpty := SWBinarySearchTree withElements: #(4 5 1 6 2 3 1 5).
	
	self deny: empty equals: nonEmpty 
]

{ #category : #tests }
SWBinarySearchTreeTest >> testEqualityWithEmptyTrees [

	| first second |
	first := SWBinarySearchTree new.
	second := SWBinarySearchTree new.
	
	self assert: first equals: second 
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
