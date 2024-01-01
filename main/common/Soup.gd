class_name Soup extends Resource

var poison: float = 0
var taste: float = 0
var color:Color = Color.MEDIUM_BLUE
var ing_count: int = 0
var type_flags: int = 0
var effect_flags: int = 0
var variety: float = 0.0
var ingredients = []

func add_item(item:Ingredient):
	# poison and taste are the average of all the added ingredients
	poison = poison * (ing_count) / (ing_count + 1.0) + item.poison / (ing_count+1.0)
	taste = taste * (ing_count) / (ing_count + 1.0)  + item.poison / (ing_count+1.0)
	ing_count += 1
	color = item.color
	type_flags = type_flags | item.type
	effect_flags = effect_flags | item.effect
	
	if ingredients.find(item) != -1:
		variety += 1.0
	ingredients.append(item)
