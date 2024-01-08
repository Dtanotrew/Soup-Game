class_name DialogueUI extends Control

signal advance(ui: DialogueUI)
signal choice(ui: DialogueUI, index: int)

func set_show_character(vis: bool ):
	$IconPanel.visible = vis
	$Nametag.visible = vis

func display_text(lines: String):
	set_menu_visible(0)
	$SpeechPanel/SpeechStack/Text.visible = true
	$Advance.visible = true
	$SpeechPanel/SpeechStack/Text.text = lines
	
func display_menu(entries: Array):
	var count = min(entries.size(),3)
	set_menu_visible(count)
	$SpeechPanel/SpeechStack/Text.visible = false
	if count > 0:
		$SpeechPanel/SpeechStack/Button.text = entries[0]
	if count > 1: 
		$SpeechPanel/SpeechStack/Button2.text = entries[1]
	if count > 2:
		$SpeechPanel/SpeechStack/Button3.text = entries[2]
	
func set_menu_visible(count: int):
	$SpeechPanel/SpeechStack/Button.visible = false
	$SpeechPanel/SpeechStack/Button2.visible = false
	$SpeechPanel/SpeechStack/Button3.visible = false
	if count > 0:
		$SpeechPanel/SpeechStack/Button.visible = true
		$Advance.visible = false
	if count > 1: 
		$SpeechPanel/SpeechStack/Button2.visible = true
	if count > 2:
		$SpeechPanel/SpeechStack/Button3.visible = true

func menu_choice(index: int):
	choice.emit(self, index)

func _on_advance_pressed():
	advance.emit(self)

func _on_button_pressed():
	menu_choice(0)

func _on_button_2_pressed():
	menu_choice(1)

func _on_button_3_pressed():
	menu_choice(2)
