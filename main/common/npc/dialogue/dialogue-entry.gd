class_name DialogueEntry extends Node

@export var text: String

func enter(ui:DialogueUI):
	ui.set_show_character(false)
	ui.display_text(text)
	ui.advance.connect(exit)

func exit(ui:DialogueUI):
	ui.advance.disconnect(exit)
	self.get_parent().enter(ui)
