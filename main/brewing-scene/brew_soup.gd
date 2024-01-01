extends Node2D

signal brew_complete(soup)

const shelf_item = preload("res://main/brewing-scene/ShelfItem.tscn")

var soup

func start_brew(ingMgr):
	soup = Soup.new()
	$Pot.set_tint(soup.color)
	# add ingredients from library
	for ing in ingMgr.ingredients:
		add_shelf_item(ing)
	
func end_brew():
	brew_complete.emit(soup)

func add_shelf_item(item:Ingredient):
	var shelf_entry = shelf_item.instantiate()
	shelf_entry.setup(item)
	shelf_entry.right_click.connect(_on_shelf_item_right_click)
	shelf_entry.left_click.connect(_on_shelf_item_left_click)
	$BrewPanel/ItemScroller/Items.add_child(shelf_entry)
	
func add_item_to_soup(item:Ingredient):
	soup.add_item(item)
	$Pot.set_tint(soup.color)
	
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
