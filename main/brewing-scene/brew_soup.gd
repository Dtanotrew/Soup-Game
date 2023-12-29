extends Node2D

signal brew_complete

const tintable_icon = preload("res://main/common/icon/TintableIcon.tscn")
const potion_main = preload("res://resources/textures/ingredients/Bottle.png")
const potion_tint = preload("res://resources/textures/ingredients/bottle-tint.png")

func start_brew():
	var potion = tintable_icon.instantiate()
	potion.set_textures(potion_main, potion_tint)
	$BrewPanel/ItemScroller/Items.add_child(potion)
	#$BrewBG.show()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
