class_name Ingredient extends Resource


var display_name: String = "Item"
var taste: int = 0
var poison: int = 0
var count: int = 0
var color: Color = Color.BLACK
var icon: Texture2D = preload("res://resources/textures/debug.png")
var icon_tint: Texture2D = preload("res://resources/textures/debug-tint.png")
var tinted: bool = false
