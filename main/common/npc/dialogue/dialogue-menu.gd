class_name DialogueMenu extends Node

@export var option_1: String = ""
@export var option_2: String = ""
@export var option_3: String = ""

@onready var count: int = min(self.get_child_count(), 3)
@onready var entries= ([option_1, option_2, option_3].slice(0,count))

var disp_npc: Npc

func enter(ui:DialogueUI, npc: Npc = null):
	disp_npc = npc
	ui.display_menu(entries, npc)
	ui.choice.connect(_on_dialogue_ui_choice)

func exit(ui:DialogueUI, npc: Npc = null):
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui, npc)
	else:
		self.get_parent().enter(ui, npc)

func _on_dialogue_ui_choice(ui:DialogueUI, index: int):
	ui.choice.disconnect(_on_dialogue_ui_choice)
	self.get_children()[index].enter(ui, disp_npc)
