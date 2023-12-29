shader_type canvas_item;

uniform sampler2D mask;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	vec2 mask_uv = UV;
	mask_uv.y = 1.0-mask_uv.y;
	COLOR.a = texture(mask, mask_uv).a;
}

