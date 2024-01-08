extends Node

var latest_soup: Soup

func debug_dia():
	$DialogueUI.visible = true
	$Dee.enter_dialogue($DialogueUI)

func get_npc(id: String):
	pass


func _on_exit_dialogue():
	$DialogueUI.visible = false
