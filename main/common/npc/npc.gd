class_name Npc extends Node

signal exit_dialogue

@export var id: String
@export var displayName: String
@export var icon: Texture2D
@export var magic: bool = false
@export var special: bool = false
@export var base_opinion: float = 0

@export var hint_dialogue: PackedScene
@export var chatter_dialogue: PackedScene
@export var soup_dialogue: PackedScene

# from -1 to 1
@onready var opinion: float = base_opinion
@onready var hint_scene = hint_dialogue.instantiate() if hint_dialogue else null
@onready var chatter_scene = chatter_dialogue.instantiate() if chatter_dialogue else null
@onready var soup_scene = soup_dialogue.instantiate() if soup_dialogue else null

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

enum npc_flags {
	
}

func enter_dialogue(ui: DialogueUI):
	if hint_scene && IngredientManager.hintable.size() > 0:
		hint_scene.enter(ui, self)
		pass
	elif chatter_scene:
		chatter_scene.enter(ui, self)

func _on_dialogue_finished():
	exit_dialogue.emit()
