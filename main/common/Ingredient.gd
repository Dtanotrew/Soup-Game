class_name Ingredient extends Resource

var taste: int = 0
var poison: int = 0
var count: int = 0
var color: Color = Color.BLACK
var icon: Texture2D = preload("res://resources/textures/debug.png")
var icon_tint: Texture2D = preload("res://resources/textures/debug-tint.png")
var tinted: bool = false
var tasteflags: int = TasteFlags.NONE
var effectflags: int = EffectFlags.NONE

var display_name: String = ""
var player_notes: String = ""

enum TasteFlags {
	NONE = 0,
	SPICY = 1,
	SWEET = 1 << 1,
	SOUR = 1 << 2,
	BITTER = 1 << 3
}

enum EffectFlags {
	NONE = 0,
	HEAL = 1,
	MAGIC = 1 << 1,
	TRIPPY = 1 << 2
}
