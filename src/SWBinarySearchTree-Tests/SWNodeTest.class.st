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
SWNodeTest >> testEqualValues [

	| first second third firstNilNode secondNilNode |
	first := SWNode withValue: 2.
	second := SWNode withValue: 2.
	third := SWNode withValue: 4.
	firstNilNode := SWNode new.
	secondNilNode := SWNode new.
	
	self assert: (first equalValues: second).
	self deny: (first equalValues: third).
	self deny: (first equalValues: firstNilNode).
	self assert: (firstNilNode equalValues: secondNilNode)
]

{ #category : #tests }
SWNodeTest >> testEqualValuesWithDifferentCounts [
	
	| first second |
	first := SWNode withValue: 2.
	second := SWNode withValue: 2.
	
	self assert: (first equalValues: second).
	
	second insert: 2.
	
	self deny: (first equalValues: second)
]

{ #category : #tests }
SWNodeTest >> testInsertEqualValue [

	node insert: 10.
	node insert: 10.
	
	self assert: node leftChild equals: nil.
	self assert: node rightChild equals: nil.
	self assert: node count equals: 2 

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
	self assert: node value equals: 10.
	self assert: node count equals: 1
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
	self assert: node leftChild value equals: 5.
]
