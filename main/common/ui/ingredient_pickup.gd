extends Control

@onready var prompt_box = $VBoxContainer/TextDisplay/PromptPanel/PromptVAlign/NamePrompt

var new_ing: Ingredient

func prompt_new_ing(ing:Ingredient):
	get_tree().paused = true
	new_ing = ing
	self.set_visible(true)

func save():
	self.set_visible(false)
	get_tree().paused = false
	new_ing.display_name = prompt_box.text
	new_ing = null


func _on_name_prompt_text_submitted(_new_text):
	save()

func _on_save_button_pressed():
	save()
