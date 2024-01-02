extends State

@export var return_state : State
@export var return_anim: String = "move"
@export var attack1_name : String = "attack1"
@export var attack2_name : String = "attack2"

@onready var timer : Timer = $Timer

func state_input(event : InputEvent):
	if event.is_action_pressed("attack"):
		timer.start()

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == "attack1":
		if timer.is_stopped():
			next_state = return_state
			playback.travel(return_anim)
		else:
			playback.travel("attack2")
			
	if anim_name == "attack2":
		next_state = return_state
		playback.travel(return_anim)
