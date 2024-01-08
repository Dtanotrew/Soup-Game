class_name DialogueMenu extends Node

@export var option_1: String = ""
@export var option_2: String = ""
@export var option_3: String = ""

@onready var count: int = min(self.get_child_count(), 3)
@onready var entries= ([option_1, option_2, option_3].slice(0,count))

func enter(ui:DialogueUI):
	ui.set_show_character(false)
	ui.display_menu(entries)
	ui.choice.connect(_on_dialogue_ui_choice)

func exit(ui:DialogueUI):
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui)
	else:
		self.get_parent().enter(ui)

func _on_dialogue_ui_choice(ui:DialogueUI, index: int):
	ui.choice.disconnect(_on_dialogue_ui_choice)
	self.get_children()[index].enter(ui)
