extends TextureRect

@export var main_icon: Texture2D
@export var tint_icon: Texture2D
@export var color: Color = Color.BLACK

func _ready():
	$solid_layer.texture = main_icon
	$tint_layer.texture = tint_icon
	$tint_layer.material.set_shader_parameter("tint_color", color)

func set_tint(color_rgba):
	$tint_layer.material.set_shader_parameter("tint_color", color_rgba)

func set_textures(main: Texture2D, tint: Texture2D):
	$solid_layer.texture = main
	$tint_layer.texture = tint
