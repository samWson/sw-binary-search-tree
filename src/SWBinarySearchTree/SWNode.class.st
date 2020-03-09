"
# SWNode

I am a node that holds a value and has up to two child nodes. I collaborate with
`SWBinarySearchTree` to form a tree of ordered nodes. Other instances of my class
are used as child nodes.

The object I hold is my *value*. If I have a left hand child then it must be less
than my value. If I have a right hand child then it must be greater than my value.

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
delegate to one of its children, creating a new one if required. If a
value is inserted that is equal to the value I hold then my count will
increase by one to record the number of duplicate values I hold.

## Equality

I can be compared with another `SWNode` to see if we have equal values
with `#equalValues`. We are equal if our values and counts are identical.

## Instance Variables

- count, `Integer`: The number of duplicates of the value I hold.
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
		'value',
		'count'
	],
	#category : #SWBinarySearchTree
}

{ #category : #'instance creation' }
SWNode class >> withValue: anObject [

	^ self new insert: anObject 
]

{ #category : #accessing }
SWNode >> count [

	^ count
]

{ #category : #comparing }
SWNode >> equalValues: anSWNode [

	^ (self value = anSWNode value) and: (self count = anSWNode count)
]

{ #category : #searching }
SWNode >> find: anObject [ 
	
	| isFound |
	isFound := false.
	
	anObject = value ifTrue: [ isFound := true ].
	
	anObject < value ifTrue: [ self leftChild ifNotNil: [ :node | isFound := node find: anObject ] ].
	
	anObject > value ifTrue: [ self rightChild ifNotNil: [ :node | isFound := node find: anObject ] ].
	
	^ isFound 
]

{ #category : #initialization }
SWNode >> initialize [

	count := 0
]

{ #category : #'adding elements' }
SWNode >> insert: anObject [ 

	value 
		ifNil: [ value := anObject. count := count + 1 ] 
		ifNotNil: [ self insertInToChild: anObject ]
]

{ #category : #private }
SWNode >> insertInToChild: anObject [

	anObject = value ifTrue: [ count := count + 1 ]. 

	anObject < value ifTrue: [ self insertLeft: anObject ].
	
	anObject > value ifTrue: [ self insertRight: anObject ]
	
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
