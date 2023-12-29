extends TextureRect

var hue

func set_tint(color_rgba):
	$tint_layer.material.set_shader_parameter("tint_color", color_rgba)
	
func _ready():
	hue = 0
	set_tint(Color(Color.RED, 1.0))

func _process(delta):
	hue = hue + delta/5
	set_tint(Color.from_hsv(hue,1,1))
	
