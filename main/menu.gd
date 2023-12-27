extends Node2D

signal start_game

func display():
	$MenuBG.show()	
	$StartButton.show()
	$CreditsButton.show()
	
func _on_start_button_pressed():
	#$MenuBG.hide()
	#$StartButton.hide()
	#$CreditsButton.hide()
	start_game.emit()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
