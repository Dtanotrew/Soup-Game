extends Node

@export var scenes : Node 
var event : InputEvent
# Called when the node enters the scene tree for the first time.
func _ready():
	# npcMgr.load_predefined_npcs()
	$Menu.display()
	pass # Replace with function body.

func _on_menu_start_game():
	$Menu.hide()
	$Intro.play()

func _process(delta):
	if event.is_action_pressed("scene_change"):
		get_tree().change_scene("res://Testing/level_test.tscn")

func _on_intro_complete():
	var intro = $Intro
	self.remove_child(intro)
	intro.queue_free()
	$BrewSoup.show()
	$BrewSoup.start_brew()
	$BrewTutorial.play()

func _on_brew_tutorial_complete():
	var tutorial = $BrewTutorial
	self.remove_child(tutorial)
	tutorial.queue_free()
	#NpcManager.debug_dia()


func _on_menu_exit_game():
	get_tree().quit()
