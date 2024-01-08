class_name DialogueComment extends Node

@export var format_string = "I {opinion_verb} your soup. It was {trait1} {joiner} {trait2}."

@export_category("Opinion Verb")
@export var strong_like: String = "loved"
@export var like: String = "liked"
@export var dislike: String = "didn't like"
@export var strong_dislike: String = "hated"

@export_category("Positive Traits")
@export var great_taste = "very tasty"
@export var good_taste = "tasty"
@export var great_quality = "wholesome"
@export var good_quality = "satisfying"

@export_category("Negative Traits")
@export var bad_taste = "bland"
@export var awful_taste = "boring"
@export var bad_quality = "made me sick"
@export var awful_quality = "inedible"

@onready var opinion_array = [strong_dislike, dislike, like, strong_like]
@onready var quality_array = [awful_quality, bad_quality, good_quality, great_quality]
@onready var taste_array = [awful_taste, bad_taste, good_taste, great_taste]

var disp_npc: Npc

func enter(ui:DialogueUI, npc: Npc = null):
	var qual_index = clampi(npc.latest_soup.variety-npc.variety_threshold+2, 0, 2)
	var vary_index = clampi(npc.latest_soup.quality-npc.quality_threshold+2, 0, 2)
	var opinion_index
	if qual_index == 0 || (vary_index < 2 && qual_index == 1):
		opinion_index = 0
	elif vary_index == 3 && qual_index == 3:
		opinion_index = 3
	elif max(qual_index, vary_index) == 3:
		opinion_index = 2
	
	
	
	disp_npc = npc
	var text = format_string.format({
		
	})
	# ui.display_text(text, npc)
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
	
