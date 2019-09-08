"
# SWBinarySearchTree

I am a binary search tree. I hold any kind of homogenous data that can be compared
and ordered e.g. integers and strings but not both types in the same tree. I 
support the following operations:

- Inserting, adding new values in the appropriate order
- Searching for values in the tree
- Deleting values from the tree

## Structure

I am a collection of nodes. Each node may have exactly zero, one, or two children.
Every node has exactly one parent except for the root node which has no parent.
Each node contains one object which is its value. The children are known as 
the left-hand and right-hand childs.

## Insertion

The nodes are ordered by their values so the tree may be searched efficiently.
When adding new nodes if the value is less than the root node then it is added
as the left-hand child. If the value is greater or equal then it is added as the
right-hand child. If the node already has a left or right-hand child then the 
value is added to that child instead, proceeding recursively until a place is
found to add the value.

## Searching

When searching the root node is made the *current* node, and then the search
proceeds recursively through the tree comparing the value being searched 
with the current node. If the searched value is less than the current node then
the search proceeds to the left-hand child. If the searched value is greater
then the search proceeds to the right-hand node. If the value is equal then the
search has found it. 

## Instance Variables

- root: the root node of the tree.

## Package Information

This package is built for [Jamis Bucks Weekly Programming Challenge #1](https://medium.com/@jamis/weekly-programming-challenge-1-55b63b9d2a1).

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
