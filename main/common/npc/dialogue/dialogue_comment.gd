class_name DialogueComment extends Node

@export_multiline var format_string = "I {opinion} your soup. It was {taste_adj}. The variety was {variety_adj}."
@export var illness_string = "It made me feel sick."

@export_category("Opinion")
@export var strong_like: String = "loved"
@export var like: String = "liked"
@export var neutral: String = "liked"
@export var dislike: String = "didn't like"
@export var strong_dislike: String = "hated"

@export_category("Variety")
@export var good_variety = "interesting"
@export var mid_variety = "bland"
@export var bad_variety = "boring"

@export_category("Taste")
@export var great_taste = "very tasty"
@export var good_taste = "tasty"
@export var mid_taste = "okay"
@export var bad_taste = "bad"
@export var awful_taste = "inedible"

@onready var opinion_array = [strong_dislike, dislike, neutral, like, strong_like]
@onready var variety_array = [bad_variety, mid_variety, good_variety]
@onready var taste_array = [awful_taste, bad_taste, mid_taste, good_taste, great_taste]

var disp_npc: Npc

func enter(ui:DialogueUI, npc: Npc = null):
	disp_npc = npc
	
	var opinion = npc.latest_soup.variety + npc.latest_soup.taste - max(npc.latest_soup.poison - npc.max_poison,0)
	var opinion_sign = opinion/abs(opinion) as int
	var opinion_index: int = clamp((ceil(abs(opinion)/2) as int)*opinion_sign, -2, 2)+2
	var opinion_word = opinion_array[opinion_index]
	
	var variety_adj = variety_array[(npc.latest_soup.variety+1) as int]
	
	var taste_adj = taste_array[(npc.latest_soup.taste+1) as int]
	
	var text = format_string.format({
		"opinion":opinion_word,
		"taste_adj": taste_adj,
		"variety_adj": variety_adj
	})
	if npc.latest_soup.poison > npc.max_poison:
		text += " " + illness_string
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
	
