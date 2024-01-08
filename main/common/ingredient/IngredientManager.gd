extends Control

@onready var iconBox = $VBoxContainer/CenterContainer/IconBox
@onready var textBox = $VBoxContainer/TextDisplay/PromptPanel/PromptVAlign/PromptText
@onready var promptBox = $VBoxContainer/TextDisplay/PromptPanel/PromptVAlign/NamePrompt

signal new_ingredient_start
signal new_ingredient_end

var ingredients = {}
var hintable = []

var new_ing: Ingredient

func _init():
	pass

func create_or_add_ingredient(id: String, num: int = 1):
	var ing = ingredients.get(id)
	if ing == null:
		ing = Ingredient.new()
		ingredients[id] = ing
		new_ingredient_start.emit()
		prompt_new_ing(ing)
	ing.count += num
	
func prompt_new_ing(ing:Ingredient):
	get_tree().paused = true
	new_ing = ing
	self.set_visible(true)

func save():
	self.set_visible(false)
	get_tree().paused = false
	new_ing.display_name = promptBox.text
	new_ing = null
	new_ingredient_end.emit()


func _on_name_prompt_text_submitted(_new_text):
	save()

func _on_save_button_pressed():
	save()
