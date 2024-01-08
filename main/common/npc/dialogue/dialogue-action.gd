class_name DialogueAction extends DialogueEntry

func enter(ui:DialogueUI, npc:Npc  = null):
	self.exit(ui, npc)

func exit(ui:DialogueUI, npc: Npc = null):
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui, npc)
	else:
		self.get_parent().enter(ui, npc)
