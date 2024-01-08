class_name DialogueSequence extends Node

signal finished

@onready var children: Array[Node] = self.get_children()
var child_index: int = 0

func enter(ui: DialogueUI):
	if(not children || child_index == children.size()):
		reset_dialogue()
		exit(ui)
	var next = children[child_index]
	child_index += 1
	next.enter(ui)
	
func reset_dialogue():
	child_index = 0

func exit(ui: DialogueUI):
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui)
	else:
		finished.emit()
