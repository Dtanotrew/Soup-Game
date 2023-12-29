extends Node2D

signal brew_complete

const tintable_icon = preload("res://main/common/icon/TintableIcon.tscn")
const potion_main = preload("res://resources/textures/ingredients/Bottle.png")
const potion_tint = preload("res://resources/textures/ingredients/bottle-tint.png")

const text_path = "res://resources/textures/ingredients/"
const ext = ".png"


func start_brew():
	
	
	var potion = tintable_icon.instantiate()
	potion.set_textures(potion_main, potion_tint)
	$BrewPanel/ItemScroller/Items.add_child(potion)
	
	# animal part textures
	for n in range(1,6):
		if n == 4: # no texture 4
			continue
		var item = texrec_from_resource("animal" + str(n))
		$BrewPanel/ItemScroller/Items.add_child(item)
		
	# fungus texture
	$BrewPanel/ItemScroller/Items.add_child(texrec_from_resource("fungus1"))
	
	# misc ingredient textures
	for n in range(1,6):
		$BrewPanel/ItemScroller/Items.add_child(texrec_from_resource("misc"+str(n)))
	
	# plant ingredient textures
	for n in range(1,5):
		$BrewPanel/ItemScroller/Items.add_child(texrec_from_resource("plant"+str(n)))
	
	for n in range(1,6):
		$BrewPanel/ItemScroller/Items.add_child(texrec_from_resource("misc"+str(n)))
	for n in range(1,6):
		$BrewPanel/ItemScroller/Items.add_child(texrec_from_resource("misc"+str(n)))
	
func texrec_from_resource(resource:String):
	var item = TextureRect.new()
	item.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	item.custom_minimum_size = Vector2(32,32)
	var texture_path = text_path + resource + ext
	item.texture = load(texture_path)
	return item
