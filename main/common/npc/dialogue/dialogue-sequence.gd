class_name DialogueSequence extends Node

signal finished

@onready var children: Array[Node] = self.get_children()
var child_index: int = 0

func enter(ui: DialogueUI, npc: Npc = null):
	if(not children || child_index == children.size()):
		child_index = 0
		exit(ui, npc)
	var next = children[child_index]
	child_index += 1
	next.enter(ui, npc)

func exit(ui: DialogueUI, npc: Npc = null):
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui, npc)
	elif parent is DialogueSequence:
		parent.enter(ui, npc)
	else:
		finished.emit()
