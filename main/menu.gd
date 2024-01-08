extends Control

signal start_game
signal exit_game

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


func _on_credits_button_pressed():
	$Credits.visible = true


func _on_close_button_pressed():
	exit_game.emit()
