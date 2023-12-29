extends TextureRect

func set_tint(color_rgba):
	$tint_layer.material.set_shader_parameter("tint_color", color_rgba)

func set_textures(main: Texture2D, tint: Texture2D):
	$solid_layer.texture = main
	$tint_layer.texture = tint
