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

When new values need to be added to a node use the `#insert:` method: 
```
anSWnode insert: 5.
```

`#insert:` is the only method that should be considered public for adding
values to a node. The node instance will assign a value to itself or 
delegate to one of its children, creating a new one if required.

## Instance Variables

- leftChild, `SWNode`: A child node that may hold a value less than mine.
- rightChild, `SWNode`: A child node that may hold a value greater than mine.
- value, `Object`: The object I hold. This must be of a type that has a defined ordering.
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

	^ self new insert: anObject 
]

{ #category : #'adding elements' }
SWNode >> insert: anObject [ 

	value 
		ifNil: [ value := anObject ] 
		ifNotNil: [ self insertInToChild: anObject ]
]

{ #category : #private }
SWNode >> insertInToChild: anObject [
 
	anObject < value
		ifTrue: [ self insertLeft: anObject ]
		ifFalse: [ self insertRight: anObject ]
	
]

{ #category : #private }
SWNode >> insertLeft: anObject [
 
	leftChild 
		ifNil: [ leftChild := self class withValue: anObject ]
		ifNotNil: [ leftChild insert: anObject ]
]

{ #category : #private }
SWNode >> insertRight: anObject [

	rightChild
		ifNil: [ rightChild := self class withValue: anObject ] 
		ifNotNil: [ rightChild insert: anObject ]
]

{ #category : #accessing }
SWNode >> leftChild [

	^ leftChild
]

{ #category : #accessing }
SWNode >> rightChild [

	^ rightChild
]

{ #category : #accessing }
SWNode >> value [ 

	^ value
]
