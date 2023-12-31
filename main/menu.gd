extends Node2D

signal start_game

func display():
	#$MenuBG.show()	
	#$StartButton.show()
	#$CreditsButton.show()
	pass
	
func _on_start_button_pressed():
	#$MenuBG.hide()
	#$StartButton.hide()
	#$CreditsButton.hide()
	start_game.emit()
