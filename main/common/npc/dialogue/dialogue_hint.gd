class_name DialogueHint extends DialogueEntry

@export_multiline var format_string = "You're calling that {ing-name}? {lead_in}{message}"
@export_multiline var multi_hint = "Also, {message}"

@export_multiline var notebook_line = "{npc_name} thinks {message}"

@export_multiline var lead_in = "I heard "
@export_multiline var no_hint = "It's a pretty standard ingredient."

@export_multiline var msg_mild_poison = "it can irritate sensitive stomachs."
@export_multiline var msg_poison = "it should be used with caution."
@export_multiline var msg_good = "it's pretty good."
@export_multiline var msg_tasty = "it's very tasty."
@export_multiline var msg_super = "that's quite the culinary find."

func enter(ui:DialogueUI, npc: Npc = null):
	disp_npc = npc
	var ing = IngredientManager.hintable.back() as Ingredient
	IngredientManager.hintable.resize(IngredientManager.hintable.size()-1)
	
	var taste_msg
	var poison_msg
	var msg_count = 0
	if ing.effect == ing.Effect.SUPER:
		msg_count += 1
		taste_msg = msg_super
	elif ing.taste > 3:
		msg_count += 1
		taste_msg = msg_tasty
	elif ing.taste > 1:
		msg_count += 1
		taste_msg = msg_good
	
	if ing.poison > 2:
		msg_count += 1
		poison_msg = msg_poison
	elif ing.poison > 0:
		msg_count += 1
		poison_msg = msg_mild_poison
	
	if taste_msg:
		ing.player_notes += '\n' + notebook_line.format({"npc_name":npc.displayName, "message":taste_msg})
	if poison_msg:
		ing.player_notes += '\n' + notebook_line.format({"npc_name":npc.displayName, "message":poison_msg})
	
	var disp_text = format_string.format({"ing-name":ing.display_name})
	
	if msg_count == 0:
		disp_text = disp_text.format({"lead_in":"", "message":no_hint})
	else:
		disp_text = disp_text.format({"lead_in":lead_in})
		if msg_count == 1:
			if taste_msg:
				disp_text = disp_text.format({"message":taste_msg})
			else:
				disp_text = disp_text.format({"message":poison_msg})
		else:
			disp_text = disp_text.format({"message":taste_msg}) + multi_hint.format({"message":poison_msg})
	
	ui.display_text(disp_text, npc)
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
