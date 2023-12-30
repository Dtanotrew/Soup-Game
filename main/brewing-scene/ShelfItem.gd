class_name ShelfItem extends TextureRect

const tintable_icon = preload("res://main/common/icon/TintableIcon.tscn")
var child
var item

signal right_click
signal left_click

func setup(ing: Ingredient): 
	item = ing;
	if item.tinted:
		child = tintable_icon.instantiate()
		child.set_textures(item.icon, item.icon_tint)
		child.set_tint(item.color)
	else:
		child = TextureRect.new()
		child.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		child.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		child.texture = item.icon
	child.custom_minimum_size = Vector2(32, 32)
	self.add_child(child)
	self.custom_minimum_size = Vector2(32, 32)

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			left_click.emit(self)
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			right_click.emit(self)
