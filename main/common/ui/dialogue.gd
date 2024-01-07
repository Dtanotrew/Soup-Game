extends Control

signal dialogue_advance

func set_show_character(vis: bool ):
	$IconPanel.visible = vis
	$Nametag.visible = vis
