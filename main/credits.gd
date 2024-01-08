extends CenterContainer

func _on_rich_text_label_meta_clicked(meta):
	OS.shell_open(str(meta))

func _on_exit_pressed():
	self.visible = false
