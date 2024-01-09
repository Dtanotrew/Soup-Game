extends Control

const tintable_icon = preload("res://main/common/icon/TintableIcon.tscn")

@onready var prompt_box = $VBoxContainer/TextDisplay/PromptPanel/PromptVAlign/NamePrompt
@onready var icon_box = $VBoxContainer/CenterContainer/IconBox

var new_ing: Ingredient

func prompt_new_ing(ing:Ingredient):
	get_tree().paused = true
	new_ing = ing
	icon_box.add_child(create_icon(ing))
	self.set_visible(true)
	prompt_box.grab_focus()

func save():
	self.set_visible(false)
	get_tree().paused = false
	new_ing.display_name = prompt_box.text
	new_ing = null
	icon_box.remove_child(icon_box.get_child(0))

func create_icon(ing) -> Control:
	var icon
	if ing.tinted:
		icon = tintable_icon.instantiate()
		icon.set_textures(ing.icon, ing.icon_tint)
		icon.set_tint(ing.color)
	else:
		icon = TextureRect.new()
		icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_COVERED
		icon.texture = ing.icon
	#icon.custom_minimum_size = Vector2(32, 32)
	return icon

func _on_name_prompt_text_submitted(_new_text):
	save()

func _on_save_button_pressed():
	save()
