extends Sprite2D

signal new_pickup(ing: Ingredient)

var ing: Ingredient
@onready var count = randi_range(1,5)

func _ready():
	ing = IngredientManager.get_next_spawn() as Ingredient
	texture = ing.icon

func _on_area_2d_body_entered(_body):
	if IngredientManager.add_ingredient_to_player(ing.name, count):
		new_pickup.emit(ing)
	self.queue_free()
