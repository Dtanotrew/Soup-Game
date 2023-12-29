extends TextureRect

func set_tint(color_rgba):
	$tint_layer.material.set_shader_parameter("tint_color", color_rgba)
