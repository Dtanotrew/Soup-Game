class_name DialogueEntry extends Node

@export_multiline var text: String
var disp_npc: Npc

func enter(ui:DialogueUI, npc: Npc = null):
	disp_npc = npc
	ui.display_text(text, npc)
	ui.advance.connect(exit)

func exit(ui:DialogueUI, npc: Npc = null):
	if not npc && disp_npc:
		npc = disp_npc
	ui.advance.disconnect(exit)
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui, npc)
	else:
		self.get_parent().enter(ui, npc)
