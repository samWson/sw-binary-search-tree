"
# SWNode

I am a node that holds a value and has up to two child nodes. I collaborate with
`SWBinarySearchTree` to form a tree of ordered nodes. Other instances of my class
are used as child nodes.

The object I hold is my *value*. If I have a left hand child then it must be less
than my value. If I have a right hand child then it must be greater than or equal
to my value.

## Usage

I have a class side method for easy creation of an instance holding a value:
```
SWNode withValue: 8. ""Answers an SWNode instance.""
```

## Instance Variables

- leftChild: A child node with a value less than mine.
- rightChild: A child node with a value greater than mine.
- value: The object I hold. This must be of a type that has a defined ordering.
"
Class {
	#name : #SWNode,
	#superclass : #Object,
	#instVars : [
		'leftChild',
		'rightChild',
		'value'
	],
	#category : #SWBinarySearchTree
}

{ #category : #'instance creation' }
SWNode class >> withValue: anObject [

	^ self new value: anObject 
]

{ #category : #accessing }
SWNode >> leftChild [

	^ leftChild
]

{ #category : #accessing }
SWNode >> leftChild: anSWNode [

	leftChild := anSWNode
]

{ #category : #accessing }
SWNode >> rightChild [

	^ rightChild
]

{ #category : #accessing }
SWNode >> rightChild: anSWNode [ 

	rightChild := anSWNode
]

{ #category : #accessing }
SWNode >> value [ 

	^ value
]

{ #category : #accessing }
SWNode >> value: anObject [

	value := anObject
]
