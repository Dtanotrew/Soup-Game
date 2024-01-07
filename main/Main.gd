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
	$BrewSoup.show()
	$BrewSoup.start_brew()


