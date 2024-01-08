class_name SlidePlayer extends Control

signal complete

func play():
	self.visible = true
	$DialogueSequence.enter($DialogueUI)

func _on_dialogue_sequence_finished():
	self.visible = false
	complete.emit()
