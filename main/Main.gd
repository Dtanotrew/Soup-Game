extends Node

@onready var ingMgr = $IngredientManager
@onready var npcMgr = NpcManager.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	npcMgr.load_predefined_npcs()
	$Menu.display()
	pass # Replace with function body.

func _on_menu_start_game():
	$Menu.hide()
	$Intro.play()

func _on_intro_complete():
	var intro = $Intro
	self.remove_child(intro)
	intro.queue_free()
	$BrewSoup.show()
	$BrewSoup.start_brew()
