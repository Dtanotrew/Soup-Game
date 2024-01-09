extends Node

const ing_path = "res://resources/data/ingredient/"

const ing_list: Array[Ingredient] = [
	preload("res://resources/data/ingredient/animal1.tres"),
	preload("res://resources/data/ingredient/animal2.tres"),
	preload("res://resources/data/ingredient/animal3.tres"),
	preload("res://resources/data/ingredient/animal5.tres"),
	preload("res://resources/data/ingredient/fungus1.tres"),
	preload("res://resources/data/ingredient/misc1.tres"),
	preload("res://resources/data/ingredient/misc2.tres"),
	preload("res://resources/data/ingredient/misc3.tres"),
	preload("res://resources/data/ingredient/misc4.tres"),
	preload("res://resources/data/ingredient/misc5.tres"),
	preload("res://resources/data/ingredient/plant1.tres"),
	preload("res://resources/data/ingredient/plant2.tres"),
	preload("res://resources/data/ingredient/plant3.tres"),
	preload("res://resources/data/ingredient/plant4.tres")
]

const hint_text_mild_poison = "Might irritate a sensitive stomach.\n"
const hint_text_poison = "Use sparingly.\n"
const hint_text_tasty = "Very tasty.\n"
const hint_text_mediocre = "A basic ingredient.\n"

@onready var pickup_ui = preload("res://main/common/ui/ingredient_pickup.tscn")



var ingredients = {}
var index = 0

var hintable = []

var player_ingredients = {}

var new_ing: Ingredient

func _ready():
	# 13 ingredients
	# 7 good
	# 4 bad
	# 2 both 
	var good = []
	var bad = []
	var both = []	
	
	for ing in ing_list:
		ingredients[ing.name] = ing
		ing.color = Ingredient.get_random_color()
		if ing.effect == ing.Effect.SUPER:
			assign_super(ing)
			continue
		var rand = randi_range(1,13)
		if rand <= 7 && good.size() < 7:
				assign_good(ing)
				good.append(ing)
		elif rand <= 11 && bad.size() < 4:
			assign_bad(ing)
			bad.append(ing)
		elif both.size() < 2:
			assign_both(ing)
			both.append(ing)
		else:
			if bad.size() > 3 && both.size() > 1:
				assign_good(ing)
				good.append(ing)
			elif bad.size() > 3:
				var rand2 = randi_range(1,9)
				if rand2 <= 7:
					assign_good(ing)
					good.append(ing)
				else:
					assign_both(ing)
					both.append(ing)
			else:
				var rand2 = randi_range(1,11)
				if rand2 <= 7:
					assign_good(ing)
					good.append(ing)
				else:
					assign_bad(ing)
					bad.append(ing)
	
	# add starting ingredients
	var good_ing_1 = randi_range(0,6)
	var good_ing_2 = randi_range(0,5)
	if good_ing_2 >= good_ing_1:
		good_ing_2 += 1
	var both_ing = randi_range(0,1)
	add_starting_ingredient(good[good_ing_1])
	add_starting_ingredient(good[good_ing_2])
	add_starting_ingredient(both[both_ing])

func assign_super(ing: Ingredient):
	@warning_ignore("integer_division")
	ing.poison = ((randi() % 10) / 10) as int
	ing.taste = randi_range(3,5)

func assign_good(ing: Ingredient):
	@warning_ignore("integer_division")
	ing.poison = ((randi() % 10) / 10) as int
	ing.taste = randi_range(1,4)
	
func assign_bad(ing: Ingredient):
	ing.poison = randi_range(0,5)
	ing.taste = randi_range(-2,2)
	
func assign_both(ing: Ingredient):
	ing.poison = randi_range(3,5)
	ing.taste = randi_range(3,5)
	
func add_starting_ingredient(ing: Ingredient):
	player_ingredients[ing.name] = ing
	ing.count = 10
	if ing.taste == 1:
		ing.player_notes += hint_text_mediocre
	else:
		ing.player_notes += hint_text_tasty
	if ing.poison == 1 || ing.poison == 2:
		ing.player_notes += hint_text_mild_poison
	elif ing.poison > 2:
		ing.player_notes += hint_text_poison
	
func add_ingredient_to_player(id: String, num: int = 1) -> bool:
	if player_ingredients.has(id):
		player_ingredients.get(id).count += num
		return false
	else:
		var ing = ingredients.get(id)
		if ing:
			player_ingredients[id] = ing
			ing.count += num
			hintable.append(ing)
			return true
	print("Error: Attempted to add invalid ingredient to player: " + id)
	return false
	
func get_next_spawn() -> Ingredient:
	var next = ingredients.values()[index] as Ingredient
	if next.effect == next.Effect.SUPER:
		index = (index + 1) % 14
		next = ingredients.values()[index] as Ingredient
	index = (index + 1) % 14
	return next
