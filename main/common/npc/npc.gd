class_name Npc extends Node

signal exit_dialogue

@export var id: String
@export var displayName: String
@export var icon: Texture2D
@export var quality_threshold: int = 0
@export var taste_threshold: int = 1
@export var variety_threshold: int = 2

@export var NPC_2D: PackedScene

@export_category("Dialogue Scenes")
@export var hint_dialogue: PackedScene
@export var chatter_dialogue: PackedScene
@export var soup_dialogue: PackedScene

# from -1 to 1
#@onready var opinion: float = base_opinion
@onready var hint_scene = hint_dialogue.instantiate() if hint_dialogue else null
@onready var chatter_scene = chatter_dialogue.instantiate() if chatter_dialogue else null
@onready var soup_scene = soup_dialogue.instantiate() if soup_dialogue else null

var latest_soup = {
	"soup": null,
	"taste": 0,
	"quality": 0,
	"variety": 0,
	"opinion": 0
}

func _ready():
	if hint_scene:
		self.add_child(hint_scene)
		hint_scene.finished.connect(_on_dialogue_finished)
	if chatter_scene:
		self.add_child(chatter_scene)
		chatter_scene.finished.connect(_on_dialogue_finished)
	if soup_scene:
		self.add_child(soup_scene)
		chatter_scene.finished.connect(_on_dialogue_finished)

func score_soup(soup: Soup):
	var score: float = 0
	if soup.variety > variety_threshold:
		latest_soup.variety = 1
	elif soup.variety < variety_threshold - 1:
		latest_soup.variety = -1
	else:
		latest_soup.variety = 0
	
	var adjusted_taste = soup.taste - taste_threshold
	if adjusted_taste >= 0:
		latest_soup.taste += 1
	elif adjusted_taste <= -2:
		latest_soup.taste -= 1
	if adjusted_taste >= taste_threshold:
		latest_soup.taste += 1
	if adjusted_taste <= -2 - taste_threshold:
		latest_soup.taste -= 1
		
	var adjusted_quality = soup.poison
	

func enter_dialogue(ui: DialogueUI):
	if hint_scene && IngredientManager.hintable.size() > 0:
		hint_scene.enter(ui, self)
	elif NpcManager.latest_soup != self.latest_soup["soup"] :
		latest_soup = NpcManager.latest_soup
		soup_scene.enter(ui, self)
	elif chatter_scene:
		chatter_scene.enter(ui, self)

func _on_dialogue_finished():
	exit_dialogue.emit()
