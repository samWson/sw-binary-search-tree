"
# SWNodeTest

I am the test case for `SWNode`.

# Instance Variables

- node, `SWNode`: A node with no value or children.
- nodeWithChildren, `SWNode`: A node with a value and children.
"
Class {
	#name : #SWNodeTest,
	#superclass : #TestCase,
	#instVars : [
		'node',
		'nodeWithChildren'
	],
	#category : #'SWBinarySearchTree-Tests'
}

{ #category : #running }
SWNodeTest >> setUp [

	super setUp.
	node := SWNode new.
	nodeWithChildren := SWNode withValue: 10.
	nodeWithChildren insert: 5.
	nodeWithChildren insert: 15
]

{ #category : #tests }
SWNodeTest >> testInsertEqualValue [

	node insert: 10.
	node insert: 10.
	self assert: node rightChild value equals: 10

]

{ #category : #tests }
SWNodeTest >> testInsertGreaterThanValue [ 

	node insert: 10.
	node insert: 15.
	self assert: node rightChild value equals: 15
]

{ #category : #tests }
SWNodeTest >> testInsertInToEmptyNode [

	node insert: 10.
	self assert: node value equals: 10
]

{ #category : #tests }
SWNodeTest >> testInsertInToNodeWithChildren [

	nodeWithChildren insert: 4.
	self assert: nodeWithChildren leftChild leftChild value equals: 4
]

{ #category : #tests }
SWNodeTest >> testInsertLessThanValue [

	node insert: 10.
	node insert: 5.
	self assert: node leftChild value equals: 5
]
