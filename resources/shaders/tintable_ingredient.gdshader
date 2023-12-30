shader_type canvas_item;

uniform vec4 tint_color;

void fragment() {
	COLOR = texture(TEXTURE, UV) * tint_color;
}

