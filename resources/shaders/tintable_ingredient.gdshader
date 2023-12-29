shader_type canvas_item;

uniform vec4 tint_color;

void fragment() {
	COLOR = texture(TEXTURE, UV) * tint_color;
	
	// Called for every pixel the t is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
