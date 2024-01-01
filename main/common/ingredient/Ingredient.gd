class_name Ingredient extends Resource

@export var color: Color = Color.BLACK
@export var icon: Texture2D
@export var icon_tint: Texture2D
@export var tinted: bool = false
@export var type: Type = Type.STOCK
@export var effect: Effect = Effect.NONE

var display_name: String = ""
var player_notes: String = ""
var taste: int = 0
var poison: int = 0
var count: int = 0

enum Type {
	STOCK = 1,
	MEAT = 1 << 1,
	VEGETABLE = 1 << 2,
	SPICY = 1 << 3,
	SOUR = 1 << 4,
	BITTER = 1 << 5
}

enum Effect {
	NONE = 0,
	HEAL = 1 << 0,
	MAGIC = 1 << 1,
	TRIPPY = 1 << 2
}
