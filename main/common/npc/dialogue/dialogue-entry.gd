class_name DialogueEntry extends Node

@export_multiline var text: String

func enter(ui:DialogueUI):
	ui.set_show_character(false)
	ui.display_text(text)
	ui.advance.connect(exit)

func exit(ui:DialogueUI):
	ui.advance.disconnect(exit)
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui)
	else:
		self.get_parent().enter(ui)
