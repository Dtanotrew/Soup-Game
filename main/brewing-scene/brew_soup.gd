extends Node2D

signal complete(soup)

const shelf_item = preload("res://main/brewing-scene/ShelfItem.tscn")

var soup
var progress: int

func start_brew():
	soup = Soup.new()
	progress = 0
	$BrewPanel/ShelfBottom/VBoxContainer/ProgressBar.value = progress
	$BrewBG/bg_tint.material.set_shader_parameter("tint_color", soup.color)
	# add ingredients from library
	for ing in IngredientManager.player_ingredients.values():
		add_shelf_item(ing)

func add_shelf_item(item:Ingredient):
	var shelf_entry = shelf_item.instantiate()
	shelf_entry.setup(item)
	shelf_entry.right_click.connect(_on_shelf_item_right_click)
	shelf_entry.left_click.connect(_on_shelf_item_left_click)
	$BrewPanel/ItemScroller/Items.add_child(shelf_entry)
	
func add_item_to_soup(item:Ingredient):
	soup.add_item(item)
	$BrewBG/bg_tint.material.set_shader_parameter("tint_color", soup.color)
	progress = min(progress + 1, 3)
	$BrewPanel/ShelfBottom/VBoxContainer/ProgressBar.value = progress
	
func _on_shelf_item_right_click(clicked:ShelfItem):
	$Notebook.show()
	$Notebook.open(clicked.item)

func _on_shelf_item_left_click(clicked:ShelfItem):
	var items_left = clicked.item.count 
	if items_left > 0:
		clicked.update_count(clicked.item.count - 1)
		add_item_to_soup(clicked.item)
	
func _on_notebook_close():
	$Notebook.hide()

func _on_brew_button_pressed():
	if not progress == 3:
		return
	for child in $BrewPanel/ItemScroller/Items.get_children():
		$BrewPanel/ItemScroller/Items.remove_child(child)
		child.queue_free()
	complete.emit(soup)


func _on_button_pressed():
	Global.goto_scene("res://Testing/level_test.tscn")


func _on_visibility_changed():
	if self.visible:
		$BrewTheme.play()
	else:
		$BrewTheme.stop()
