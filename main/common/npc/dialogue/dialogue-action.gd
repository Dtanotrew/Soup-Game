class_name DialogueAction extends DialogueEntry

func enter(ui:DialogueUI):
	self.exit(ui)

func exit(ui:DialogueUI):
	var parent = self.get_parent()
	if parent is DialogueMenu:
		parent.exit(ui)
	else:
		self.get_parent().enter(ui)
