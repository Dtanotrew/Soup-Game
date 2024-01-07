class_name DialogueUI extends Control

signal advance

func set_show_character(vis: bool ):
	$IconPanel.visible = vis
	$Nametag.visible = vis

func display_text(lines: String):
	set_menu_visible(false)
	$SpeechPanel/SpeechStack/Text.visible = true
	$SpeechPanel/SpeechStack/Text.text = lines
	
func set_menu_visible(vis:bool):
	$SpeechPanel/SpeechStack/Button.visible = vis
	$SpeechPanel/SpeechStack/Button2.visible = vis
	$SpeechPanel/SpeechStack/Button3.visible = vis

func _on_advance_pressed():
	advance.emit(self)
