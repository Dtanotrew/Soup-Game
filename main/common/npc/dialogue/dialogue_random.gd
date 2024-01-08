class_name DialogueRandom extends DialogueSequence

func enter(ui: DialogueUI, npc: Npc = null):
	if(not children || child_index == 1):
		child_index = 0
		exit(ui, npc)
	var next = children[randi() % children.size()]
	child_index += 1
	next.enter(ui, npc)
	
