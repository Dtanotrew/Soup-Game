extends Node2D

signal complete

func _on_button_pressed():
	Global.goto_scene("res://main/brewing-scene/brew_soup.tscn")

func _on_house_trigger_body_entered(_body):
	complete.emit()


func _on_visibility_changed():
	if self.visible:
		self.process_mode = Node.PROCESS_MODE_INHERIT
	else:
		self.process_mode = Node.PROCESS_MODE_DISABLED
