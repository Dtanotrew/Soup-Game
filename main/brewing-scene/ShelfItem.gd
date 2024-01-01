class_name ShelfItem extends Control

const tintable_icon = preload("res://main/common/icon/TintableIcon.tscn")
var child
var item

signal right_click
signal left_click

func setup(ing: Ingredient): 
	#self.custom_minimum_size = Vector2(40, 40)
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
	child.set_anchors_preset(Control.PRESET_CENTER)
	child.set_position(Vector2(-16,-16))
	
	$CountLabel.set_text(str(item.count))
	self.move_child($CountLabel, -1)
	
func update_count(new_count:int):
	item.count = new_count
	$CountLabel.set_text(str(new_count))

func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			left_click.emit(self)
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			right_click.emit(self)
