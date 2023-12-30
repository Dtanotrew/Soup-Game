extends Node2D

signal brew_complete

const shelf_item = preload("res://main/brewing-scene/ShelfItem.tscn")
const potion_main = preload("res://resources/textures/ingredients/Bottle.png")
const potion_tint = preload("res://resources/textures/ingredients/bottle-tint.png")
const debug_main = preload("res://resources/textures/debug.png")
const debug_tint = preload("res://resources/textures/debug-tint.png")

const text_path = "res://resources/textures/ingredients/"
const ext = ".png"


func start_brew():
	
	
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
	
func debug_ingredient_from_resource(resource:String):
	var texture_path = text_path + resource + ext
	var ing = Ingredient.new()
	ing.display_name = resource
	ing.icon = load(texture_path)
	
	return ing

func add_shelf_item(item:Ingredient):
	var shelf_entry = shelf_item.instantiate()
	shelf_entry.setup(item)
	shelf_entry.right_click.connect(_on_shelf_item_right_click)
	shelf_entry.left_click.connect(_on_shelf_item_left_click)
	$BrewPanel/ItemScroller/Items.add_child(shelf_entry)
	
func _on_shelf_item_right_click(clicked):
	print(clicked)

func _on_shelf_item_left_click(clicked):
	$BrewPanel/ItemScroller/Items.remove_child(clicked)
	print(clicked)
	clicked.queue_free()
	
