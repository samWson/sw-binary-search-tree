"
# SWBinarySearchTree

I am a binary search tree. I hold any kind of homogenous data that can be compared
and ordered e.g. integers and strings but not both types in the same tree. I 
support the following operations:

- Inserting, adding new values in the appropriate order
- Searching for values in the tree
- Deleting values from the tree

## TODO

- [x] Support insert operations
- [x] Handle duplicate values
- [x] Support search operations
- [ ] Support delete operations
  - [ ] Error handling
- [ ] Make the implementation a self balancing binary tree
- [x] Support creation of a binary tree from a collection e.g. `SWBinarySearchTree withElements: #(1 2 3 4 5 6)`
- [ ] Error handling for value types that have no natural ordering
- [ ] Error handling when inserting value types different to the type the tree is instantiated with e.g. adding strings to an integer tree
- [ ] Investigate extending debugger to display visual representation of tree (Refer to `GTInspector class`)
- [ ] Traversal is the same for each action: insert, search, delete. Consider making this action generic e.g. paramertise the action in a block

## Usage

I have a class side method for easy creation of an instance with a root node 
containing a value:

```
SWBinarySearchTree withRoot: 8. ""Answers a SWBinarySearchTree instance.""
```

A tree can also be created from the contents of a collection:

```
SWBinarySearchTree withElements: #(5 4 6 1 2 3).
```

New objects can be added to the tree with `#insert:`. They are wrapped in an
instance of `SWNode` and are the value of that node:

```
aBinarySearchTree insert: 4.
```

To test if an object is in the tree use `#find:`. `true` will be returned
if the object is found and `false` if it is not:

```
aBinarySearchTree find: 4. ""Answers `true`.""
```

If an object is not in the tree the method `#find:ifFalse:` will do an
alternative action in a block if the `find` action returned `false`:

```
aBinarySearchTree find: 10 ifFalse: [ :tree | tree insert: 10 ].
aBinarySearchTree find: 10. ""Answers `true`.""
```

## Structure

I am a collection of nodes. Each node may have exactly zero, one, or two children.
Every node has exactly one parent except for the root node which has no parent.
Each node contains one object which is its value. The children are known as 
the left-hand and right-hand child.

## Insertion

The nodes are ordered by their values so the tree may be searched efficiently.
When adding new nodes if the value is less than the root node then it is added
as the left-hand child. If the value is greater or equal then it is added as the
right-hand child. If the node already has a left or right-hand child then the 
value is passed to the child which will add it to one of its children. This 
proceeds recursively until a place is found to add the value.

## Searching

When searching the root node is made the *current* node, and then the search
proceeds recursively through the tree comparing the value being searched 
with the current node. If the searched value is less than the current node then
the search proceeds to the left-hand child. If the searched value is greater
then the search proceeds to the right-hand node. If the value is equal then the
search has found it. 

## Equality

I can be tested with another `SWBinarySearchTree` instance to see if we are
equal. We are equal if:
- both of our root nodes are `nil` or...
- the values, positions, and counts of all our nodes are identical

## Instance Variables

- root: the root node of the tree.

## Package Information

This package is built for [Jamis Bucks Weekly Programming Challenge #1](https://medium.com/@jamis/weekly-programming-challenge-1-55b63b9d2a1).
It is intended for educational use only and should not be considered for 
production ready code.

The prefix for this package and its classes is `SW` after the initials of the 
author Samuel Wilson.
"
Class {
	#name : #SWBinarySearchTree,
	#superclass : #Object,
	#instVars : [
		'root'
	],
	#category : #SWBinarySearchTree
}

{ #category : #'instance creation' }
SWBinarySearchTree class >> withElements: aCollection [
	
	| tree |
	tree := self new.
	aCollection do: [ :each | tree insert: each ].
	^ tree
]

{ #category : #'instance creation' }
SWBinarySearchTree class >> withRoot: anObject [

	^ self new insert: anObject 
]

{ #category : #comparing }
SWBinarySearchTree >> = aBinarySearchTree [

	^ self nodeRecursivelyEqual: self root with: aBinarySearchTree root
]

{ #category : #searching }
SWBinarySearchTree >> find: anObject [

	^ root 
		ifNil: [ false ]
		ifNotNil: [ root find: anObject ]
]

{ #category : #searching }
SWBinarySearchTree >> find: anObject ifFalse: aBlockClosure [
	
	^ (self find: anObject)
		ifTrue: [ true ]
		ifFalse: [ 
			aBlockClosure cull: self. 
			false. 
			]
	

]

{ #category : #inserting }
SWBinarySearchTree >> insert: anObject [

	root
		ifNil: [ root := SWNode withValue: anObject ] 
		ifNotNil: [ root insert: anObject ]
]

{ #category : #comparing }
SWBinarySearchTree >> nodeRecursivelyEqual: anSWNode with: anSWNode2 [
	"Recursively compare nodes for equality, returing true if all values are identical."
	
	(anSWNode isNil and: anSWNode2 isNil) ifTrue: [ ^ true ].
	
	(anSWNode isNil and: anSWNode2 isNotNil) ifTrue: [ ^ false ].
	
	(anSWNode isNotNil and: anSWNode2 isNil) ifTrue: [ ^ false ].
	
	^ (anSWNode = anSWNode2) and: (self nodeRecursivelyEqual: anSWNode leftChild with: anSWNode2 leftChild);
		and: (self nodeRecursivelyEqual: anSWNode rightChild with: anSWNode2 rightChild)
]

{ #category : #accessing }
SWBinarySearchTree >> root [

	^ root
]
