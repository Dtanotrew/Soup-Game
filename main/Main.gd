extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu.display()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_menu_start_game():
	$Menu.hide()
	$BrewSoup.show()
	$BrewSoup.start_brew()


