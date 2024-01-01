extends Control

signal close

var open_item: Ingredient
const tintable_icon = preload("res://main/common/icon/TintableIcon.tscn")

func open(item: Ingredient):
	open_item = item
	$Centering/NameBox/NameEdit.text = item.display_name
	$PanelContainer/TextEdit.text = item.player_notes
	
	var icon
	if item.tinted:
		icon = tintable_icon.instantiate()
		icon.set_textures(item.icon, item.icon_tint)
		icon.set_tint(item.color)
	else:
		icon = TextureRect.new()
		icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		icon.texture = item.icon
	icon.custom_minimum_size = Vector2(32, 32)
	$IconBox.add_child(icon)

func _on_save_pressed():
	clear_icon()
	if open_item != null:
		open_item.display_name = $Centering/NameBox/NameEdit.text
		open_item.player_notes = $PanelContainer/TextEdit.text
		open_item = null
	close.emit()

func _on_cancel_pressed():
	clear_icon()
	open_item = null
	close.emit()


func clear_icon():
	var icons = $IconBox.get_children()
	for icon in icons:
		$IconBox.remove_child(icon)
		icon.queue_free()
