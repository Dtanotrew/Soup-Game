extends Node

var platformer = preload("res://Testing/level_test.tscn")

func _ready():
	# npcMgr.load_predefined_npcs()
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
	$BrewTutorial.play()

func _on_brew_tutorial_complete():
	var tutorial = $BrewTutorial
	self.remove_child(tutorial)
	tutorial.queue_free()
	#NpcManager.debug_dia()


func _on_menu_exit_game():
	get_tree().quit()

func _on_brew_soup_complete(soup):
	NpcManager.latest_soup = soup
	$BrewSoup.visible = false
	var level = platformer.instantiate()
	self.add_child(level)
	level.complete.connect(_on_level_test_complete)

func _on_level_test_complete():
	var level = self.get_child(self.get_child_count()-1)
	level.visible = false
	$BrewSoup.show()
	$BrewSoup.start_brew()
	self.remove_child(level)
	level.queue_free()
