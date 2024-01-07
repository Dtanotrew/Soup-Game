class_name SlidePlayer extends Control

signal complete

func play():
	self.visible = true
	$DialogueSequence.enter($DialogueUI)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_dialogue_sequence_finished():
	self.visible = false
	complete.emit()
