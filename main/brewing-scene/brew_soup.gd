extends Node2D

signal brew_complete

const shelf_item = preload("res://main/brewing-scene/ShelfItem.tscn")

const text_path = "res://resources/textures/ingredients/"
const ext = ".png"

var soup

func start_brew():
	soup = Soup.new()
	$Pot.set_tint(soup.color)
	# animal part textures
	for n in range(1,6):
		if n == 4: # no texture 4
			continue
		add_shelf_item(debug_ingredient_from_resource("animal" + str(n)))
		
	# fungus texture
	add_shelf_item(debug_ingredient_from_resource("fungus1"))
	
	# misc ingredient textures
	for n in range(1,6):
		add_shelf_item(debug_ingredient_from_resource("misc"+str(n)))
	# plant ingredient textures
	for n in range(1,5):
		add_shelf_item(debug_ingredient_from_resource("plant"+str(n)))
	for n in range(1,6):
		add_shelf_item(debug_ingredient_from_resource("misc"+str(n)))
	for n in range(1,6):
		add_shelf_item(debug_ingredient_from_resource("misc"+str(n)))
	
func end_brew():
	brew_complete.emit(soup)
	
func debug_ingredient_from_resource(resource:String):
	var texture_path = text_path + resource + ext
	var ing = Ingredient.new()
	ing.display_name = resource
	ing.icon = load(texture_path)
	ing.count = 100
	ing.color = Color.from_hsv(randf_range(0,1),1,1)
	
	return ing

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
	print(clicked)

func _on_shelf_item_left_click(clicked:ShelfItem):
	var items_left = clicked.item.count 
	if items_left > 0:
		clicked.update_count(clicked.item.count - 1)
		add_item_to_soup(clicked.item)
	
